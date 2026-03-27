# My Neovim Configuration

A modular, fast, and extensible Neovim setup built with **Lua** and managed by **lazy.nvim**. This configuration is designed to provide a modern IDE-like experience while staying true to the speed of the terminal.

---

## Project Structure

The configuration is organized into logical modules to separate core settings, keybindings, and plugin-specific logic.

```text
.
├── init.lua                # Entry point: loads core, keymaps, and plugins
├── lazy-lock.json          # Lockfile for plugin versions
├── LICENSE                 # Project license
└── lua/
    ├── core/               # Base settings (options, globals, autocommands)
    ├── keymap/             # Keybindings organized by plugin/functionality
    │   ├── barbar_keymap.lua
    │   ├── copiar_keymap.lua
    │   ├── dbee_keymap.lua
    │   ├── general_keymap.lua
    │   ├── telescope_keymap.lua
    │   ├── toggleterm_keymap.lua
    │   └── tree_keymap.lua
    └── plugins/            # Individual plugin configurations
        ├── ...             # (Check the list below for details)


 Plugins & Credits

Special thanks to the open-source community for these amazing tools:

 UI & Aesthetics

    Nightfox.nvim: A highly customizable color scheme with great contrast.

    Lualine.nvim: A blazing fast and beautiful statusline.

    Barbar.nvim: A tabline with icons, easy navigation, and buffer management.

    Indent-blankline.nvim: Adds indentation guides to help visualize code blocks.

 Navigation & Search

    Telescope.nvim: The ultimate fuzzy finder for files, text, and Neovim internals.

    Nvim-Tree: A fast and intuitive file explorer sidebar.

    Oil.nvim: Allows editing the file system like a normal Neovim buffer.

 Coding & Productivity

    Nvim-Treesitter: High-performance syntax highlighting and code parsing.

    Nvim-Cmp: A modular completion engine for Neovim.

    Nvim-Autopairs: Automatically closes brackets, quotes, and tags.

    Comment.nvim: Smart and powerful commenting tool.

    Gitsigns.nvim: Git integration showing hunks in the sign column.

    Toggleterm.nvim: Easily manage multiple terminal windows.

 Advanced Tools

    Nvim-Dbee: An interactive database client inside Neovim.

    Nvim-DAP: Debug Adapter Protocol client for a full debugging experience.

    Nvim-Ufo: Ultra Fold Optimization for better code folding.

 Important Keymaps

The keymaps are modularized in lua/keymap/. Here are the most relevant shortcuts:
Category	Action	Shortcut
Explorer	Toggle Nvim-Tree	<Leader>e
Search	Find Files (Telescope)	<Leader>ff
Search	Live Grep (Search Text)	<Leader>fg
Terminal	Toggle Floating Terminal	<Leader>t
Tabs	Next / Previous Tab	gt / gT
Buffers	Close Current Buffer	<Leader>c
Clipboard	Copy to System Clipboard	<Leader>y
 
 Installation
Prerequisites

    Neovim (>= 0.9.0)

    Git

    Nerd Fonts (e.g., JetBrainsMono Nerd Font)

    ripgrep (Required for Telescope's live_grep)

Setup Steps

    Backup your current configuration:
    Bash

    mv ~/.config/nvim ~/.config/nvim.bak

    Clone this repository:
    Bash

    git clone <YOUR_REPO_URL> ~/.config/nvim

    Launch Neovim:
    Bash

    nvim

    The package manager (lazy.nvim) will automatically start downloading and installing all the plugins.

📄 License

This configuration is licensed under the MIT License.


¿Te gustaría que añada una sección de **"Screenshots"** para que puedas subir imágenes
