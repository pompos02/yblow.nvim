# yblow.nvim

## Install

### lazy.nvim

```lua
return {
  "pompos02/yblow.nvim",
}
```

## Usage

```lua
vim.o.background = "dark"
vim.cmd.colorscheme("yblow")
```

```lua
vim.o.background = "light"
vim.cmd.colorscheme("yblow")
```

```lua
vim.cmd.colorscheme("yblow-g")
```

```lua
vim.cmd.colorscheme("yblow-onedark")
```

`yblow` switches between the default dark and light palettes from `vim.o.background`.
`yblow-g` keeps the original green palette.
`yblow-onedark` always uses its dark palette.
