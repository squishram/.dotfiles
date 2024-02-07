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
