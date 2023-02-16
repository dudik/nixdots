#!/usr/bin/env bash

# TODO remove nix build --no-link .#homeConfigurations.samuel.activationPackage
nix build --no-link github:dudik/nixdots#homeConfigurations.samuel.activationPackage
"$(nix path-info .#homeConfigurations.samuel.activationPackage)"/activate