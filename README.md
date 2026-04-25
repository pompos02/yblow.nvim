# dolores.nvim

A Neovim colorscheme focused on simplicity and readability.

## Install

```lua
return {
  "pompos02/dolores.nvim",
}
```

## Usage

```lua
vim.o.background = "dark" -- or "light"
vim.cmd.colorscheme("dolores")
```

Available schemes:

- `dolores`: default palette, switches with `vim.o.background`
- `dolores-kif`: green palette
- `dolores-thalasses`: One Dark palette, switches with `vim.o.background`
- `dolores-sotiria-bellou`: Gruvbox palette, switches with `vim.o.background`
