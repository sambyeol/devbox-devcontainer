#!/usr/bin/env bash
sudo -n sh -c '( . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh; /nix/var/nix/profiles/default/bin/nix-daemon > /tmp/nix-daemon.log 2>&1 )'&
exec "$@"
