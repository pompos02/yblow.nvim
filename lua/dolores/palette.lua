local options = require("dolores.config").options

local palette = {
	dolores = {
		dark = {
			bg = "#181818", -- Normal, floats, signs, TabLineFill background
			c1 = "#101112", -- dim inactive-window background
			c2 = "#1b1d1e", -- inactive terminal statusline and label foreground contrast
			c3 = "#222425", -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
			c4 = "#2a2d2f", -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
			c5 = "#7a7a7a", -- line numbers, borders, fold column, separators, inlay hints
			c6 = "#a0a0a0", -- secondary UI text, inactive statusline/tabline, popup menu text
			text = "#c0c0c0", -- Normal text, identifiers, punctuation, active statusline/tabline text
			c7 = "#ffffff", -- keywords, conditionals, repeats, strong prompts
			c8 = "#f2d06b", -- warning/yellow diagnostics and terminal yellow
			c9 = "#756049", -- comments and folded text
			c10 = "#73d936", -- strings, quickfix filenames, success/green diagnostics
			c11 = "#ff5c5c", -- errors, exceptions, SpellBad, search labels
			c12 = "#96a6c8", -- functions, methods, fields, visual selection, match highlights
			c13 = "#94B0A6", -- types, imports, quickfix line/column numbers
			c14 = "#9e95c7", -- constants, booleans, numbers, labels, titles, directories
			c15 = "#b04ac0", -- CurSearch background
			c16 = "#8a8a8a", -- special comments, messages, links, cyan/teal accents
			c17 = "#1c1e1f", -- selected completion, picker, buffer, and tab backgrounds
			c18 = "#34383a", -- cursor-like surfaces and subdued rendered comments
		},
		light = {
			bg = "#ffffff", -- Normal, floats, signs, TabLineFill background
			c1 = "#fcfdfe", -- dim inactive-window background
			c2 = "#f7f9fb", -- inactive terminal statusline and label foreground contrast
			c3 = "#f2f5f7", -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
			c4 = "#e9edf1", -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
			c5 = "#a3aab0", -- line numbers, borders, fold column, separators, inlay hints
			c6 = "#5f6a72", -- secondary UI text, inactive statusline/tabline, popup menu text
			text = "#2a2f33", -- Normal text, identifiers, punctuation, active statusline/tabline text
			c7 = "#000000", -- keywords, conditionals, repeats, strong prompts
			c8 = "#c79a2b", -- warning/yellow diagnostics and terminal yellow
			c9 = "#7a848c", -- comments and folded text
			c10 = "#1faa00", -- strings, quickfix filenames, success/green diagnostics
			c11 = "#e04848", -- errors, exceptions, SpellBad, search labels
			c12 = "#3a8ee6", -- functions, methods, fields, visual selection, match highlights
			c13 = "#2f8f7c", -- types, imports, quickfix line/column numbers
			c14 = "#9a6fe8", -- constants, booleans, numbers, labels, titles, directories
			c15 = "#b33cce", -- CurSearch background
			c16 = "#6f7f88", -- special comments, messages, links, cyan/teal accents
			c17 = "#e9ecef", -- selected completion, picker, buffer, and tab backgrounds
			c18 = "#cfd6dc", -- cursor-like surfaces and subdued rendered comments
		},
	},
	kif = {
		dark = {
			bg = "#112e2a", -- Normal, floats, signs, TabLineFill background
			c1 = "#0b211d", -- dim inactive-window background
			c2 = "#163732", -- inactive terminal statusline and label foreground contrast
			c3 = "#1b413b", -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
			c4 = "#26524b", -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
			c5 = "#52756e", -- line numbers, borders, fold column, separators, inlay hints
			c6 = "#8eaca5", -- secondary UI text, inactive statusline/tabline, popup menu text
			text = "#d8c5a7", -- Normal text, identifiers, punctuation, active statusline/tabline text
			c7 = "#ffffff", -- keywords, conditionals, repeats, strong prompts
			c8 = "#f2d06b", -- warning/yellow diagnostics and terminal yellow
			c9 = "#21d813", -- comments and folded text
			c10 = "#2ea87e", -- strings, quickfix filenames, success/green diagnostics
			c11 = "#F43841", -- errors, exceptions, SpellBad, search labels
			c12 = "#c1d1e3", -- functions, methods, fields, visual selection, match highlights
			c13 = "#8cde94", -- types, imports, quickfix line/column numbers
			c14 = "#7ad0c6", -- constants, booleans, numbers, labels, titles, directories
			c15 = "#952aa3", -- CurSearch background
			c16 = "#748a92", -- special comments, messages, links, cyan/teal accents
			c17 = "#0d2622", -- selected completion, picker, buffer, and tab backgrounds
			c18 = "#3b655d", -- cursor-like surfaces and subdued rendered comments
		},
	},
	thalasses = {
		dark = {
			bg = "#282c34", -- Normal, floats, signs, TabLineFill background
			c1 = "#21252b", -- dim inactive-window background
			c2 = "#2c323c", -- inactive terminal statusline and label foreground contrast
			c3 = "#313640", -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
			c4 = "#3b4048", -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
			c5 = "#5c6370", -- line numbers, borders, fold column, separators, inlay hints
			c6 = "#7f848e", -- secondary UI text, inactive statusline/tabline, popup menu text
			text = "#abb2bf", -- Normal text, identifiers, punctuation, active statusline/tabline text
			c7 = "#e6efff", -- keywords, conditionals, repeats, strong prompts
			c8 = "#e5c07b", -- warning/yellow diagnostics and terminal yellow
			c9 = "#5c6370", -- comments and folded text
			c10 = "#98c379", -- strings, quickfix filenames, success/green diagnostics
			c11 = "#e06c75", -- errors, exceptions, SpellBad, search labels
			c12 = "#61afef", -- functions, methods, fields, visual selection, match highlights
			c13 = "#e5c07b", -- types, imports, quickfix line/column numbers
			c14 = "#c678dd", -- constants, booleans, numbers, labels, titles, directories
			c15 = "#d19a66", -- CurSearch background
			c16 = "#56b6c2", -- special comments, messages, links, cyan/teal accents
			c17 = "#2f343f", -- selected completion, picker, buffer, and tab backgrounds
			c18 = "#4b5263", -- cursor-like surfaces and subdued rendered comments
		},
		light = {
			bg = "#fafafa", -- Normal, floats, signs, TabLineFill background
			c1 = "#f0f0f1", -- dim inactive-window background
			c2 = "#e5e7eb", -- inactive terminal statusline and label foreground contrast
			c3 = "#dfe3e8", -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
			c4 = "#d7dce3", -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
			c5 = "#a0a1a7", -- line numbers, borders, fold column, separators, inlay hints
			c6 = "#696c77", -- secondary UI text, inactive statusline/tabline, popup menu text
			text = "#383a42", -- Normal text, identifiers, punctuation, active statusline/tabline text
			c7 = "#202227", -- keywords, conditionals, repeats, strong prompts
			c8 = "#c18401", -- warning/yellow diagnostics and terminal yellow
			c9 = "#a0a1a7", -- comments and folded text
			c10 = "#50a14f", -- strings, quickfix filenames, success/green diagnostics
			c11 = "#e45649", -- errors, exceptions, SpellBad, search labels
			c12 = "#4078f2", -- functions, methods, fields, visual selection, match highlights
			c13 = "#986801", -- types, imports, quickfix line/column numbers
			c14 = "#a626a4", -- constants, booleans, numbers, labels, titles, directories
			c15 = "#d18f52", -- CurSearch background
			c16 = "#0184bc", -- special comments, messages, links, cyan/teal accents
			c17 = "#e5e7eb", -- selected completion, picker, buffer, and tab backgrounds
			c18 = "#c9cdd4", -- cursor-like surfaces and subdued rendered comments
		},
	},
	stratos = {
		dark = {
			bg = "#272822", -- Normal, floats, signs, TabLineFill background
			c1 = "#1e1f1c", -- dim inactive-window background
			c2 = "#2d2e29", -- inactive terminal statusline and label foreground contrast
			c3 = "#34352f", -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
			c4 = "#3e4038", -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
			c5 = "#75715e", -- line numbers, borders, fold column, separators, inlay hints
			c6 = "#a59f85", -- secondary UI text, inactive statusline/tabline, popup menu text
			text = "#f8f8f2", -- Normal text, identifiers, punctuation, active statusline/tabline text
			c7 = "#f92672", -- keywords, conditionals, repeats, strong prompts
			c8 = "#e6db74", -- warning/yellow diagnostics and terminal yellow
			c9 = "#75715e", -- comments and folded text
			c10 = "#a6e22e", -- strings, quickfix filenames, success/green diagnostics
			c11 = "#f92672", -- errors, exceptions, SpellBad, search labels
			c12 = "#66d9ef", -- functions, methods, fields, visual selection, match highlights
			c13 = "#e6db74", -- types, imports, quickfix line/column numbers
			c14 = "#ae81ff", -- constants, booleans, numbers, labels, titles, directories
			c15 = "#fd971f", -- CurSearch background
			c16 = "#a1efe4", -- special comments, messages, links, cyan/teal accents
			c17 = "#3e3d32", -- selected completion, picker, buffer, and tab backgrounds
			c18 = "#49483e", -- cursor-like surfaces and subdued rendered comments
		},
	},
	mitropanos = {
		dark = {
			bg = "#181818", -- Normal, floats, signs, TabLineFill background
			c1 = "#101010", -- dim inactive-window background
			c2 = "#202020", -- inactive terminal statusline and label foreground contrast
			c3 = "#282828", -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
			c4 = "#383838", -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
			c5 = "#585858", -- line numbers, borders, fold column, separators, inlay hints
			c6 = "#676666", -- secondary UI text, inactive statusline/tabline, popup menu text
			text = "#e4e4ef", -- Normal text, identifiers, punctuation, active statusline/tabline text
			c7 = "#ffdd33", -- keywords, conditionals, repeats, strong prompts
			c8 = "#ffdd33", -- warning/yellow diagnostics and terminal yellow
			c9 = "#B17F3D", -- comments and folded text
			c10 = "#73d936", -- strings, quickfix filenames, success/green diagnostics
			c11 = "#f43841", -- errors, exceptions, SpellBad, search labels
			c12 = "#96a6c8", -- functions, methods, fields, visual selection, match highlights
			c13 = "#94B0A6", -- types, imports, quickfix line/column numbers
			c14 = "#9e95c7", -- constants, booleans, numbers, labels, titles, directories
			c15 = "#B17F3D", -- CurSearch background
			c16 = "#565f73", -- special comments, messages, links, cyan/teal accents
			c17 = "#282828", -- selected completion, picker, buffer, and tab backgrounds
			c18 = "#52494e", -- cursor-like surfaces and subdued rendered comments
		},
		light = {
			bg = "#ffffff", -- Normal, floats, signs, TabLineFill background
			c1 = "#f4f4ff", -- dim inactive-window background
			c2 = "#f5f5f5", -- inactive terminal statusline and label foreground contrast
			c3 = "#f4f4ff", -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
			c4 = "#e4e4e4", -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
			c5 = "#95a99f", -- line numbers, borders, fold column, separators, inlay hints
			c6 = "#565f73", -- secondary UI text, inactive statusline/tabline, popup menu text
			text = "#000000", -- Normal text, identifiers, punctuation, active statusline/tabline text
			c7 = "#d92f2f", -- keywords, conditionals, repeats, strong prompts
			c8 = "#de7a35", -- warning/yellow diagnostics and terminal yellow
			c9 = "#95a99f", -- comments and folded text
			c10 = "#4fb324", -- strings, quickfix filenames, success/green diagnostics
			c11 = "#d92f2f", -- errors, exceptions, SpellBad, search labels
			c12 = "#0000ff", -- functions, methods, fields, visual selection, match highlights
			c13 = "#14a8bb", -- types, imports, quickfix line/column numbers
			c14 = "#a022c5", -- constants, booleans, numbers, labels, titles, directories
			c15 = "#9a6b2f", -- CurSearch background
			c16 = "#6c748a", -- special comments, messages, links, cyan/teal accents
			c17 = "#e4e4e4", -- selected completion, picker, buffer, and tab backgrounds
			c18 = "#52494e", -- cursor-like surfaces and subdued rendered comments
		},
	},
	thes = {
		dark = {
			bg = "#16181a", -- Normal, floats, signs, TabLineFill background
			c1 = "#16181a", -- dim inactive-window background
			c2 = "#1e2124", -- inactive terminal statusline and label foreground contrast
			c3 = "#1e2124", -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
			c4 = "#3c4048", -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
			c5 = "#7b8496", -- line numbers, borders, fold column, separators, inlay hints
			c6 = "#7b8496", -- secondary UI text, inactive statusline/tabline, popup menu text
			text = "#ffffff", -- Normal text, identifiers, punctuation, active statusline/tabline text
			c7 = "#ffbd5e", -- keywords, conditionals, repeats, strong prompts
			c8 = "#f1ff5e", -- warning/yellow diagnostics and terminal yellow
			c9 = "#7b8496", -- comments and folded text
			c10 = "#5eff6c", -- strings, quickfix filenames, success/green diagnostics
			c11 = "#ff6e5e", -- errors, exceptions, SpellBad, search labels
			c12 = "#5ea1ff", -- functions, methods, fields, visual selection, match highlights
			c13 = "#bd5eff", -- types, imports, quickfix line/column numbers
			c14 = "#ff5ea0", -- constants, booleans, numbers, labels, titles, directories
			c15 = "#5ef1ff", -- CurSearch background
			c16 = "#ff5ef1", -- special comments, messages, links, cyan/teal accents
			c17 = "#3c4048", -- selected completion, picker, buffer, and tab backgrounds
			c18 = "#3c4048", -- cursor-like surfaces and subdued rendered comments
		},
		light = {
			bg = "#ffffff", -- Normal, floats, signs, TabLineFill background
			c1 = "#ffffff", -- dim inactive-window background
			c2 = "#eaeaea", -- inactive terminal statusline and label foreground contrast
			c3 = "#eaeaea", -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
			c4 = "#acacac", -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
			c5 = "#7b8496", -- line numbers, borders, fold column, separators, inlay hints
			c6 = "#7b8496", -- secondary UI text, inactive statusline/tabline, popup menu text
			text = "#16181a", -- Normal text, identifiers, punctuation, active statusline/tabline text
			c7 = "#16181a", -- keywords, conditionals, repeats, strong prompts
			c8 = "#997b00", -- warning/yellow diagnostics and terminal yellow
			c9 = "#7b8496", -- comments and folded text
			c10 = "#008b0c", -- strings, quickfix filenames, success/green diagnostics
			c11 = "#d11500", -- errors, exceptions, SpellBad, search labels
			c12 = "#0057d1", -- functions, methods, fields, visual selection, match highlights
			c13 = "#008c99", -- types, imports, quickfix line/column numbers
			c14 = "#a018ff", -- constants, booleans, numbers, labels, titles, directories
			c15 = "#d17c00", -- CurSearch background
			c16 = "#d100bf", -- special comments, messages, links, cyan/teal accents
			c17 = "#eaeaea", -- selected completion, picker, buffer, and tab backgrounds
			c18 = "#acacac", -- cursor-like surfaces and subdued rendered comments
		},
	},
	["sotiria-bellou"] = {
		dark = {
			bg = "#282828", -- Normal, floats, signs, TabLineFill background
			c1 = "#1b1b1b", -- dim inactive-window background
			c2 = "#32302f", -- inactive terminal statusline and label foreground contrast
			c3 = "#45403d", -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
			c4 = "#5a524c", -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
			c5 = "#7c6f64", -- line numbers, borders, fold column, separators, inlay hints
			c6 = "#a89984", -- secondary UI text, inactive statusline/tabline, popup menu text
			text = "#d4be98", -- Normal text, identifiers, punctuation, active statusline/tabline text
			c7 = "#ea6962", -- keywords, conditionals, repeats, strong prompts
			c8 = "#d8a657", -- warning/yellow diagnostics and terminal yellow
			c9 = "#928374", -- comments and folded text
			c10 = "#89b482", -- strings, quickfix filenames, success/green diagnostics
			c11 = "#ea6962", -- errors, exceptions, SpellBad, search labels
			c12 = "#7daea3", -- functions, methods, fields, visual selection, match highlights
			c13 = "#d8a657", -- types, imports, quickfix line/column numbers
			c14 = "#d3869b", -- constants, booleans, numbers, labels, titles, directories
			c15 = "#e78a4e", -- CurSearch background
			c16 = "#7daea3", -- special comments, messages, links, cyan/teal accents
			c17 = "#3c3836", -- selected completion, picker, buffer, and tab backgrounds
			c18 = "#5a524c", -- cursor-like surfaces and subdued rendered comments
		},
		light = {
			bg = "#fbf1c7", -- Normal, floats, signs, TabLineFill background
			c1 = "#f2e5bc", -- dim inactive-window background
			c2 = "#f4e8be", -- inactive terminal statusline and label foreground contrast
			c3 = "#eee0b7", -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
			c4 = "#ddccab", -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
			c5 = "#a89984", -- line numbers, borders, fold column, separators, inlay hints
			c6 = "#7c6f64", -- secondary UI text, inactive statusline/tabline, popup menu text
			text = "#654735", -- Normal text, identifiers, punctuation, active statusline/tabline text
			c7 = "#c14a4a", -- keywords, conditionals, repeats, strong prompts
			c8 = "#b47109", -- warning/yellow diagnostics and terminal yellow
			c9 = "#928374", -- comments and folded text
			c10 = "#4c7a5d", -- strings, quickfix filenames, success/green diagnostics
			c11 = "#c14a4a", -- errors, exceptions, SpellBad, search labels
			c12 = "#45707a", -- functions, methods, fields, visual selection, match highlights
			c13 = "#b47109", -- types, imports, quickfix line/column numbers
			c14 = "#945e80", -- constants, booleans, numbers, labels, titles, directories
			c15 = "#c35e0a", -- CurSearch background
			c16 = "#45707a", -- special comments, messages, links, cyan/teal accents
			c17 = "#f2e5bc", -- selected completion, picker, buffer, and tab backgrounds
			c18 = "#ddccab", -- cursor-like surfaces and subdued rendered comments
		},
	},
	glykeria = {
		dark = {
			bg = "#282828", -- Normal, floats, signs, TabLineFill background
			c1 = "#1d2021", -- dim inactive-window background
			c2 = "#32302f", -- inactive terminal statusline and label foreground contrast
			c3 = "#3c3836", -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
			c4 = "#504945", -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
			c5 = "#7c6f64", -- line numbers, borders, fold column, separators, inlay hints
			c6 = "#a89984", -- secondary UI text, inactive statusline/tabline, popup menu text
			text = "#ebdbb2", -- Normal text, identifiers, punctuation, active statusline/tabline text
			c7 = "#fb4934", -- keywords, conditionals, repeats, strong prompts
			c8 = "#fabd2f", -- warning/yellow diagnostics and terminal yellow
			c9 = "#928374", -- comments and folded text
			c10 = "#b8bb26", -- strings, quickfix filenames, success/green diagnostics
			c11 = "#fb4934", -- errors, exceptions, SpellBad, search labels
			c12 = "#83a598", -- functions, methods, fields, visual selection, match highlights
			c13 = "#fabd2f", -- types, imports, quickfix line/column numbers
			c14 = "#d3869b", -- constants, booleans, numbers, labels, titles, directories
			c15 = "#fe8019", -- CurSearch background
			c16 = "#8ec07c", -- special comments, messages, links, cyan/teal accents
			c17 = "#3c3836", -- selected completion, picker, buffer, and tab backgrounds
			c18 = "#504945", -- cursor-like surfaces and subdued rendered comments
		},
		light = {
			bg = "#fbf1c7", -- Normal, floats, signs, TabLineFill background
			c1 = "#f9f5d7", -- dim inactive-window background
			c2 = "#f3efd2", -- inactive terminal statusline and label foreground contrast
			c3 = "#f3e2b8", -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
			c4 = "#bdae93", -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
			c5 = "#a89984", -- line numbers, borders, fold column, separators, inlay hints
			c6 = "#7c6f64", -- secondary UI text, inactive statusline/tabline, popup menu text
			text = "#3c3836", -- Normal text, identifiers, punctuation, active statusline/tabline text
			c7 = "#cc241d", -- keywords, conditionals, repeats, strong prompts
			c8 = "#d79921", -- warning/yellow diagnostics and terminal yellow
			c9 = "#928374", -- comments and folded text
			c10 = "#98971a", -- strings, quickfix filenames, success/green diagnostics
			c11 = "#cc241d", -- errors, exceptions, SpellBad, search labels
			c12 = "#458588", -- functions, methods, fields, visual selection, match highlights
			c13 = "#d79921", -- types, imports, quickfix line/column numbers
			c14 = "#b16286", -- constants, booleans, numbers, labels, titles, directories
			c15 = "#d65d0e", -- CurSearch background
			c16 = "#689d6a", -- special comments, messages, links, cyan/teal accents
			c17 = "#ebdbb2", -- selected completion, picker, buffer, and tab backgrounds
			c18 = "#bdae93", -- cursor-like surfaces and subdued rendered comments
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
	if vim.g.colors_name == nil or vim.g.colors_name == "dolores" then
		return "dolores"
	end

	local family = vim.g.colors_name:match("^dolores%-(.+)$")
	if family ~= nil and palette[family] ~= nil then
		return family
	end

	return "dolores"
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
