#!/bin/sh

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

fancy_echo "Installing rvm and ruby bundler"

rvm use ruby --install --default

gem install bundler

fancy_echo "Configuring Bundler ..."
  bundle config --global
