# Neovim Keymap Reference

> Leader key: `<Space>`
> Config: `~/.config/nvim/lua/hermitfeather/`

---

## Mode Legend

| Mode | Name | How to enter |
|------|------|-------------|
| `n` | Normal | Default (press `<Esc>`) |
| `i` | Insert | `i`, `a`, `o`, etc. |
| `v` | Visual | `v` (character-wise) |
| `x` | Visual | `v`, `V`, `<C-v>` (excludes Select mode) |
| `s` | Select | `<C-g>` in Visual |
| `t` | Terminal | `:terminal` |

---

## Core (`remap.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>pv` | n | Open Netrw file explorer |
| `J` | v | Move selected line(s) down |
| `K` | v | Move selected line(s) up |
| `J` | n | Join lines (preserve cursor position) |
| `<C-d>` | n | Page down (center cursor) |
| `<C-u>` | n | Page up (center cursor) |
| `n` | n | Next search result (center cursor) |
| `N` | n | Previous search result (center cursor) |
| `=ap` | n | Reformat paragraph |
| `<leader>zig` | n | Restart LSP |
| `<leader>vwm` | n | Start vim-with-me |
| `<leader>svwm` | n | Stop vim-with-me |
| `<leader>p` | x | Paste over selection (preserve yank) |
| `<leader>y` | n, v | Yank to system clipboard |
| `<leader>Y` | n | Yank entire line to system clipboard |
| `<leader>d` | n, v | Delete to black-hole register |
| `<C-c>` | i | Escape to Normal mode |
| `Q` | n | Disable Ex mode (no-op) |
| `<C-f>` | n | Open tmux sessionizer |
| `<leader>f` | n | Format buffer (LSP) |
| `<C-k>` | n | Next quickfix entry (center cursor) |
| `<C-j>` | n | Previous quickfix entry (center cursor) |
| `<leader>k` | n | Next location list entry (center cursor) |
| `<leader>j` | n | Previous location list entry (center cursor) |
| `<leader>s` | n | Search & replace word under cursor |
| `<leader>x` | n | Make file executable (`chmod +x`) |
| `<leader>ee` | n | Insert `if err != nil { return err }` (Go) |
| `<leader>ea` | n | Insert `assert.NoError(err, "")` (Go test) |
| `<leader>ef` | n | Insert `log.Fatalf(...)` error check (Go) |
| `<leader>el` | n | Insert `logger.Error(...)` error check (Go) |
| `<leader>ca` | n | Cellular-automaton animation ("make it rain") |
| `<leader><leader>` | n | Source current file |
| `<leader>d` | n | Show diagnostics float for current line |
| `<leader>sv` | n | Vertical split |
| `<leader>sh` | n | Horizontal split |
| `<leader>ka` | n | Open Keybind Arena |

---

## Telescope (`lazy/telescope.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>pf` | n | Find files |
| `<C-p>` | n | Git files |
| `<leader>pws` | n | Grep word under cursor |
| `<leader>pWs` | n | Grep WORD under cursor (literal) |
| `<leader>ps` | n | Grep (prompt for search string) |
| `<leader>vh` | n | Help tags |

---

## Git / Fugitive (`lazy/fugitive.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>gs` | n | Git status |
| `gu` | n | `diffget //2` (take ours in conflict) |
| `gh` | n | `diffget //3` (take theirs in conflict) |
| `<leader>p` | n | Git push *(fugitive buffer only)* |
| `<leader>P` | n | Git pull --rebase *(fugitive buffer only)* |
| `<leader>t` | n | Git push -u origin *(fugitive buffer only)* |

---

## Debug / DAP (`lazy/dap.lua`)

### Controls

| Key | Mode | Action |
|-----|------|--------|
| `<F7>` | n | Disconnect |
| `<F8>` | n | Continue |
| `<F10>` | n | Step over |
| `<F11>` | n | Step into |
| `<F12>` | n | Step out |
| `<leader>b` | n | Toggle breakpoint |
| `<leader>B` | n | Set conditional breakpoint |

### UI Panels

| Key | Mode | Action |
|-----|------|--------|
| `<leader>dr` | n | Toggle REPL |
| `<leader>ds` | n | Toggle stacks |
| `<leader>dw` | n | Toggle watches |
| `<leader>db` | n | Toggle breakpoints list |
| `<leader>dS` | n | Toggle scopes |
| `<leader>dc` | n | Toggle console |

### Supported Adapters
- **LLDB** — C, C++, Rust (`/usr/bin/lldb-dap`)
- **debugpy** — Python (venv-aware)
- **delve** — Go (via `mason-nvim-dap`)

---

## Testing / Neotest (`lazy/neotest.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>tr` | n | Run nearest test |
| `<leader>tv` | n | Toggle test summary |
| `<leader>ts` | n | Run test suite |
| `<leader>td` | n | Debug nearest test |
| `<leader>to` | n | Open test output |
| `<leader>ta` | n | Run all tests in cwd |

---

## Agentic (`lazy/agentic.lua`)

ACP-compatible AI coding agent (configured: `opencode-acp`).

| Key | Mode | Action |
|-----|------|--------|
| `<C-\>` | n, v, i | Toggle Agentic chat |
| `<C-'>` | n, v | Add file/selection to Agentic context |
| `<C-,>` | n, v, i | New Agentic session |
| `<A-i>r` | n, v, i | Restore previous Agentic session |
| `<leader>ad` | n | Add current line diagnostic to Agentic |
| `<leader>aD` | n | Add all buffer diagnostics to Agentic |

---

## Snippets / LuaSnip (`lazy/snippets.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<C-s>e` | i | Expand snippet |
| `<C-s>;` | i, s | Jump to next placeholder |
| `<C-s>,` | i, s | Jump to previous placeholder |
| `<C-E>` | i, s | Cycle through choices |

---

## Zen Mode (`lazy/zenmode.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>zz` | n | Toggle Zen mode (with line numbers) |
| `<leader>zZ` | n | Toggle Zen mode (no line numbers, minimal) |

---

## Trouble (`lazy/trouble.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>xx` | n | Diagnostics (workspace) |
| `<leader>xX` | n | Diagnostics (buffer only) |
| `<leader>cs` | n | Symbols |
| `<leader>cl` | n | LSP definitions / references |
| `<leader>xL` | n | Location list |
| `<leader>xQ` | n | Quickfix list |

---

## LSP / Autocomplete (`lazy/lsp.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<C-p>` | i | Select previous completion item |
| `<C-n>` | i | Select next completion item |
| `<C-y>` | i | Confirm completion |
| `<C-Space>` | i | Trigger completion |

### Installed LSP Servers
- `lua_ls` (Lua 5.1)
- `rust_analyzer` (Rust)
- `gopls` (Go)
- `zls` (Zig, with inlay hints)

---

## Undotree (`lazy/undotree.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>u` | n | Toggle undotree |

---

## Quick Reference: Leader Key Groups

| Prefix | Category |
|--------|----------|
| `<leader>p` | Project / find / paste |
| `<leader>f` | Format |
| `<leader>s` | Search & replace / split |
|  `<leader>x` | Execute / diagnostics lists |
| `<leader>d` | Debug / delete |
| `<leader>b` | Breakpoint |
| `<leader>t` | Test / git push -u |
| `<leader>g` | Git |
| `<leader>u` | Undotree |
| `<leader>v` | Vim-with-me / help |
| `<leader>c` | Code actions / animations |
| `<leader>e` | Insert error-check snippets |
| `<leader>a` | Agentic (AI) |
| `<leader>z` | Zen mode |
| `<leader>k` | Keybind arena / location list |
| `<leader>j` | Location list prev |
| `<leader>ca` | Cellular automaton |
| `<leader><leader>` | Source file |
