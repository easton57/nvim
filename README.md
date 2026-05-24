# Neovim configuration

Previously part of my linux config, separated because I use MacOS primarily.

## Keymaps

Keymaps are defined with `vim.keymap.set(mode, key, action, opts)`. Mode can be a string or list of strings:

| Mode | How to enter | Description |
|------|-------------|-------------|
| `n` | default or `<Esc>` | Normal - navigate, edit with operators |
| `i` | `i`, `a`, `o`, etc. | Insert - type text |
| `v` | `v` | Visual (character-wise) - select text |
| `x` | `v`, `V`, `<C-v>` | Visual - same as `v` but excludes Select mode |
| `s` | `<C-g>` in Visual | Select - like Visual but typing replaces selection |
| `t` | `:terminal` then any key | Terminal - interact with shell in buffer |

To change a keymap's mode, edit the first argument of `vim.keymap.set()` in the corresponding `.lua` file.

### Core (`lua/hermitfeather/remap.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>pv` | n | Netrw file explorer |
| `J` | v | Move line down |
| `K` | v | Move line up |
| `J` | n | Join lines (preserve cursor) |
| `<C-d>` | n | Page down (center cursor) |
| `<C-u>` | n | Page up (center cursor) |
| `n` / `N` | n | Next/prev search result (center cursor) |
| `=ap` | n | Reformat paragraph |
| `<leader>zig` | n | Restart LSP |
| `<leader>vwm` / `<leader>svwm` | n | Start/stop vim-with-me |
| `<leader>p` | x | Paste over selection without losing yank |
| `<leader>y` | n,v | Yank to system clipboard |
| `<leader>Y` | n | Yank line to system clipboard |
| `<leader>d` | n,v | Delete to black hole register |
| `<C-c>` | i | Escape |
| `Q` | n | Disable Ex mode |
| `<C-f>` | n | Open tmux sessionizer |
| `<leader>f` | n | Format buffer (LSP) |
| `<C-k>` / `<C-j>` | n | Next/prev quickfix entry |
| `<leader>k` / `<leader>j` | n | Next/prev location list entry |
| `<leader>s` | n | Search and replace word under cursor |
| `<leader>x` | n | Make file executable |
| `<leader>ee` / `<leader>ef` | n | Insert Go error check / log.Fatalf |
| `<leader>ea` | n | Insert assert.NoError |
| `<leader>el` | n | Insert logger.Error |
| `<leader>ca` | n | Cellular-automaton animation |
| `<leader><leader>` | n | Source current file |
| `<leader>d` | n | Show diagnostics for line |
| `<leader>sv` / `<leader>sh` | n | Vertical/horizontal split |

### Telescope (`lua/hermitfeather/lazy/telescope.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>pf` | n | Find files |
| `<C-p>` | n | Git files |
| `<leader>pws` | n | Grep word under cursor |
| `<leader>pWs` | n | Grep WORD under cursor |
| `<leader>ps` | n | Grep string (prompt) |
| `<leader>vh` | n | Help tags |

### Git / Fugitive (`lua/hermitfeather/lazy/fugitive.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>gs` | n | Git status |
| `gu` | n | diffget //2 (ours) |
| `gh` | n | diffget //3 (theirs) |
| `<leader>p` | n | Git push (fugitive buffer) |
| `<leader>P` | n | Git pull --rebase (fugitive buffer) |
| `<leader>t` | n | Git push -u origin (fugitive buffer) |

### Debug (DAP) (`lua/hermitfeather/lazy/dap.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<F7>` | n | Disconnect |
| `<F8>` | n | Continue |
| `<F10>` | n | Step over |
| `<F11>` | n | Step into |
| `<F12>` | n | Step out |
| `<leader>b` | n | Toggle breakpoint |
| `<leader>B` | n | Conditional breakpoint |
| `<leader>dr` / `<leader>ds` / `<leader>dw` | n | Toggle REPL / stacks / watches UI |
| `<leader>db` / `<leader>dS` / `<leader>dc` | n | Toggle breakpoints / scopes / console UI |

### Testing (`lua/hermitfeather/lazy/neotest.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>tr` | n | Run nearest test |
| `<leader>tv` | n | Toggle test summary |
| `<leader>ts` | n | Run test suite |
| `<leader>td` | n | Debug nearest test |
| `<leader>to` | n | Open test output |
| `<leader>ta` | n | Run all tests in cwd |

### opencode (`lua/hermitfeather/lazy/opencode.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<C-a>` | n,x | Ask opencode |
| `<C-x>` | n,x | Select opencode |
| `<C-.>` | n,t | Toggle opencode |
| `go` | n,x | Add range to opencode |
| `goo` | n | Add line to opencode |
| `<S-C-u>` / `<S-C-d>` | n | Scroll opencode up/down |
| `+` / `-` | n | Increment/decrement under cursor |

### Snippets (`lua/hermitfeather/lazy/snippets.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<C-s>e` | i | Expand snippet |
| `<C-s>;` / `<C-s>,` | i,s | Jump forward/backward |
| `<C-E>` | i,s | Change choice |

### Zen Mode (`lua/hermitfeather/lazy/zenmode.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>zz` | n | Toggle Zen mode (with numbers) |
| `<leader>zZ` | n | Toggle Zen mode (no numbers) |

### Trouble (`lua/hermitfeather/lazy/trouble.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>xx` | n | Diagnostics |
| `<leader>xX` | n | Buffer diagnostics |
| `<leader>cs` | n | Symbols |
| `<leader>cl` | n | LSP definitions/references |
| `<leader>xL` | n | Location list |
| `<leader>xQ` | n | Quickfix list |

### LSP / Autocomplete (`lua/hermitfeather/lazy/lsp.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<C-p>` | i | Select previous completion item |
| `<C-n>` | i | Select next completion item |
| `<C-y>` | i | Confirm completion |
| `<C-Space>` | i | Trigger completion |

### Undotree (`lua/hermitfeather/lazy/undotree.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>u` | n | Toggle undotree |
