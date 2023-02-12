#!/usr/bin/env bash

case $1 in
  "system")
  echo "Rebuilding system configuration"
  sudo nixos-rebuild switch --flake .#samuel
  ;;

  "home")
  echo "Rebuilding home configuration"
  home-manager switch --flake .#samuel
  ;;

  *)
  echo "Unknown option: $1"
  ;;
esac