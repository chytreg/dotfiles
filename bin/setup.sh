#!/bin/sh -e

# Install XCode
xcode-select --install || true

# Install Homebrew
which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Ansible
which ansible || brew install ansible
