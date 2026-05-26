# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Personal dotfiles/configuration repository. All config files are symlinked from this repo into `$HOME` via `configmybox.sh`. The repo is meant to be cloned and then the setup script run to bootstrap a new machine.

## Setup

```bash
./configmybox.sh
```

This script:
1. Installs zsh if missing, sets it as default shell
2. Installs antidote (zsh plugin manager)
3. Backs up existing configs (appending timestamp), then symlinks dotfiles into `$HOME`
4. Clones TPM (tmux plugin manager) and powerlevel10k

## Architecture

- **Symlinked files** (individual): `.zshrc`, `.vimrc`, `.zsh_plugins.txt`, `.dircolors`, `.p10k.zsh`, `.tmux.conf`, `.wezterm.lua`
- **Symlinked directories**: `.config/nvim`, `.git-template`
- **Neovim**: Uses [NvChad v2.5](https://nvchad.com/) framework with lazy.nvim plugin manager. Config entry point is `.config/nvim/init.lua`. Custom config lives in `.config/nvim/lua/` — `chadrc.lua` (NvChad overrides), `mappings.lua`, `options.lua`, `plugins/init.lua`, and `configs/` (plugin-specific configs: lspconfig, conform, lazy).
- **Neovim migration in progress**: Old config (`lua/away/`) has been deleted; new NvChad-based config is in `lua/`. A `lua_backup/` directory exists with the old files.
- **Tmux**: Uses TPM with plugins (vim-tmux-navigator, resurrect, continuum, catppuccin theme). TPM is a git submodule at `.tmux/plugins/tpm`.
- **Zsh**: Powerlevel10k prompt, antidote plugin manager, plugins listed in `.zsh_plugins.txt`.
- **Terminal**: WezTerm (`.wezterm.lua`)
- **Raycast scripts**: Shell scripts in `raycast/` for Raycast launcher (base64, ascii, etc.)
- **scripts/**: Utility scripts (e.g., `chat` CLI tool)

## Key Details

- `.gitignore` excludes `nvim/plugin`, `nvim/site`, `lazy-lock.json`, and `.tmux/plugins`
- Leader key for neovim is Space
- tmux prefix is default (Ctrl-b); `|` splits horizontal, `-` splits vertical, `r` reloads config
- fzf is rebound from Ctrl-T to Ctrl-F in zsh
