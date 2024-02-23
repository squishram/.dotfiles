# Dotfiles Repository

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

```sh
pacman -S git stow
```

## Installation

1. Check out the dotfiles repo in your $HOME directory using `git`
2. Use GNU-Stow to create symlinks

```sh
git clone git@github.com/squishram/.dotfiles.git
cd .dotfiles
stow .
```

## Migration to NixOS Setup

I am currently in the process of migrating to a declarative configuration using **NixOS** with **flake** and **home-manager**. These are the things I need to to, and the software I still need to install & configure.

## To Do

- Configure a Flake
- Configure home-manager

## Software still needed

- Zathura
- Bibtex
- Biber
- Unzip
- Go
- composer
- php
- javac
- java
- julia
- python
- pip
- venv
- cargo
- luarocks
- node
- xclip (for x11) or wl-copy & wl-paste (for wayland)
- pynvim
