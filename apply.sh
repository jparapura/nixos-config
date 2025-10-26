#!/usr/bin/env bash

HOST=laptop

cp /etc/nixos/hardware-configuration.nix hosts/${HOST}/hardware-configuration.nix

sudo nixos-rebuild switch --flake .#${HOST}

git restore hosts/${HOST}/hardware-configuration.nix

