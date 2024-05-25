# My dotfiles

This directory contains the dotfiles for my macOS setup

## Requirements

Ensure you have the following installed on your system

### Brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Git

```
brew install git
```

### Stow

```
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/lalit64/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```