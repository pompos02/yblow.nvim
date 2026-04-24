local options = require("yblow.config").options

local palette = {
	yblow = {
		dark = {
			bg = "#181818", -- main background
			c1 = "#101112", -- dim background
			c2 = "#1b1d1e", -- raised surface
			c3 = "#222425", -- active surface
			c4 = "#2a2d2f", -- accent surface
			c5 = "#7a7a7a", -- muted foreground
			c6 = "#a0a0a0", -- secondary foreground
			text = "#c0c0c0", -- primary foreground
			c7 = "#ffffff", -- strong foreground
			c8 = "#f2d06b", -- warning accent
			c9 = "#756049", -- comment accent
			c10 = "#73d936", -- success accent
			c11 = "#ff5c5c", -- error accent
			c12 = "#96a6c8", -- cool highlight
			c13 = "#94B0A6", -- type accent
			c14 = "#9e95c7", -- primary accent
			c15 = "#b04ac0", -- search accent
			c16 = "#8a8a8a", -- tertiary accent
			c17 = "#1c1e1f", -- selected surface
			c18 = "#34383a", -- cursor surface
		},
		light = {
			bg = "#ffffff", -- main background
			c1 = "#fcfdfe", -- dim background
			c2 = "#f7f9fb", -- raised surface
			c3 = "#f2f5f7", -- active surface
			c4 = "#e9edf1", -- accent surface
			c5 = "#a3aab0", -- muted foreground
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
	},
	g = {
		dark = {
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
	},
	onedark = {
		dark = {
			bg = "#282c34", -- main background
			c1 = "#21252b", -- dim background
			c2 = "#2c323c", -- raised surface
			c3 = "#313640", -- active surface
			c4 = "#3b4048", -- accent surface
			c5 = "#5c6370", -- muted foreground
			c6 = "#7f848e", -- secondary foreground
			text = "#abb2bf", -- primary foreground
			c7 = "#e6efff", -- strong foreground
			c8 = "#e5c07b", -- warning accent
			c9 = "#5c6370", -- comment accent
			c10 = "#98c379", -- success accent
			c11 = "#e06c75", -- error accent
			c12 = "#61afef", -- cool highlight
			c13 = "#e5c07b", -- type accent
			c14 = "#c678dd", -- primary accent
			c15 = "#d19a66", -- search accent
			c16 = "#56b6c2", -- tertiary accent
			c17 = "#2f343f", -- selected surface
			c18 = "#4b5263", -- cursor surface
		},
		light = {
			bg = "#fafafa", -- main background
			c1 = "#f0f0f1", -- dim background
			c2 = "#e5e7eb", -- raised surface
			c3 = "#dfe3e8", -- active surface
			c4 = "#d7dce3", -- accent surface
			c5 = "#a0a1a7", -- muted foreground
			c6 = "#696c77", -- secondary foreground
			text = "#383a42", -- primary foreground
			c7 = "#202227", -- strong foreground
			c8 = "#c18401", -- warning accent
			c9 = "#a0a1a7", -- comment accent
			c10 = "#50a14f", -- success accent
			c11 = "#e45649", -- error accent
			c12 = "#4078f2", -- cool highlight
			c13 = "#986801", -- type accent
			c14 = "#a626a4", -- primary accent
			c15 = "#d18f52", -- search accent
			c16 = "#0184bc", -- tertiary accent
			c17 = "#e5e7eb", -- selected surface
			c18 = "#c9cdd4", -- cursor surface
		},
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

local function active_family()
	if vim.g.colors_name == nil or vim.g.colors_name == "yblow" then
		return "yblow"
	end

	local family = vim.g.colors_name:match("^yblow%-(.+)$")
	if family ~= nil and palette[family] ~= nil then
		return family
	end

	return "yblow"
end

local function active_mode(family)
	local background = vim.opt.background:get()
	if palette[family][background] ~= nil then
		return background
	end

	if palette[family].dark ~= nil then
		return "dark"
	end

	return "light"
end

local family = active_family()

return apply_overrides(palette[family][active_mode(family)])
