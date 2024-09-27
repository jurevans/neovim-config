# neovim-config

This repo contains my [neovim](https://neovim.io/) configuration, written in Lua, and using Packer.

My goal is that this is a simple, yet functional, IDE for the following:

- Rust
- Python
- TypeScript
- React
- Bash

## Usage

### Installation

```bash
# Set up Packer
mkdir -p ~/.local/share/nvim/site/pack/packer/start/

git clone --depth 1 https://github.com/wbthomason/packer.nvim
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Clone this repo
git clone git@github.com:jurevans/neovim-config.git ~/.config/nvim

# Launch neovim
nvim
```

Then, inside `nvim`:

```
:PackerInstall

:MasonUpdate
```

Once this completes, restart `nvim`!

### Post-installation

Run the following to ensure you have all required dependencies:

```
:checkhealth
```
