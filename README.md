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

## Lazy Nvim

### Debug options set

Use `:verbose set option?` to retrieve the last file that modified a option of NVIM.

### lua folder

The lua folder is used to store all the lua configuration files that are loaded by the init.lua file. This is a way to
organize the configuration in a modular way. Each lua file should return a table with the following structure:

```lua
return {
  -- List of plugins to install
  plugins = {
    "author/plugin",
    "author/plugin2",
  },
  -- Optional dependencies
  dependencies = {
    "author/dependency",
    "author/dependency2",
  },
  -- Configuration function
  config = function()
    -- Configuration code
  end,
}
```

The plugins list is a list of strings with the format "author/plugin". The dependencies list is a list of strings with
the format "author/dependency". The config function is a function that will be called after the plugins are installed.

The lua folder is taken as the source of the configuration and paths for lazy are relative to that folder

### Plugin folder

The plugin folder is used to store plugins or files that should be called after Lazy as finished loading. This is
useful to store set or remap files that do not return a plugin table.

### After folder

The after folder is used to store files that should be called after the plugins are loaded. This is useful to store
files that should be called after the plugins are loaded. For example, to set the colorscheme or to set the statusline,
or set specific options to a language in a language specific file that is only loaded for that language.

## Useful Vim commands and workflows

### Tab management

#### Create new tab

`:tab new`

#### Switch to next tab

`<Ctrl-NextPage>`

#### Switch to prev tab

`<Ctrl-PrevPage>`

#### Tab Close

Close all open buffers in tab or: `:tabclose`

### Window management

Use `<Ctrl-W> + Smthing ` to manage windows. E.g:

- `<Ctrl-W> + o` Close all windows except current
- `<Ctrl-W> + =` Equal all windows sizes

### Cdo

Sometimes a refactor across several files (or even lots of files) of a proect is needed.
Vim helps with that.

Steps:
- Search for the pattern to refactor using Telescope (search_grep) and variable name, class or whatever
- Send results to a qflist by hitting <C-q>
- With qflists the are lots of possibilities to do things using the :c* methos: :cnext, :cprev, :cdo
- To execute something over all the entries of the qflist use :cdo command. E.g: :cdo s/old/new/g to replace all the
  ocurrences of old with new repeteadly in all the files of the qflist
- Finally save all files modified with :wa

> Note: You can also ask for confirmation for each modificaction during the search and replace command s/old/new/g by
> adding letter c (stands for confirmation) at the end of the command. E.g: :cdo s/old/new/gc or also :%s/old/new/gc

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

## Kitty

### Shortcuts

- Increase zoom: ctrl+shift++
- Decrease zoom: ctrl+shift+-
- Reset zoom: ctrl+shift+backwards

- Increase opacity: ctrl+shift+a>m
- Decrease opacity: ctrl+shift+a>l
- Reset opacity: ctrl+shift+a>d

> Opacity shortcuts are achieved by pressing ctrl+shift+a all together, release all, and then press one of [m,l,d]

### SSH Problems and weird behavior with Zsh running hosts

Check [Kitty FAQ](https://sw.kovidgoyal.net/kitty/faq/#i-get-errors-about-the-terminal-being-unknown-or-opening-the-terminal-failing-or-functional-keys-like-arrow-keys-don-t-work)
to fix the typing problem in hosts running ZSH.

Basically just run first time
```bash
kitten ssh server
```

The following connections can be done using regular SSH and the error should be fixed

## Polybar

See format info to apply modifications:
https://github.com/polybar/polybar/wiki/Formatting#formats

## Fonts installation

To install more fonts simply copy the .ttf files to fonts/ and execute `make install-fonts`

More fonts: https://www.nerdfonts.com/

Use gucharmap utility to debug fonts icons and symbols. Go to Private User Area.

See more in: https://github.com/polybar/polybar/wiki/Fonts#finding-font-names
