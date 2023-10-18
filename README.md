# Dotfiles

## Introduction

This repository collects all the configuration files and installation rules to setup a personal development
environment (PDE).

This PDE consists in the integration of the following tools:
- Nvim
- Tmux
- Zsh (with oh-my-zsh and powerlevel10k)

## Installation

The installation of this repository is provided via Makefile rules.

See `make install-<Tab>` to see the complete list of packages that can be installed and configured using this
repository.

Current installation method has been tested under Ubuntu 18.04.

## Useful Tmux commands and worflows

### Move current pane to another session/window

Use tmux command:

join-pane -t session:window. It accepts session name as string and window as both index or string

### Break current pane into independent window

Use tmux command:

break-pane or shortcut bindkey + !

### Help

Check tmux manual `man tmux` for more information about default key bindings, configuration details, workflows,
builtin commands and many other things. It is very detailed and usefull

Bindkey + ? provides all the current keybinds taking into account the configured in .tmux.conf

## Useful Vim commands and workflows

### Search commands and quickfix

Using :vimgrep :helpgrep commands in combination with quickfix command (e.g: :cwindow, :cnext, :cprev) helps to find
patterns in files of the project (for :vimgrep) or patterns in help documentation (for :helpgrep).

The usage of each of them is simple:

:vimgrep pattern_text pattern_file

Examples

- :vimgrep keymap *.lua -> Will search keymap string in all files ended with .lua in the current directory
- :vimgrep keymap **/*.lua -> Will search keymap string in all files ended with .lua in the current directory and  subfolders recursively
- :vimgrep keymap ** -> Will search keymap in all files in the current directory and subfolders recursively

> Note that ** glob only works if its enabled in the running shell. In zsh is enabled by default, but in bash it is
> disabled by default. Execute `shopt -s globstar` to enable it.

Once the grep command has been called a new window with the first match will appear if there is any match. We can
iterate over the matches using :cnext, :cprev and even open a window with all the matches with :cwindow. The best part
of this is using :cwindow to see all the matches and easily jump to any of them.

Same applies for :helpgrep.

The usage of these commands is related with quickfix commands and calling :cnext, :cprev or :cwindow applies to every
vim command that create a quickfix list as output: vimgrep, grep, helpgrep, make.

## MobaXterm configuration

Use HackNerd Font Mono as terminal emulator font and xterm-256 color as terminal type

## Installation

* Backup your previous configuration (if any exists)

### Example: Adding an autopairs plugin

In the file: `lua/custom/plugins/autopairs.lua`, add:

```lua
-- File: lua/custom/plugins/autopairs.lua

return {
  "windwp/nvim-autopairs",
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    require("nvim-autopairs").setup {}
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end,
}
```


This will automatically install [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) and enable it on startup. For more information, see documentation for [lazy.nvim](https://github.com/folke/lazy.nvim).

### Example: Adding a file tree plugin

In the file: `lua/custom/plugins/filetree.lua`, add:

```lua
-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    require('neo-tree').setup {}
  end,
}
```

This will install the tree plugin and add the command `:Neotree` for you. You can explore the documentation at [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) for more information.

## Contribution

Pull-requests are welcome. However, since this is repository consists of a personal development environment, the
configuration is designed to match my needs and how I like to work.

Useful PR will be accepted and merged to the repository, but in the case that I'm not convinced to use the added
feature I will still leave the PR open as inspiration for other people.

Feel free to fork this repository as a starting point for your own PDE configuration!

## FAQ

* What should I do if I already have a pre-existing neovim configuration?
  * You should back it up, then delete all files associated with it.
  * This includes your existing init.lua and the neovim files in `~/.local` and `~/.nvim`  which can be deleted with
    `rm -rf ~/.local/share/nvim/` and `rm -rf ~/.nvim/`
* What if I want to "uninstall" this configuration:
  * `make uninstall` will delete all configuration files

