FROM debian:bookworm-slim

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        sudo \
        xz-utils \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/list/*

ARG NIX_VERSION
ENV NIX_VERSION=${NIX_VERSION}
COPY entrypoint.sh /usr/local/share/entrypoint.sh
RUN mkdir -p /etc/nix \
    && {\
        echo "sandbox = false"; \
        echo "experimental-features = nix-command flakes"; \
        # https://github.com/NixOS/nix/issues/5258
        echo "filter-syscalls = false"; \
    } >> /etc/nix/nix.conf \
    && curl -sL https://releases.nixos.org/nix/nix-${NIX_VERSION}/install | sh -s -- --daemon \
    && chmod +x /usr/local/share/entrypoint.sh

ARG DEVBOX_VERSION
ENV DEVBOX_VERSION=${DEVBOX_VERSION}
ENV DEVBOX_USE_VERSION=${DEVBOX_VERSION}
RUN . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh \
    && curl -sL https://get.jetpack.io/devbox | bash -s -- -f \
    && chmod 555 /usr/local/bin/devbox

ARG USERNAME=sambyeol
RUN if ! [ "${USERNAME}" = "root" ]; then \
        useradd -G sudo -m -d /home/${USERNAME} -k /etc/skel ${USERNAME}; \
        sed -i -e 's/%sudo.*/%sudo\tALL=(ALL:ALL)\tNOPASSWD:ALL/g' /etc/sudoers; \
        su ${USERNAME} -s /bin/sh -c "touch /home/${USERNAME}/.sudo_as_admin_successful"; \
    fi
USER ${USERNAME}

ENTRYPOINT [ "/usr/local/share/entrypoint.sh" ]
CMD [ "sleep", "infinity" ]
