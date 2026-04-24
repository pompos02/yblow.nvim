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

```lua
vim.cmd.colorscheme("yblow-gruvbox")
```

```lua
vim.cmd.colorscheme("yblow-github")
```

`yblow` switches between the default dark and light palettes from `vim.o.background`.
`yblow-g` keeps the original green palette.
`yblow-onedark` switches between its dark and light One Dark palettes from `vim.o.background`.
`yblow-gruvbox` switches between Gruvbox Material dark and light palettes from `vim.o.background`.
`yblow-github` switches between GitHub dark and light palettes from `vim.o.background`.
