local options = require("yblow.config").options

local palette = {
	deep_pine = "#112e2a",
	forest_floor = "#0b211d",
	pine_canopy = "#163732",
	mossy_bark = "#1b413b",
	sea_pine = "#26524b",
	sage = "#52756e",
	sea_glass = "#8eaca5",
	parchment = "#d8c5a7",
	chalk = "#ffffff",
	lime = "#21d813",
	jade = "#2ea87e",
	crimson = "#F43841",
	ice = "#c1d1e3",
	mint = "#8cde94",
	turquoise = "#7ad0c6",
	magenta = "#952aa3",
	steel = "#748a92",
	deep_shadow = "#0d2622",
	pine_crest = "#3b655d",
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

return apply_overrides(palette)
