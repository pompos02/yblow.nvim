local options = require("yara_blow.config").options

local palette = {
	abyss = "#112e2a",
	trench = "#0b211d",
	reef = "#163732",
	shelf = "#1b413b",
	tide = "#26524b",
	harbor = "#52756e",
	mist = "#8eaca5",
	sand = "#d8c5a7",
	ivory = "#ffffff",
	moss = "#21d813",
	jade = "#2ec09c",
	ember = "#F43841",
	scarlet = "#F43841",
	frost = "#c1d1e3",
	spring = "#8cde94",
	aqua = "#7ad0c6",
	slate = "#565f73",
    shadow = "#0d2622",
	veil = "#1b413b",
	crest = "#3b655d",
}

local aliases = {
	bg = "abyss",
	nc = "trench",
	base = "reef",
	surface = "shelf",
	overlay = "tide",
	muted = "harbor",
	subtle = "mist",
	text = "sand",
	red = "ember",
	gold = "ivory",
	rose = "scarlet",
	orange = "moss",
	blue = "frost",
	greyblue = "spring",
	lavender = "aqua",
	purple = "slate",
	green = "jade",
	highlight_low = "shadow",
	highlight_med = "veil",
	highlight_high = "crest",
}

local function apply_overrides(colors)
	if options.palette == nil or not next(options.palette) then
		return colors
	end

	local merged = vim.deepcopy(colors)
	for key, value in pairs(options.palette) do
		local resolved = aliases[key] or key
		merged[resolved] = value
	end

	return merged
end

local resolved = apply_overrides(palette)
for alias, target in pairs(aliases) do
	resolved[alias] = resolved[target]
end

return resolved
