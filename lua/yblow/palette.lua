local options = require("yblow.config").options

local palette = {
	yblow = {
		bg = "#112e2a", -- main background
		c1 = "#0b211d", -- dim background
		c2 = "#163732", -- raised surface
		c3 = "#1b413b", -- active surface
		c4 = "#26524b", -- accent surface
		c5 = "#52756e", -- muted foreground
		c6 = "#8eaca5", -- secondary foreground
		text = "#d8c5a7", -- primary foreground
		c7 = "#ffffff", -- strong foreground(keywords)
		c8 = "#f2d06b", -- warning accent
		c9 = "#21d813", -- comment accent
		c10 = "#2ea87e", -- success accent
		c11 = "#F43841", -- error accent
		c12 = "#c1d1e3", -- cool highlight
		c13 = "#8cde94", -- type accent
		c14 = "#7ad0c6", -- primary accent
		c15 = "#952aa3", -- search accent
		c16 = "#748a92", -- tertiary accent
		c17 = "#0d2622", -- selected surface
		c18 = "#3b655d", -- cursor surface
	},
	dark = {
		bg = "#181818", -- main background (new base)
		c1 = "#101112", -- dim background
		c2 = "#1b1d1e", -- raised surface
		c3 = "#222425", -- active surface
		c4 = "#2a2d2f", -- accent surface
		c5 = "#7a7a7a", -- muted foreground
		c6 = "#a0a0a0", -- secondary foreground
		text = "#c0c0c0", -- primary foreground (kept warm contrast)
		c7 = "#ffffff", -- strong foreground (keywords)
		c8 = "#f2d06b", -- warning accent (unchanged, already balanced)
		c9 = "#756049", -- comment accent (slightly lifted for contrast)
		c10 = "#1cad0f", -- success accent (brighter vs darker bg)
		c11 = "#ff5c5c", -- error accent (slightly softened red)
		c12 = "#96a6c8", -- cool highlight (slightly brighter)
		c13 = "#94B0A6", -- type accent (lifted)
		c14 = "#9e95c7", -- primary accent (lifted)
		c15 = "#b04ac0", -- search accent (more visible)
		c16 = "#8a8a8a", -- tertiary accent
		c17 = "#1c1e1f", -- selected surface
		c18 = "#34383a", -- cursor surface	,
	},

	light = {
		bg = "#ffffff", -- main background
		c1 = "#f5f6f7", -- dim background (very subtle separation)
		c2 = "#eef0f2", -- raised surface
		c3 = "#eaedf0", -- active surface
		c4 = "#dde1e5", -- accent surface
		c5 = "#8a9298", -- muted foreground
		c6 = "#5f6a72", -- secondary foreground
		text = "#2a2f33", -- primary foreground (high readability on white)
		c7 = "#000000", -- strong foreground (keywords)
		c8 = "#c79a2b", -- warning accent (slightly deepened for light bg)
		c9 = "#7a848c", -- comment accent (balanced mid-gray)
		c10 = "#1faa00", -- success accent (slightly darker for contrast)
		c11 = "#e04848", -- error accent (tuned for light bg)
		c12 = "#3a8ee6", -- cool highlight (more saturation for visibility)
		c13 = "#2f8f7c", -- type accent (slightly deepened)
		c14 = "#9a6fe8", -- primary accent (adjusted to avoid washout)
		c15 = "#b33cce", -- search accent (stronger contrast)
		c16 = "#6f7f88", -- tertiary accent
		c17 = "#e9ecef", -- selected surface
		c18 = "#cfd6dc", -- cursor surface
	},
}

local function apply_overrides(colors)
	if options.palette == nil or not next(options.palette) then
		return colors
	end

	local merged = vim.deepcopy(colors)
	for key, value in pairs(options.palette) do
		merged[key] = value
	end

	return merged
end

local function active_scheme()
	if vim.g.colors_name == "yblow-dark" then
		return "dark"
	end

	if vim.g.colors_name == "yblow-light" then
		return "light"
	end

	return "yblow"
end

return apply_overrides(palette[active_scheme()])
