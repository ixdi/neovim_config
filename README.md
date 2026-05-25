# The sleepy Neovim starter

This is a basic, minimal-ish jump-off point for your Neovim journey utilizing native neovim pack for package management and breaking the config up into three main components:

- `init.lua`: This is the main entry point for the config. It should be as minimal as possible, and only require the `config` directory.
- `config`: This contains the most basic editor set-up, including plain Neovim options, keymaps, and some autocmds. This is the only directory that should be `require`d in `init.lua`
- `plugins`: Each of the .lua files in this directory should serve as a vim.pack plugin spec

## Quickstart

Simply start Neovim and be up and running! (This assumes you have cloned this repository to your home directory, e.g. `~/.config/nvim`)

vim.pack will handle the bootstrapping process on first launch. If you run into any issues, try closing Neovim and restarting it again after vim.pack has performed the intial bootstrap.

## Plugins

This configuration includes the following plugins organized by category:

### Completion & Autocompletion

- **blink.cmp** (`saghen/blink.cmp`) - High-performance autocompletion with fuzzy matching
- **blink.lib** (`saghen/blink.lib`) - Blink library dependency
- **LuaSnip** (`L3MON4D3/LuaSnip`) - Snippet engine for Neovim
- **friendly-snippets** (`rafamadriz/friendly-snippets`) - Collection of preconfigured snippets
- **nvim-autopairs** (`windwp/nvim-autopairs`) - Auto-close and manage bracket pairs
- **nvim-ts-autotag** (`windwp/nvim-ts-autotag`) - Auto-close and rename HTML/XML tags

### LSP & Code Intelligence

- **nvim-lspconfig** (`neovim/nvim-lspconfig`) - Language Server Protocol configuration
- **mason.nvim** (`mason-org/mason.nvim`) - Package manager for LSP servers, DAP, and linters
- **mason-lspconfig** (`mason-org/mason-lspconfig.nvim`) - Bridge between mason and lspconfig
- **mason-update-all** (`RubixDev/mason-update-all`) - Update all Mason packages
- **conform.nvim** (`stevearc/conform.nvim`) - Code formatting framework (biome, prettierd, stylua, black, superhtml)
- **neogen** (`danymat/neogen`) - Auto-generate annotations and documentation (jsDoc, EmmyLua, Google docstrings, etc.)
- **ts-error-translator.nvim** (`dmmulroy/ts-error-translator.nvim`) - Translate TypeScript errors to readable messages

### UI & Statusline

- **bufferline.nvim** (`akinsho/bufferline.nvim`) - Tab-like buffer navigation with icons
- **mini.bufremove** (`echasnovski/mini.bufremove`) - Buffer deletion utility
- **lualine.nvim** (`nvim-lualine/lualine.nvim`) - Fast and customizable statusline
- **copilot-lualine** (`AndreM222/copilot-lualine`) - Copilot status indicator for lualine
- **noice.nvim** (`folke/noice.nvim`) - UI replacement for Neovim messages, cmdline, and popupmenu
- **nvim-colorizer.lua** (`catgoose/nvim-colorizer.lua`) - Highlight color names and codes (CSS, Tailwind, HSL, OKLCH, etc.)
- **indent-blankline.nvim** (`lukas-reineke/indent-blankline.nvim`) - Show indentation guides
- **mini.indentscope** (`echasnovski/mini.indentscope`) - Active indent guide with animation
- **vim-illuminate** (`RRethy/vim-illuminate`) - Highlight word references under cursor (LSP, Treesitter, regex)

### Navigation & File Management

- **nvim-tree.lua** (`nvim-tree/nvim-tree.lua`) - File explorer tree view
- **yazi.nvim** (`mikavilpas/yazi.nvim`) - Yazi file manager integration
- **nvim-web-devicons** (`nvim-tree/nvim-web-devicons`) - Filetype icons
- **telescope.nvim** (`nvim-telescope/telescope.nvim`) - Fuzzy finder for files, buffers, grep, and more
- **telescope-fzf-native.nvim** (`nvim-telescope/telescope-fzf-native.nvim`) - FZF backend for Telescope
- **telescope-undo.nvim** (`debugloop/telescope-undo.nvim`) - Undo history browser
- **telescope-ui-select.nvim** (`nvim-telescope/telescope-ui-select.nvim`) - UI select extension

### Git Integration

- **gitsigns.nvim** (`lewis6991/gitsigns.nvim`) - Git signs, hunk navigation, and staging
- **lazygit.nvim** (`kdheepak/lazygit.nvim`) - Integrated lazygit terminal UI

### Search & Replace

- **grug-far.nvim** (`MagicDuck/grug-far.nvim`) - Search and replace across multiple files

### Editing & Text Objects

- **Comment.nvim** (`numToStr/Comment.nvim`) - Toggle comments with `gc` operator
- **todo-comments.nvim** (`folke/todo-comments.nvim`) - Highlight and search TODO/FIXME comments
- **mini.surround** (`echasnovski/mini.surround`) - Add/delete/replace surrounding characters
- **multicursor.nvim** (`jake-stewart/multicursor.nvim`) - Multiple cursor editing
- **yanky.nvim** (`gbprod/yanky.nvim`) - Enhanced yank history and paste management
- **nvim-early-retirement** (`chrisgriesder/nvim-early-retirement`) - Auto-close unused buffers

### Treesitter & Syntax

- **nvim-treesitter** (`nvim-treesitter/nvim-treesitter`) - Syntax highlighting, indentation, and incremental selection

### Terminal & Floating Windows

- **ergoterm.nvim** (`waiting-for-dev/ergoterm.nvim`) - Terminal management (toggle, pick, send text)

### Markdown

- **live-preview.nvim** (`brianhuster/live-preview.nvim`) - Live markdown preview in browser
- **render-markdown.nvim** (`MeanderingProgrammer/render-markdown.nvim`) - Render markdown with treesitter

### Notifications & Clues

- **mini.notify** (`nvim-mini/mini.notify`) - Notification manager
- **mini.clue** (`nvim-mini/mini.clue`) - Show keymap hints and clues

### Motion & Scrolling

- **leap.nvim** (`andyg/leap.nvim`) - Fast motion plugin for jumping to any location
- **neoscroll.nvim** (`karb94/neoscroll.nvim`) - Smooth scrolling animations

### AI & Copilot

- **copilot.vim** (`github/copilot.vim`) - GitHub Copilot integration

### Themes

- **nordic.nvim** (`AlexvZyl/nordic.nvim`) - Nord-based colorscheme

---

## Keymaps

### General Keymaps

| Keymap       | Mode   | Description                 |
| ------------ | ------ | --------------------------- |
| `jj`         | Insert | Exit insert mode            |
| `<leader>y`  | Normal | Open Yazi file manager      |
| `,w`         | Normal | Write/Save buffer           |
| `,qq`        | Normal | Quit                        |
| `,qa`        | Normal | Quit all                    |
| `,m`         | Normal | Clear search highlights     |
| `<leader>pu` | Normal | Update plugins + Mason + TS |
| `<S-l>`      | Normal | Next buffer                 |
| `<S-h>`      | Normal | Previous buffer             |
| `<`          | Visual | Decrease indent             |
| `>`          | Visual | Increase indent             |

### Diagnostics

| Keymap       | Mode   | Description                   |
| ------------ | ------ | ----------------------------- |
| `<leader>ee` | Normal | Show diagnostics under cursor |
| `<leader>en` | Normal | Next diagnostic               |
| `<leader>ep` | Normal | Previous diagnostic           |

### LSP

| Keymap             | Mode          | Description     |
| ------------------ | ------------- | --------------- |
| `<leader>a`        | Normal/Visual | Code action     |
| `gi`               | Normal        | Implementation  |
| `<leader><leader>` | Normal        | Hover           |
| `grn`              | Normal        | Rename          |
| `gf`               | Normal        | References      |
| `gd`               | Normal        | Definition      |
| `gO`               | Normal        | Document symbol |
| `gs`               | Normal        | Signature help  |

### Leap (Motion)

| Keymap      | Mode                   | Description          |
| ----------- | ---------------------- | -------------------- |
| `<leader>s` | Normal/Visual/Operator | Leap to any location |
| `<leader>S` | Normal                 | Leap across windows  |

### Telescope (Fuzzy Finder)

| Keymap      | Mode   | Description                    |
| ----------- | ------ | ------------------------------ |
| `f`         | Normal | Find files                     |
| `<Space>sh` | Normal | Search help                    |
| `<Space>sk` | Normal | Search keymaps                 |
| `<Space>ss` | Normal | Select Telescope command       |
| `<Space>sw` | Normal | Search current word            |
| `<Space>f`  | Normal | Live grep                      |
| `<Space>sd` | Normal | Search diagnostics             |
| `<Space>l`  | Normal | Resume last search             |
| `<Space>u`  | Normal | Search recent files            |
| `<Space>b`  | Normal | Find buffers                   |
| `<Space>/`  | Normal | Fuzzy search in current buffer |
| `<Space>s/` | Normal | Live grep in open files        |
| `<Space>sn` | Normal | Search Neovim config files     |
| `<Space>z`  | Normal | Undo history                   |

### Buffer Management

| Keymap        | Mode   | Description                       |
| ------------- | ------ | --------------------------------- |
| `<leader>bd`  | Normal | Delete buffer                     |
| `<leader>bD`  | Normal | Delete buffer (force)             |
| `<leader>bda` | Normal | Delete all buffers except current |
| `<leader>bp`  | Normal | Toggle buffer pin                 |
| `<leader>bP`  | Normal | Delete non-pinned buffers         |

### File Explorer (nvim-tree)

| Keymap    | Mode          | Description      |
| --------- | ------------- | ---------------- |
| `ee`      | Normal        | Toggle nvim-tree |
| `,f`      | Normal        | Focus nvim-tree  |
| `<space>` | Normal (tree) | Open file        |
| `+`       | Normal (tree) | Vertical split   |
| `-`       | Normal (tree) | Horizontal split |
| `R`       | Normal (tree) | Reload tree      |

### File Manager (Yazi)

| Keymap  | Mode (inside Yazi) | Description                     |
| ------- | ------------------ | ------------------------------- |
| `<F1>`  | Normal             | Show help                       |
| `<C-v>` | Normal             | Open file in vertical split     |
| `<C-x>` | Normal             | Open file in horizontal split   |
| `<C-t>` | Normal             | Open file in new tab            |
| `<C-s>` | Normal             | Grep in directory (Telescope)   |
| `<C-g>` | Normal             | Replace in directory (grug-far) |
| `<Tab>` | Normal             | Cycle open buffers              |
| `<C-y>` | Normal             | Copy relative path to selection |
| `<C-q>` | Normal             | Send to quickfix list           |
| `<C-\>` | Normal             | Change working directory        |
| `<C-o>` | Normal             | Open and pick window            |

### Git (gitsigns)

| Keymap        | Mode     | Description             |
| ------------- | -------- | ----------------------- |
| `<Space>g`    | Normal   | Open LazyGit            |
| `]c`          | Normal   | Next git hunk           |
| `[c`          | Normal   | Previous git hunk       |
| `<leader>ghs` | Normal   | Stage hunk              |
| `<leader>ghr` | Normal   | Reset hunk              |
| `<leader>ghS` | Normal   | Stage buffer            |
| `<leader>ghu` | Normal   | Undo stage hunk         |
| `<leader>ghR` | Normal   | Reset buffer            |
| `<leader>ghp` | Normal   | Preview hunk            |
| `<leader>ghb` | Normal   | Blame line              |
| `<leader>gtb` | Normal   | Toggle line blame       |
| `<leader>ghd` | Normal   | Diff this               |
| `<leader>ghD` | Normal   | Diff this (previous)    |
| `<leader>gtd` | Normal   | Toggle deleted          |
| `gih`         | Operator | Select hunk text object |

### Comments

| Keymap        | Mode          | Description                          |
| ------------- | ------------- | ------------------------------------ |
| `gc`          | Normal/Visual | Toggle line comment (operator)       |
| `gcc`         | Normal        | Toggle comment on current line       |
| `gb`          | Normal/Visual | Toggle block comment (operator)      |
| `gbc`         | Normal        | Toggle block comment on current line |
| `gco`         | Normal        | Add comment below                    |
| `gcO`         | Normal        | Add comment above                    |
| `gcA`         | Normal        | Add comment at end of line           |
| `<leader>tcn` | Normal        | Next TODO comment                    |
| `<leader>ct`  | Normal        | Search TODOs via Telescope           |
| `<leader>cT`  | Normal        | Search TODO/FIX/FIXME via Telescope  |
| `<leader>cd`  | Normal        | Generate documentation (Neogen)      |

### Surround (mini.surround)

| Keymap | Mode          | Description              |
| ------ | ------------- | ------------------------ |
| `sa`   | Normal/Visual | Add surrounding          |
| `sd`   | Normal        | Delete surrounding       |
| `sr`   | Normal        | Replace surrounding      |
| `sf`   | Normal        | Find surrounding (right) |
| `sF`   | Normal        | Find surrounding (left)  |
| `sh`   | Normal        | Highlight surrounding    |
| `sn`   | Normal        | Update n_lines           |

### Multicursor

| Keymap             | Mode          | Description                  |
| ------------------ | ------------- | ---------------------------- |
| `<leader><Up>`     | Normal/Visual | Add cursor above             |
| `<leader><Down>`   | Normal/Visual | Add cursor below             |
| `<leader><C-Up>`   | Normal/Visual | Skip cursor above            |
| `<leader><C-Down>` | Normal/Visual | Skip cursor below            |
| `<C-n>`            | Normal/Visual | Add cursor to next match     |
| `<C-k>`            | Normal/Visual | Skip next match              |
| `<C-S-n>`          | Normal/Visual | Add cursor to previous match |
| `<C-S-k>`          | Normal/Visual | Skip previous match          |
| `<C-a>`            | Normal/Visual | Add cursors to all matches   |
| `<C-q>`            | Normal/Visual | Toggle cursors               |
| `<C-LeftMouse>`    | Normal        | Add/remove cursor with click |
| `<Left>`           | Normal/Visual | Previous cursor (layer)      |
| `<Right>`          | Normal/Visual | Next cursor (layer)          |
| `<leader>x`        | Normal/Visual | Delete main cursor (layer)   |
| `<Esc>`            | Normal        | Enable/clear cursors (layer) |

### Yanky (Yank History)

| Keymap       | Mode          | Description                     |
| ------------ | ------------- | ------------------------------- |
| `p`          | Normal/Visual | Put after (charwise)            |
| `P`          | Normal/Visual | Put before (charwise)           |
| `<M-p>`      | Normal        | Previous yank entry             |
| `<M-n>`      | Normal        | Next yank entry                 |
| `<C-p>`      | Normal        | Put after with reindent         |
| `=P`         | Normal        | Put before with reindent        |
| `<leader>p`  | Normal        | Open yank history (Telescope)   |
| `<leader>yc` | Normal        | Clear yank history              |
| `y`          | Normal/Visual | Yank (preserve cursor position) |

### Terminal (ergoterm)

| Keymap       | Mode          | Description           |
| ------------ | ------------- | --------------------- |
| `<leader>tt` | Normal        | New terminal          |
| `<leader>tp` | Normal        | Pick terminal         |
| `<leader>ts` | Normal/Visual | Send text to terminal |

### Markdown

| Keymap      | Mode   | Description            |
| ----------- | ------ | ---------------------- |
| `<Space>md` | Normal | Start live preview     |
| `<Space>mv` | Normal | Toggle markdown render |

### Notifications

| Keymap       | Mode   | Description               |
| ------------ | ------ | ------------------------- |
| `<leader>nh` | Normal | Show notification history |
| `<leader>na` | Normal | Show all notifications    |

### Search & Replace

| Keymap      | Mode   | Description                 |
| ----------- | ------ | --------------------------- |
| `<Space>fr` | Normal | Replace in files (grug-far) |

### blink.cmp (Completion Menu)

| Keymap             | Mode   | Description                |
| ------------------ | ------ | -------------------------- |
| `<C-Space>`        | Insert | Open menu / show docs      |
| `<C-n>` / `<Down>` | Insert | Select next item           |
| `<C-p>` / `<Up>`   | Insert | Select previous item       |
| `<C-y>`            | Insert | Accept selected completion |
| `<C-e>`            | Insert | Hide menu                  |
| `<C-k>`            | Insert | Toggle signature help      |
| `<Esc>`            | Insert | Cancel / fallback          |

### Neoscroll (Smooth Scrolling)

Smooth scrolling animations are enabled for the following default keys:

| Keymap  | Description           |
| ------- | --------------------- |
| `<C-u>` | Scroll half page up   |
| `<C-d>` | Scroll half page down |
| `<C-b>` | Scroll full page up   |
| `<C-f>` | Scroll full page down |
| `<C-y>` | Scroll up one line    |
| `<C-e>` | Scroll down one line  |
| `zt`    | Scroll line to top    |
| `zz`    | Scroll line to center |
| `zb`    | Scroll line to bottom |

### mini.clue (Keymap Hints)

Keymap hints are automatically shown when pressing these prefixes:

| Prefix        | Modes          | Description          |
| ------------- | -------------- | -------------------- |
| `<Leader>`    | Normal/Visual  | Leader key sequences |
| `[` / `]`     | Normal         | Bracket navigation   |
| `g`           | Normal/Visual  | g-key mappings       |
| `'` / `` ` `` | Normal/Visual  | Marks                |
| `"`           | Normal/Visual  | Registers            |
| `<C-r>`       | Insert/Cmdline | Registers            |
| `<C-w>`       | Normal         | Window commands      |
| `z`           | Normal/Visual  | Fold/view commands   |
| `<C-x>`       | Insert         | Built-in completion  |
