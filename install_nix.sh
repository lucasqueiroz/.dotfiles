#!/bin/sh

echo "Installing Nix for multi-user..."

sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon