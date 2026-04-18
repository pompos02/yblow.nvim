local p = require("yblow.palette")
local config = require("yblow.config")

local bg_base = p.c2
if config.options.styles.transparency then
	bg_base = "NONE"
end

return {
	normal = {
		a = { bg = p.c14, fg = p.bg, gui = "bold" },
		b = { bg = p.c3, fg = p.text },
		c = { bg = bg_base, fg = p.text },
	},
	insert = {
		a = { bg = p.c12, fg = p.bg, gui = "bold" },
		b = { bg = p.c3, fg = p.text },
		c = { bg = bg_base, fg = p.text },
	},
	visual = {
		a = { bg = p.c15, fg = p.text, gui = "bold" },
		b = { bg = p.c3, fg = p.text },
		c = { bg = bg_base, fg = p.text },
	},
	replace = {
		a = { bg = p.c11, fg = p.bg, gui = "bold" },
		b = { bg = p.c3, fg = p.text },
		c = { bg = bg_base, fg = p.text },
	},
	command = {
		a = { bg = p.c8, fg = p.bg, gui = "bold" },
		b = { bg = p.c3, fg = p.text },
		c = { bg = bg_base, fg = p.text },
	},
	inactive = {
		a = { bg = bg_base, fg = p.c12, gui = "bold" },
		b = { bg = bg_base, fg = p.c6 },
		c = { bg = bg_base, fg = p.c6 },
	},
}
