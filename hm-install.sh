#!/usr/bin/env bash

nix build --no-link .#homeConfigurations.samuel.activationPackage
"$(nix path-info .#homeConfigurations.samuel.activationPackage)"/activate