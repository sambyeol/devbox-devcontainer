#!/usr/bin/env bash
( . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh; sudo /nix/var/nix/profiles/default/bin/nix-daemon > /tmp/nix-daemon.log 2>&1 ) &
exec "$@"
