local M = {}
local config = require("yblow.config")

local function set_highlights()
	local utilities = require("yblow.utilities")
	local palette = require("yblow.palette")
	local styles = config.options.styles

	local groups = {}
	for group, color in pairs(config.options.groups) do
		groups[group] = utilities.parse_color(color)
	end

	local function make_border(fg)
		fg = utilities.parse_color(fg or groups.border)
		return {
			fg = fg,
			bg = (config.options.extend_background_behind_borders and not styles.transparency) and palette.deep_pine
				or "NONE",
		}
	end

	local highlights = {}
	local legacy_highlights = {
		["@attribute.diff"] = { fg = palette.chalk },
		["@boolean"] = { link = "Boolean" },
		["@class"] = { fg = palette.ice },
		["@conditional"] = { link = "Conditional" },
		["@field"] = { fg = palette.ice },
		["@include"] = { link = "Include" },
		["@interface"] = { link = "Type" },
		["@macro"] = { link = "Macro" },
		["@method"] = { fg = palette.ice },
		["@namespace"] = { link = "Include" },
		["@number"] = { link = "Number" },
		["@parameter"] = { fg = palette.parchment },
		["@preproc"] = { link = "PreProc" },
		["@punctuation"] = { fg = palette.parchment },
		["@regexp"] = { link = "String" },
		["@repeat"] = { link = "Repeat" },
		["@storageclass"] = { link = "StorageClass" },
		["@symbol"] = { link = "Identifier" },
		["@text"] = { fg = palette.parchment },
		["@text.danger"] = { fg = groups.error },
		["@text.diff.add"] = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
		["@text.diff.delete"] = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
		["@text.emphasis"] = {},
		["@text.environment"] = { link = "Macro" },
		["@text.environment.name"] = { link = "Type" },
		["@text.math"] = { link = "Special" },
		["@text.note"] = { link = "SpecialComment" },
		["@text.strike"] = { strikethrough = true },
		["@text.strong"] = { bold = styles.bold },
		["@text.title"] = { link = "Title" },
		["@text.title.1.markdown"] = { link = "markdownH1" },
		["@text.title.1.marker.markdown"] = { link = "markdownH1Delimiter" },
		["@text.title.2.markdown"] = { link = "markdownH2" },
		["@text.title.2.marker.markdown"] = { link = "markdownH2Delimiter" },
		["@text.title.3.markdown"] = { link = "markdownH3" },
		["@text.title.3.marker.markdown"] = { link = "markdownH3Delimiter" },
		["@text.title.4.markdown"] = { link = "markdownH4" },
		["@text.title.4.marker.markdown"] = { link = "markdownH4Delimiter" },
		["@text.title.5.markdown"] = { link = "markdownH5" },
		["@text.title.5.marker.markdown"] = { link = "markdownH5Delimiter" },
		["@text.title.6.markdown"] = { link = "markdownH6" },
		["@text.title.6.marker.markdown"] = { link = "markdownH6Delimiter" },
		["@text.underline"] = { underline = true },
		["@text.uri"] = { fg = groups.link },
		["@text.warning"] = { fg = groups.warn },
		["@todo"] = { link = "Todo" },

		IndentBlanklineChar = { fg = palette.sage, nocombine = true },
		IndentBlanklineSpaceChar = { fg = palette.sage, nocombine = true },
		IndentBlanklineSpaceCharBlankline = { fg = palette.sage, nocombine = true },
	}
	local default_highlights = {
		ColorColumn = { bg = palette.pine_canopy },
		Conceal = { bg = "NONE" },
		CurSearch = { fg = "NONE", bg = palette.magenta, bold = styles.bold },
		Cursor = { fg = palette.parchment, bg = palette.pine_crest },
		CursorColumn = { bg = palette.mossy_bark },
		CursorLine = { bg = palette.mossy_bark },
		CursorLineNr = { fg = palette.parchment, bg = palette.deep_pine, bold = styles.bold },
		DiffAdd = { bg = groups.git_add, blend = 20 },
		DiffChange = { bg = groups.git_change, blend = 20 },
		DiffDelete = { bg = groups.git_delete, blend = 20 },
		DiffText = { bg = groups.git_text, blend = 40 },
		diffAdded = { link = "DiffAdd" },
		diffChanged = { link = "DiffChange" },
		diffRemoved = { link = "DiffDelete" },
		Directory = { fg = palette.turquoise, bold = styles.bold },
		EndOfBuffer = { fg = palette.sage, bg = palette.deep_pine },
		ErrorMsg = { fg = groups.error, bold = styles.bold },
		FloatBorder = { fg = palette.sage, bg = palette.deep_pine },
		FloatTitle = { fg = palette.parchment, bg = palette.deep_pine },
		FoldColumn = { fg = palette.sage, bg = palette.deep_pine },
		Folded = { fg = palette.lime, bg = palette.steel, blend = 50 },
		IncSearch = { fg = "NONE", bg = palette.magenta },
		LineNr = { fg = palette.sage, bg = palette.deep_pine },
		MatchParen = { fg = palette.ice, bg = palette.ice, blend = 25 },
		ModeMsg = { fg = palette.sea_glass },
		MoreMsg = { fg = palette.steel },
		NonText = { fg = palette.sea_pine },
		Normal = { fg = palette.parchment, bg = palette.deep_pine },
		NormalFloat = { fg = palette.parchment, bg = palette.deep_pine },
		NormalNC = { fg = palette.parchment, bg = palette.deep_pine },
		NvimInternalError = { link = "ErrorMsg" },
		Pmenu = { fg = palette.sea_glass, bg = palette.mossy_bark },
		PmenuExtra = { fg = palette.sage, bg = palette.deep_pine },
		PmenuExtraSel = { fg = palette.sea_glass, bg = palette.deep_shadow },
		PmenuKind = { fg = palette.turquoise, bg = palette.deep_pine },
		PmenuKindSel = { fg = palette.sea_glass, bg = palette.deep_shadow },
		PmenuMatch = { fg = palette.ice },
		PmenuMatchSel = { fg = palette.ice, bg = palette.deep_shadow },
		PmenuSbar = { bg = palette.mossy_bark },
		PmenuSel = { fg = palette.parchment, bg = palette.deep_shadow },
		PmenuThumb = { bg = palette.sea_glass },
		Question = { fg = palette.chalk },
		qfFileName = { fg = palette.jade },
		qfLineNr = { fg = palette.mint },
		qfSeparator1 = { fg = palette.sage },
		qfSeparator2 = { fg = palette.sage },
		YaraQuickfixRow = { fg = palette.ice },
		YaraQuickfixCol = { fg = palette.mint },
		QuickFixLine = { bg = palette.sea_pine },
		RedrawDebugClear = { fg = palette.pine_canopy, bg = palette.chalk },
		RedrawDebugComposed = { fg = palette.pine_canopy, bg = palette.ice },
		RedrawDebugRecompose = { fg = palette.pine_canopy, bg = palette.crimson },
		Search = { fg = "NONE", bg = palette.magenta, blend = 40 },
		SignColumn = { fg = palette.parchment, bg = palette.deep_pine },
		SpecialKey = { fg = palette.turquoise },
		SpellBad = { sp = palette.crimson, undercurl = true },
		SpellCap = { sp = palette.sea_glass, undercurl = true },
		SpellLocal = { sp = palette.sea_glass, undercurl = true },
		SpellRare = { sp = palette.sea_glass, undercurl = true },
		StatusLine = { fg = palette.parchment, bg = palette.sea_pine },
		StatusLineNC = { fg = palette.sea_glass, bg = palette.pine_canopy },
		StatusLineTerm = { fg = palette.parchment, bg = palette.sea_pine },
		StatusLineTermNC = { fg = palette.sea_glass, bg = palette.pine_canopy },
		Substitute = { link = "IncSearch" },
		TabLine = { fg = palette.sea_glass, bg = palette.mossy_bark },
		TabLineFill = { bg = palette.deep_pine },
		TabLineSel = { fg = palette.parchment, bg = palette.sea_pine, bold = styles.bold },
		Title = { fg = palette.turquoise, bold = styles.bold },
		VertSplit = { fg = groups.border },
		Visual = { bg = palette.ice, blend = 38 },
		YankHighlight = { fg = palette.parchment, bg = palette.turquoise, blend = 50 },
		WarningMsg = { fg = groups.warn, bold = styles.bold },
		WildMenu = { link = "IncSearch" },
		WinBar = { fg = palette.sea_glass, bg = palette.deep_pine },
		WinBarNC = { fg = palette.sage, bg = palette.deep_pine, blend = 60 },
		WinSeparator = { fg = groups.border },

		DiagnosticError = { fg = groups.error },
		DiagnosticHint = { fg = groups.hint },
		DiagnosticInfo = { fg = groups.info },
		DiagnosticOk = { fg = groups.ok },
		DiagnosticWarn = { fg = groups.warn },
		DiagnosticDefaultError = { link = "DiagnosticError" },
		DiagnosticDefaultHint = { link = "DiagnosticHint" },
		DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
		DiagnosticDefaultOk = { link = "DiagnosticOk" },
		DiagnosticDefaultWarn = { link = "DiagnosticWarn" },
		DiagnosticFloatingError = { link = "DiagnosticError" },
		DiagnosticFloatingHint = { link = "DiagnosticHint" },
		DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
		DiagnosticFloatingOk = { link = "DiagnosticOk" },
		DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
		DiagnosticSignError = { link = "DiagnosticError" },
		DiagnosticSignHint = { link = "DiagnosticHint" },
		DiagnosticSignInfo = { link = "DiagnosticInfo" },
		DiagnosticSignOk = { link = "DiagnosticOk" },
		DiagnosticSignWarn = { link = "DiagnosticWarn" },
		DiagnosticUnderlineError = { sp = groups.error, undercurl = true },
		DiagnosticUnderlineHint = { sp = groups.hint, undercurl = true },
		DiagnosticUnderlineInfo = { sp = groups.info, undercurl = true },
		DiagnosticUnderlineOk = { sp = groups.ok, undercurl = true },
		DiagnosticUnderlineWarn = { sp = groups.warn, undercurl = true },
		DiagnosticVirtualTextError = { fg = groups.error, bg = groups.error, blend = 10 },
		DiagnosticVirtualTextHint = { fg = groups.hint, bg = groups.hint, blend = 10 },
		DiagnosticVirtualTextInfo = { fg = groups.info, bg = groups.info, blend = 10 },
		DiagnosticVirtualTextOk = { fg = groups.ok, bg = groups.ok, blend = 10 },
		DiagnosticVirtualTextWarn = { fg = groups.warn, bg = groups.warn, blend = 10 },

		Boolean = { fg = palette.parchment },
		Character = { link = "String" },
		Comment = { fg = palette.lime },
		Conditional = { fg = palette.chalk },
		Constant = { fg = palette.turquoise },
		Debug = { fg = palette.crimson },
		Define = { fg = palette.parchment },
		Delimiter = { fg = palette.parchment },
		Error = { fg = palette.crimson },
		Exception = { fg = palette.crimson },
		Float = { link = "Type" },
		Function = { fg = palette.ice },
		Identifier = { fg = palette.parchment },
		Include = { fg = palette.parchment },
		Keyword = { fg = palette.chalk, bold = true },
		Label = { fg = palette.turquoise },
		LspCodeLens = { fg = palette.sea_glass },
		LspCodeLensSeparator = { fg = palette.sage },
		LspInlayHint = { fg = palette.sage, bg = palette.sage, blend = 10 },
		LspReferenceRead = { bold = true },
		LspReferenceText = { bold = true },
		LspReferenceWrite = { bold = true },
		Macro = { fg = palette.parchment },
		Number = { fg = palette.turquoise },
		Operator = { fg = palette.parchment },
		PreCondit = { fg = palette.parchment },
		PreProc = { link = "PreCondit" },
		Repeat = { fg = palette.chalk },
		Special = { fg = palette.turquoise },
		SpecialChar = { link = "Special" },
		SpecialComment = { fg = palette.steel },
		Statement = { fg = palette.ice, bold = styles.bold },
		StorageClass = { fg = palette.ice },
		String = { fg = palette.jade },
		Structure = { fg = palette.chalk },
		Tag = { fg = palette.parchment },
		Todo = { fg = palette.crimson, bg = palette.crimson, blend = 20 },
		Type = { fg = palette.mint },
		TypeDef = { link = "Type" },
		Underlined = { fg = palette.steel, underline = true },

		healthError = { fg = groups.error },
		healthSuccess = { fg = groups.info },
		healthWarning = { fg = groups.warn },

		htmlArg = { fg = palette.parchment },
		htmlBold = { bold = styles.bold },
		htmlEndTag = { fg = palette.parchment },
		htmlH1 = { link = "markdownH1" },
		htmlH2 = { link = "markdownH2" },
		htmlH3 = { link = "markdownH3" },
		htmlH4 = { link = "markdownH4" },
		htmlH5 = { link = "markdownH5" },
		htmlItalic = {},
		htmlLink = { link = "markdownUrl" },
		htmlTag = { fg = palette.parchment },
		htmlTagN = { fg = palette.parchment },
		htmlTagName = { fg = palette.parchment },

		markdownDelimiter = { fg = palette.parchment },
		markdownH1 = { fg = groups.h1, bold = styles.bold },
		markdownH1Delimiter = { link = "markdownH1" },
		markdownH2 = { fg = groups.h2, bold = styles.bold },
		markdownH2Delimiter = { link = "markdownH2" },
		markdownH3 = { fg = groups.h3, bold = styles.bold },
		markdownH3Delimiter = { link = "markdownH3" },
		markdownH4 = { fg = groups.h4, bold = styles.bold },
		markdownH4Delimiter = { link = "markdownH4" },
		markdownH5 = { fg = groups.h5, bold = styles.bold },
		markdownH5Delimiter = { link = "markdownH5" },
		markdownH6 = { fg = groups.h6, bold = styles.bold },
		markdownH6Delimiter = { link = "markdownH6" },
		markdownLinkText = { link = "markdownUrl" },
		markdownUrl = { fg = groups.link, sp = groups.link, underline = true },
		markdownListMarker = { fg = palette.chalk },

		mkdCode = { fg = palette.turquoise },
		mkdCodeDelimiter = { fg = palette.crimson },
		mkdCodeEnd = { fg = palette.turquoise },
		mkdCodeStart = { fg = palette.turquoise },
		mkdFootnotes = { fg = palette.turquoise },
		mkdID = { fg = palette.turquoise, underline = true },
		mkdInlineURL = { link = "markdownUrl" },
		mkdLink = { link = "markdownUrl" },
		mkdLinkDef = { link = "markdownUrl" },
		mkdListItemLine = { fg = palette.parchment },
		mkdRule = { fg = palette.sea_glass },
		mkdURL = { link = "markdownUrl" },

		["@variable"] = { fg = palette.parchment },
		["@variable.builtin"] = { link = "@variable" },

		["@module"] = { fg = palette.parchment },
		["@label"] = { link = "Label" },

		["@string"] = { link = "String" },
		["@string.regexp"] = { fg = palette.turquoise },
		["@string.escape"] = { fg = palette.ice },
		["@string.special"] = { link = "String" },
		["@string.special.symbol"] = { link = "Identifier" },
		["@string.special.url"] = { fg = groups.link },

		["@character"] = { link = "Character" },
		["@character.special"] = { link = "Character" },

		["@boolean"] = { link = "Boolean" },
		["@number"] = { link = "Number" },
		["@number.float"] = { link = "Number" },
		["@float"] = { link = "Number" },

		["@type"] = { link = "Type" },
		["@type.builtin"] = { link = "Type" },

		["@attribute"] = { fg = palette.parchment },

		["@function"] = { link = "Function" },
		["@function.call"] = { link = "@text" },
		["@function.builtin"] = { link = "@text" },
		["@function.macro"] = { link = "@text" },

		["@function.method"] = { link = "@text" },

		["@constructor"] = { link = "Function" },
		["@operator"] = { link = "Operator" },

		["@keyword"] = { link = "Keyword" },
		["@keyword.include"] = { fg = palette.parchment },
		["@keyword.import"] = { fg = palette.mint },
		-- ["@keyword.exception"] = { fg = palette.crimson },

		["@punctuation"] = { fg = palette.parchment },
		["@punctuation.delimiter"] = { link = "@punctuation" },
		["@punctuation.bracket"] = { link = "@punctuation" },
		["@punctuation.special"] = { link = "@punctuation" },
		["@punctuation.special.bash"] = { fg = palette.turquoise },

		["@comment"] = { link = "Comment" },

		["@comment.error"] = { fg = groups.error },
		["@comment.warning"] = { fg = groups.warn },
		["@comment.todo"] = { fg = groups.todo, bg = groups.todo, blend = 15 },
		["@comment.hint"] = { fg = groups.hint, bg = groups.hint, blend = 15 },
		["@comment.info"] = { fg = groups.info, bg = groups.info, blend = 15 },
		["@comment.note"] = { fg = groups.note, bg = groups.note, blend = 15 },

		["@markup.strong"] = { bold = styles.bold },
		["@markup.italic"] = {},
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },

		["@markup.heading"] = { fg = palette.turquoise, bold = styles.bold },

		["@markup.quote"] = { fg = palette.parchment },
		["@markup.math"] = { link = "Special" },
		["@markup.environment"] = { link = "Macro" },
		["@markup.environment.name"] = { link = "@type" },

		["@markup.link.markdown_inline"] = { fg = palette.sea_glass },
		["@markup.link.label.markdown_inline"] = { fg = palette.turquoise },
		["@markup.link.url"] = { fg = groups.link },

		["@markup.raw.delimiter.markdown"] = { fg = palette.sea_glass },

		["@markup.list"] = { fg = palette.ice },
		["@markup.list.checked"] = { fg = palette.turquoise, bg = palette.turquoise, blend = 10 },
		["@markup.list.unchecked"] = { fg = palette.parchment },

		["@markup.link.gitcommit"] = { fg = palette.crimson, underline = true },
		["@markup.heading.1.markdown"] = { link = "markdownH1" },
		["@markup.heading.2.markdown"] = { link = "markdownH2" },
		["@markup.heading.3.markdown"] = { link = "markdownH3" },
		["@markup.heading.4.markdown"] = { link = "markdownH4" },
		["@markup.heading.5.markdown"] = { link = "markdownH5" },
		["@markup.heading.6.markdown"] = { link = "markdownH6" },
		["@markup.heading.1.marker.markdown"] = { link = "markdownH1Delimiter" },
		["@markup.heading.2.marker.markdown"] = { link = "markdownH2Delimiter" },
		["@markup.heading.3.marker.markdown"] = { link = "markdownH3Delimiter" },
		["@markup.heading.4.marker.markdown"] = { link = "markdownH4Delimiter" },
		["@markup.heading.5.marker.markdown"] = { link = "markdownH5Delimiter" },
		["@markup.heading.6.marker.markdown"] = { link = "markdownH6Delimiter" },

		["@diff.plus"] = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
		["@diff.minus"] = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
		["@diff.delta"] = { bg = groups.git_change, blend = 20 },

		["@tag"] = { link = "Tag" },
		["@tag.attribute"] = { fg = palette.parchment },
		["@tag.delimiter"] = { fg = palette.parchment },

		["@conceal"] = { link = "Conceal" },
		["@conceal.markdown"] = { fg = palette.sea_glass },

		["@lsp.type.comment"] = {},
		["@lsp.type.comment.c"] = { link = "@comment" },
		["@lsp.type.comment.cpp"] = { link = "@comment" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.interface"] = { link = "@interface" },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.namespace"] = { link = "@namespace" },
		["@lsp.type.namespace.python"] = { link = "@variable" },
		["@lsp.type.parameter"] = { link = "@parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.variable"] = {},
		["@lsp.type.variable.svelte"] = { link = "@variable" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"] = { link = "@operator" },
		["@lsp.typemod.string.injected"] = { link = "@string" },
		["@lsp.typemod.variable.constant"] = { link = "@constant" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"] = { link = "@variable" },

		BufferCurrent = { fg = palette.parchment, bg = palette.deep_shadow },
		BufferCurrentIndex = { fg = palette.parchment, bg = palette.deep_shadow },
		BufferCurrentMod = { fg = palette.turquoise, bg = palette.deep_shadow },
		BufferCurrentSign = { fg = palette.sea_glass, bg = palette.deep_shadow },
		BufferCurrentTarget = { fg = palette.chalk, bg = palette.deep_shadow },
		BufferInactive = { fg = palette.sea_glass },
		BufferInactiveIndex = { fg = palette.sea_glass },
		BufferInactiveMod = { fg = palette.turquoise },
		BufferInactiveSign = { fg = palette.sage },
		BufferInactiveTarget = { fg = palette.chalk },
		BufferTabpageFill = { fg = "NONE", bg = "NONE" },
		BufferVisible = { fg = palette.sea_glass },
		BufferVisibleIndex = { fg = palette.sea_glass },
		BufferVisibleMod = { fg = palette.turquoise },
		BufferVisibleSign = { fg = palette.sage },
		BufferVisibleTarget = { fg = palette.chalk },

		GitSignsAdd = { fg = groups.git_add, bg = "NONE" },
		GitSignsChange = { fg = groups.git_change, bg = "NONE" },
		GitSignsDelete = { fg = groups.git_delete, bg = "NONE" },
		SignAdd = { fg = groups.git_add, bg = "NONE" },
		SignChange = { fg = groups.git_change, bg = "NONE" },
		SignDelete = { fg = groups.git_delete, bg = "NONE" },

		ModesCopy = { bg = palette.chalk },
		ModesDelete = { bg = palette.crimson },
		ModesFormat = { bg = palette.crimson },
		ModesInsert = { bg = palette.turquoise },
		ModesReplace = { bg = palette.ice },
		ModesVisual = { bg = palette.steel },

		NvimTreeEmptyFolderName = { fg = palette.sage },
		NvimTreeFileDeleted = { fg = groups.git_delete },
		NvimTreeFileDirty = { fg = groups.git_dirty },
		NvimTreeFileMerge = { fg = groups.git_merge },
		NvimTreeFileNew = { fg = palette.turquoise },
		NvimTreeFileRenamed = { fg = groups.git_rename },
		NvimTreeFileStaged = { fg = groups.git_stage },
		NvimTreeFolderIcon = { fg = palette.sea_glass },
		NvimTreeFolderName = { fg = palette.turquoise },
		NvimTreeGitDeleted = { fg = groups.git_delete },
		NvimTreeGitDirty = { fg = groups.git_dirty },
		NvimTreeGitIgnored = { fg = groups.git_ignore },
		NvimTreeGitMerge = { fg = groups.git_merge },
		NvimTreeGitNew = { fg = groups.git_add },
		NvimTreeGitRenamed = { fg = groups.git_rename },
		NvimTreeGitStaged = { fg = groups.git_stage },
		NvimTreeImageFile = { fg = palette.parchment },
		NvimTreeNormal = { link = "Normal" },
		NvimTreeOpenedFile = { fg = palette.parchment, bg = palette.deep_shadow },
		NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
		NvimTreeRootFolder = { fg = palette.turquoise, bold = styles.bold },
		NvimTreeSpecialFile = { link = "NvimTreeNormal" },
		NvimTreeWindowPicker = { link = "StatusLineTerm" },

		NeotestAdapterName = { fg = palette.steel },
		NeotestBorder = { fg = palette.sage },
		NeotestDir = { fg = palette.turquoise },
		NeotestExpandMarker = { fg = palette.mossy_bark },
		NeotestFailed = { fg = palette.crimson },
		NeotestFile = { fg = palette.parchment },
		NeotestFocused = { fg = palette.chalk, bg = palette.mossy_bark },
		NeotestIndent = { fg = palette.mossy_bark },
		NeotestMarked = { fg = palette.crimson, bold = styles.bold },
		NeotestNamespace = { fg = palette.chalk },
		NeotestPassed = { fg = palette.ice },
		NeotestRunning = { fg = palette.chalk },
		NeotestWinSelect = { fg = palette.sage },
		NeotestSkipped = { fg = palette.sea_glass },
		NeotestTarget = { fg = palette.crimson },
		NeotestTest = { fg = palette.chalk },
		NeotestUnknown = { fg = palette.sea_glass },
		NeotestWatching = { fg = palette.steel },

		NeoTreeGitAdded = { fg = groups.git_add },
		NeoTreeGitConflict = { fg = groups.git_merge },
		NeoTreeGitDeleted = { fg = groups.git_delete },
		NeoTreeGitIgnored = { fg = groups.git_ignore },
		NeoTreeGitModified = { fg = groups.git_dirty },
		NeoTreeGitRenamed = { fg = groups.git_rename },
		NeoTreeGitUntracked = { fg = groups.git_untracked },
		NeoTreeTabActive = { fg = palette.parchment, bg = palette.deep_shadow },
		NeoTreeTabInactive = { fg = palette.sea_glass },
		NeoTreeTabSeparatorActive = { link = "WinSeparator" },
		NeoTreeTabSeparatorInactive = { link = "WinSeparator" },
		NeoTreeTitleBar = { link = "StatusLineTerm" },

		FlashLabel = { fg = palette.pine_canopy, bg = palette.crimson },

		WhichKey = { fg = palette.steel },
		WhichKeyBorder = make_border(),
		WhichKeyDesc = { fg = palette.chalk },
		WhichKeyFloat = { bg = palette.deep_pine },
		WhichKeyGroup = { fg = palette.turquoise },
		WhichKeyIcon = { fg = palette.ice },
		WhichKeyIconAzure = { fg = palette.ice },
		WhichKeyIconBlue = { fg = palette.ice },
		WhichKeyIconCyan = { fg = palette.turquoise },
		WhichKeyIconGreen = { fg = palette.jade },
		WhichKeyIconGrey = { fg = palette.sea_glass },
		WhichKeyIconOrange = { fg = palette.crimson },
		WhichKeyIconPurple = { fg = palette.steel },
		WhichKeyIconRed = { fg = palette.crimson },
		WhichKeyIconYellow = { fg = palette.yellow },
		WhichKeyNormal = { link = "NormalFloat" },
		WhichKeySeparator = { fg = palette.sea_glass },
		WhichKeyTitle = { link = "FloatTitle" },
		WhichKeyValue = { fg = palette.crimson },

		IblIndent = { fg = palette.sea_pine },
		IblScope = { fg = palette.turquoise },
		IblWhitespace = { fg = palette.sea_pine },

		CmpItemAbbr = { fg = palette.sea_glass },
		CmpItemAbbrDeprecated = { fg = palette.sea_glass, strikethrough = true },
		CmpItemAbbrMatch = { fg = palette.parchment, bold = styles.bold },
		CmpItemAbbrMatchFuzzy = { fg = palette.parchment, bold = styles.bold },
		CmpItemKind = { fg = palette.sea_glass },
		CmpItemKindClass = { link = "StorageClass" },
		CmpItemKindFunction = { link = "Function" },
		CmpItemKindInterface = { link = "Type" },
		CmpItemKindMethod = { link = "PreProc" },
		CmpItemKindSnippet = { link = "String" },
		CmpItemKindVariable = { link = "Identifier" },

		NeogitChangeAdded = { fg = groups.git_add, bold = styles.bold },
		NeogitChangeBothModified = { fg = groups.git_change, bold = styles.bold },
		NeogitChangeCopied = { fg = groups.git_untracked, bold = styles.bold },
		NeogitChangeDeleted = { fg = groups.git_delete, bold = styles.bold },
		NeogitChangeModified = { fg = groups.git_change, bold = styles.bold },
		NeogitChangeNewFile = { fg = groups.git_stage, bold = styles.bold },
		NeogitChangeRenamed = { fg = groups.git_rename, bold = styles.bold },
		NeogitChangeUpdated = { fg = groups.git_change, bold = styles.bold },
		NeogitDiffAddHighlight = { link = "DiffAdd" },
		NeogitDiffContextHighlight = { bg = palette.deep_pine },
		NeogitDiffDeleteHighlight = { link = "DiffDelete" },
		NeogitFilePath = { fg = palette.turquoise },
		NeogitHunkHeader = { bg = palette.deep_pine },
		NeogitHunkHeaderHighlight = { bg = palette.deep_pine },

		VimwikiHR = { fg = palette.sea_glass },
		VimwikiHeader1 = { link = "markdownH1" },
		VimwikiHeader2 = { link = "markdownH2" },
		VimwikiHeader3 = { link = "markdownH3" },
		VimwikiHeader4 = { link = "markdownH4" },
		VimwikiHeader5 = { link = "markdownH5" },
		VimwikiHeader6 = { link = "markdownH6" },
		VimwikiHeaderChar = { fg = palette.sea_glass },
		VimwikiLink = { link = "markdownUrl" },
		VimwikiList = { fg = palette.steel },
		VimwikiNoExistsLink = { fg = palette.crimson },

		NeorgHeading1Prefix = { link = "markdownH1Delimiter" },
		NeorgHeading1Title = { link = "markdownH1" },
		NeorgHeading2Prefix = { link = "markdownH2Delimiter" },
		NeorgHeading2Title = { link = "markdownH2" },
		NeorgHeading3Prefix = { link = "markdownH3Delimiter" },
		NeorgHeading3Title = { link = "markdownH3" },
		NeorgHeading4Prefix = { link = "markdownH4Delimiter" },
		NeorgHeading4Title = { link = "markdownH4" },
		NeorgHeading5Prefix = { link = "markdownH5Delimiter" },
		NeorgHeading5Title = { link = "markdownH5" },
		NeorgHeading6Prefix = { link = "markdownH6Delimiter" },
		NeorgHeading6Title = { link = "markdownH6" },
		NeorgMarkerTitle = { fg = palette.turquoise, bold = styles.bold },

		DefinitionCount = { fg = palette.crimson },
		DefinitionIcon = { fg = palette.crimson },
		DefinitionPreviewTitle = { fg = palette.crimson, bold = styles.bold },
		LspFloatWinBorder = make_border(),
		LspFloatWinNormal = { bg = palette.deep_pine },
		LspSagaAutoPreview = { fg = palette.sea_glass },
		LspSagaCodeActionBorder = make_border("sage"),
		LspSagaCodeActionContent = { fg = palette.turquoise },
		LspSagaCodeActionTitle = { fg = palette.chalk, bold = styles.bold },
		LspSagaCodeActionTruncateLine = { link = "LspSagaCodeActionBorder" },
		LspSagaDefPreviewBorder = make_border(),
		LspSagaDiagnosticBorder = make_border("sage"),
		LspSagaDiagnosticHeader = { fg = palette.turquoise, bold = styles.bold },
		LspSagaDiagnosticTruncateLine = { link = "LspSagaDiagnosticBorder" },
		LspSagaDocTruncateLine = { link = "LspSagaHoverBorder" },
		LspSagaFinderSelection = { fg = palette.chalk },
		LspSagaHoverBorder = { link = "LspFloatWinBorder" },
		LspSagaLspFinderBorder = { link = "LspFloatWinBorder" },
		LspSagaRenameBorder = make_border("sage"),
		LspSagaRenamePromptPrefix = { fg = palette.crimson },
		LspSagaShTruncateLine = { link = "LspSagaSignatureHelpBorder" },
		LspSagaSignatureHelpBorder = make_border("sage"),
		ReferencesCount = { fg = palette.crimson },
		ReferencesIcon = { fg = palette.crimson },
		SagaShadow = { bg = palette.deep_pine },
		TargetWord = { fg = palette.steel },

		LspSignatureActiveParameter = { bg = palette.sea_pine },

		PounceAccept = { fg = palette.crimson, bg = palette.crimson, blend = 20 },
		PounceAcceptBest = { fg = palette.chalk, bg = palette.chalk, blend = 20 },
		PounceGap = { link = "Search" },
		PounceMatch = { link = "Search" },

		LeapLabelPrimary = { link = "IncSearch" },
		LeapLabelSecondary = { link = "StatusLineTerm" },
		LeapMatch = { link = "MatchParen" },

		HopNextKey = { fg = palette.crimson, bg = palette.crimson, blend = 20 },
		HopNextKey1 = { fg = palette.turquoise, bg = palette.turquoise, blend = 20 },
		HopNextKey2 = { fg = palette.ice, bg = palette.ice, blend = 20 },
		HopUnmatched = { fg = palette.sage },

		TelescopeBorder = make_border(),
		TelescopeMatching = { fg = palette.crimson },
		TelescopeNormal = { link = "NormalFloat" },
		TelescopePromptNormal = { link = "TelescopeNormal" },
		TelescopePromptPrefix = { fg = palette.sea_glass },
		TelescopeSelection = { fg = palette.parchment, bg = palette.deep_shadow },
		TelescopeSelectionCaret = { fg = palette.crimson, bg = palette.deep_shadow },
		TelescopeTitle = { fg = palette.turquoise, bold = styles.bold },

		FzfLuaBorder = make_border(),
		FzfLuaBufFlagAlt = { fg = palette.sea_glass },
		FzfLuaBufFlagCur = { fg = palette.sea_glass },
		FzfLuaCursorLine = { bg = palette.mossy_bark },
		FzfLuaFilePart = { fg = palette.parchment },
		FzfLuaHeaderBind = { fg = palette.crimson },
		FzfLuaHeaderText = { fg = palette.crimson },
		FzfLuaNormal = { link = "NormalFloat" },
		FzfLuaTitle = { link = "FloatTitle" },

		NotifyBackground = { link = "NormalFloat" },
		NotifyDEBUGBody = { link = "NormalFloat" },
		NotifyDEBUGBorder = make_border(),
		NotifyDEBUGIcon = { link = "NotifyDEBUGTitle" },
		NotifyDEBUGTitle = { fg = palette.sage },
		NotifyERRORBody = { link = "NormalFloat" },
		NotifyERRORBorder = make_border("sage"),
		NotifyERRORIcon = { link = "NotifyERRORTitle" },
		NotifyERRORTitle = { fg = groups.error },
		NotifyINFOBody = { link = "NormalFloat" },
		NotifyINFOBorder = make_border("sage"),
		NotifyINFOIcon = { link = "NotifyINFOTitle" },
		NotifyINFOTitle = { fg = groups.info },
		NotifyTRACEBody = { link = "NormalFloat" },
		NotifyTRACEBorder = make_border("sage"),
		NotifyTRACEIcon = { link = "NotifyTRACETitle" },
		NotifyTRACETitle = { fg = palette.steel },
		NotifyWARNBody = { link = "NormalFloat" },
		NotifyWARNBorder = make_border("sage"),
		NotifyWARNIcon = { link = "NotifyWARNTitle" },
		NotifyWARNTitle = { fg = groups.warn },

		DapUIBreakpointsCurrentLine = { fg = palette.chalk, bold = styles.bold },
		DapUIBreakpointsDisabledLine = { fg = palette.sage },
		DapUIBreakpointsInfo = { link = "DapUIThread" },
		DapUIBreakpointsLine = { link = "DapUIBreakpointsPath" },
		DapUIBreakpointsPath = { fg = palette.turquoise },
		DapUIDecoration = { link = "DapUIBreakpointsPath" },
		DapUIFloatBorder = make_border(),
		DapUIFrameName = { fg = palette.parchment },
		DapUILineNumber = { link = "DapUIBreakpointsPath" },
		DapUIModifiedValue = { fg = palette.turquoise, bold = styles.bold },
		DapUIScope = { link = "DapUIBreakpointsPath" },
		DapUISource = { fg = palette.steel },
		DapUIStoppedThread = { link = "DapUIBreakpointsPath" },
		DapUIThread = { fg = palette.chalk },
		DapUIValue = { fg = palette.parchment },
		DapUIVariable = { fg = palette.parchment },
		DapUIType = { fg = palette.steel },
		DapUIWatchesEmpty = { fg = palette.crimson },
		DapUIWatchesError = { link = "DapUIWatchesEmpty" },
		DapUIWatchesValue = { link = "DapUIThread" },

		DashboardCenter = { fg = palette.chalk },
		DashboardFooter = { fg = palette.steel },
		DashboardHeader = { fg = palette.ice },
		DashboardShortcut = { fg = palette.crimson },

		NavicIconsArray = { fg = palette.chalk },
		NavicIconsBoolean = { fg = palette.crimson },
		NavicIconsClass = { fg = palette.turquoise },
		NavicIconsConstant = { fg = palette.chalk },
		NavicIconsConstructor = { fg = palette.chalk },
		NavicIconsEnum = { fg = palette.chalk },
		NavicIconsEnumMember = { fg = palette.turquoise },
		NavicIconsEvent = { fg = palette.chalk },
		NavicIconsField = { fg = palette.turquoise },
		NavicIconsFile = { fg = palette.sage },
		NavicIconsFunction = { fg = palette.ice },
		NavicIconsInterface = { fg = palette.turquoise },
		NavicIconsKey = { fg = palette.steel },
		NavicIconsKeyword = { fg = palette.ice },
		NavicIconsMethod = { fg = palette.steel },
		NavicIconsModule = { fg = palette.crimson },
		NavicIconsNamespace = { fg = palette.sage },
		NavicIconsNull = { fg = palette.crimson },
		NavicIconsNumber = { fg = palette.chalk },
		NavicIconsObject = { fg = palette.chalk },
		NavicIconsOperator = { fg = palette.sea_glass },
		NavicIconsPackage = { fg = palette.sage },
		NavicIconsProperty = { fg = palette.turquoise },
		NavicIconsString = { fg = palette.chalk },
		NavicIconsStruct = { fg = palette.turquoise },
		NavicIconsTypeParameter = { fg = palette.turquoise },
		NavicIconsVariable = { fg = palette.parchment },
		NavicSeparator = { fg = palette.sea_glass },
		NavicText = { fg = palette.sea_glass },

		NoiceCursor = { fg = palette.pine_crest, bg = palette.parchment },

		TroubleNormal = { fg = palette.parchment, bg = palette.deep_pine },
		TroubleNormalNC = { fg = palette.parchment, bg = palette.deep_pine },
		TroubleCursor = { bg = palette.deep_pine },
		TroubleCursorLine = { bg = palette.deep_pine },
		TroubleText = { fg = palette.sea_glass, bg = palette.deep_pine },
		TroubleTextHover = { fg = palette.parchment, bg = palette.deep_pine },
		TroubleCount = { fg = palette.steel, bg = palette.deep_pine },
		TroubleCode = { fg = palette.parchment, bg = palette.deep_pine },
		TroublePos = { fg = palette.sea_glass, bg = palette.deep_pine },
		TroubleLocation = { fg = palette.sea_glass, bg = palette.deep_pine },
		TroubleFile = { fg = palette.turquoise, bg = palette.deep_pine },
		TroubleDirectory = { fg = palette.turquoise, bg = palette.deep_pine },
		TroubleSource = { fg = palette.sea_glass, bg = palette.deep_pine },
		TroubleBasename = { fg = palette.turquoise, bg = palette.deep_pine },
		TroubleDirname = { fg = palette.sage, bg = palette.deep_pine },
		TroubleIndent = { fg = palette.sage, bg = palette.deep_pine },
		TroubleIndentFoldClosed = { fg = palette.sage, bg = palette.deep_pine },
		TroubleIndentFoldOpen = { fg = palette.sage, bg = palette.deep_pine },
		TroubleSignError = { fg = palette.crimson, bg = palette.deep_pine },
		TroubleSignWarning = { fg = palette.yellow, bg = palette.deep_pine },
		TroubleSignInformation = { fg = palette.turquoise, bg = palette.deep_pine },
		TroubleSignHint = { fg = palette.steel, bg = palette.deep_pine },
		TroubleSignOther = { fg = palette.steel, bg = palette.deep_pine },

		MiniAnimateCursor = { reverse = true, nocombine = true },
		MiniAnimateNormalFloat = { link = "NormalFloat" },

		MiniClueBorder = { link = "FloatBorder" },
		MiniClueDescGroup = { link = "DiagnosticFloatingWarn" },
		MiniClueDescSingle = { link = "NormalFloat" },
		MiniClueNextKey = { link = "DiagnosticFloatingHint" },
		MiniClueNextKeyWithPostkeys = { link = "DiagnosticFloatingError" },
		MiniClueSeparator = { link = "DiagnosticFloatingInfo" },
		MiniClueTitle = { bg = palette.deep_pine, bold = styles.bold },

		MiniCompletionActiveParameter = { underline = true },

		MiniCursorword = { underline = true },
		MiniCursorwordCurrent = { underline = true },

		MiniDepsChangeAdded = { fg = groups.git_add },
		MiniDepsChangeRemoved = { fg = groups.git_delete },
		MiniDepsHint = { link = "DiagnosticHint" },
		MiniDepsInfo = { link = "DiagnosticInfo" },
		MiniDepsMsgBreaking = { link = "DiagnosticWarn" },
		MiniDepsPlaceholder = { link = "Comment" },
		MiniDepsTitle = { link = "Title" },
		MiniDepsTitleError = { link = "DiffDelete" },
		MiniDepsTitleSame = { link = "DiffText" },
		MiniDepsTitleUpdate = { link = "DiffAdd" },

		MiniDiffOverAdd = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
		MiniDiffOverChange = { fg = groups.git_change, bg = groups.git_change, blend = 20 },
		MiniDiffOverContext = { bg = palette.deep_pine },
		MiniDiffOverDelete = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
		MiniDiffSignAdd = { fg = groups.git_add },
		MiniDiffSignChange = { fg = groups.git_change },
		MiniDiffSignDelete = { fg = groups.git_delete },

		MiniFilesBorder = { link = "FloatBorder" },
		MiniFilesBorderModified = { link = "DiagnosticFloatingWarn" },
		MiniFilesCursorLine = { link = "CursorLine" },
		MiniFilesDirectory = { link = "Directory" },
		MiniFilesFile = { fg = palette.parchment },
		MiniFilesNormal = { link = "NormalFloat" },
		MiniFilesTitle = { link = "FloatTitle" },
		MiniFilesTitleFocused = { fg = palette.crimson, bg = palette.deep_pine, bold = styles.bold },

		MiniHipatternsFixme = { fg = palette.pine_canopy, bg = groups.error, bold = styles.bold },
		MiniHipatternsHack = { fg = palette.pine_canopy, bg = groups.warn, bold = styles.bold },
		MiniHipatternsNote = { fg = palette.pine_canopy, bg = groups.info, bold = styles.bold },
		MiniHipatternsTodo = { fg = palette.pine_canopy, bg = groups.hint, bold = styles.bold },

		MiniIconsAzure = { fg = palette.turquoise },
		MiniIconsBlue = { fg = palette.ice },
		MiniIconsCyan = { fg = palette.turquoise },
		MiniIconsGreen = { fg = palette.jade },
		MiniIconsGrey = { fg = palette.sea_glass },
		MiniIconsOrange = { fg = palette.crimson },
		MiniIconsPurple = { fg = palette.steel },
		MiniIconsRed = { fg = palette.crimson },
		MiniIconsYellow = { fg = palette.yellow },

		MiniIndentscopeSymbol = { fg = palette.sage },
		MiniIndentscopeSymbolOff = { fg = palette.chalk },

		MiniJump = { sp = palette.chalk, undercurl = true },

		MiniJump2dDim = { fg = palette.sea_glass },
		MiniJump2dSpot = { fg = palette.chalk, bold = styles.bold, nocombine = true },
		MiniJump2dSpotAhead = { fg = palette.turquoise, bg = palette.deep_pine, nocombine = true },
		MiniJump2dSpotUnique = { fg = palette.crimson, bold = styles.bold, nocombine = true },

		MiniMapNormal = { link = "NormalFloat" },
		MiniMapSymbolCount = { link = "Special" },
		MiniMapSymbolLine = { link = "Title" },
		MiniMapSymbolView = { link = "Delimiter" },

		MiniNotifyBorder = { link = "FloatBorder" },
		MiniNotifyNormal = { link = "NormalFloat" },
		MiniNotifyTitle = { link = "FloatTitle" },

		MiniOperatorsExchangeFrom = { link = "IncSearch" },

		MiniPickBorder = { link = "FloatBorder" },
		MiniPickBorderBusy = { link = "DiagnosticFloatingWarn" },
		MiniPickBorderText = { fg = palette.parchment, bg = palette.deep_pine },
		MiniPickIconDirectory = { link = "Directory" },
		MiniPickIconFile = { link = "MiniPickNormal" },
		MiniPickHeader = { link = "DiagnosticFloatingHint" },
		MiniPickMatchCurrent = { link = "CursorLine" },
		MiniPickMatchMarked = { link = "Visual" },
		MiniPickMatchRanges = { fg = palette.turquoise },
		MiniPickNormal = { link = "NormalFloat" },
		MiniPickPreviewLine = { link = "CursorLine" },
		MiniPickPreviewRegion = { link = "IncSearch" },
		MiniPickPrompt = { bg = palette.deep_pine, bold = styles.bold },

		MiniStarterCurrent = { nocombine = true },
		MiniStarterFooter = { fg = palette.sea_glass },
		MiniStarterHeader = { link = "Title" },
		MiniStarterInactive = { link = "Comment" },
		MiniStarterItem = { link = "Normal" },
		MiniStarterItemBullet = { link = "Delimiter" },
		MiniStarterItemPrefix = { link = "WarningMsg" },
		MiniStarterSection = { fg = palette.crimson },
		MiniStarterQuery = { link = "MoreMsg" },

		MiniStatuslineDevinfo = { fg = palette.sea_glass, bg = palette.deep_shadow },
		MiniStatuslineFileinfo = { link = "MiniStatuslineDevinfo" },
		MiniStatuslineFilename = { fg = "#071412", bg = "#cbb18d" },
		MiniStatuslineInactive = { fg = palette.sea_glass, bg = palette.pine_canopy },
		MiniStatuslineModeCommand = { fg = "#071412", bg = "#cbb18d", bold = styles.bold },
		MiniStatuslineModeInsert = { fg = "#071412", bg = "#cbb18d", bold = styles.bold },
		MiniStatuslineModeNormal = { fg = "#071412", bg = "#cbb18d", bold = styles.bold },
		MiniStatuslineModeOther = { fg = "#071412", bg = "#cbb18d", bold = styles.bold },
		MiniStatuslineModeReplace = { fg = "#071412", bg = "#cbb18d", bold = styles.bold },
		MiniStatuslineModeVisual = { fg = "#071412", bg = "#cbb18d", bold = styles.bold },

		MiniSurround = { link = "IncSearch" },

		MiniTablineCurrent = { fg = palette.parchment, bg = palette.deep_shadow, bold = styles.bold },
		MiniTablineFill = { link = "TabLineFill" },
		MiniTablineHidden = { fg = palette.sea_glass, bg = palette.deep_pine },
		MiniTablineModifiedCurrent = { fg = palette.sea_pine, bg = palette.parchment, bold = styles.bold },
		MiniTablineModifiedHidden = { fg = groups.panel, bg = palette.sea_glass },
		MiniTablineModifiedVisible = { fg = groups.panel, bg = palette.parchment },
		MiniTablineTabpagesection = { link = "Search" },
		MiniTablineVisible = { fg = palette.parchment, bg = palette.deep_pine },

		MiniTestEmphasis = { bold = styles.bold },
		MiniTestFail = { fg = palette.crimson, bold = styles.bold },
		MiniTestPass = { fg = palette.turquoise, bold = styles.bold },

		MiniTrailspace = { bg = palette.crimson },

		AlphaButtons = { fg = palette.turquoise },
		AlphaFooter = { fg = palette.chalk },
		AlphaHeader = { fg = palette.ice },
		AlphaShortcut = { fg = palette.crimson },

		CopilotSuggestion = { fg = palette.sage },

		TreesitterContext = { fg = palette.parchment, bg = palette.sea_pine },
		TreesitterContextLineNumber = { link = "LineNr" },
		TreesitterContextBottom = { underline = false, sp = palette.sea_pine },
		TreesitterContextLineNumberBottom = { underline = false, sp = palette.sea_pine },
		TreesitterContextSeparator = { link = "FloatBorder" },

		IlluminatedWordRead = { link = "LspReferenceRead" },
		IlluminatedWordText = { link = "LspReferenceText" },
		IlluminatedWordWrite = { link = "LspReferenceWrite" },

		RainbowDelimiterBlue = { fg = palette.ice },
		RainbowDelimiterCyan = { fg = palette.turquoise },
		RainbowDelimiterGreen = { fg = palette.jade },
		RainbowDelimiterOrange = { fg = palette.crimson },
		RainbowDelimiterRed = { fg = palette.crimson },
		RainbowDelimiterViolet = { fg = palette.steel },
		RainbowDelimiterYellow = { fg = palette.yellow },

		RenderMarkdownH1 = { fg = groups.h1, bold = styles.bold },
		RenderMarkdownH2 = { fg = groups.h2, bold = styles.bold },
		RenderMarkdownH3 = { fg = groups.h3, bold = styles.bold },
		RenderMarkdownH4 = { fg = groups.h4, bold = styles.bold },
		RenderMarkdownH5 = { fg = groups.h5, bold = styles.bold },
		RenderMarkdownH6 = { fg = groups.h6, bold = styles.bold },
		RenderMarkdownH1Bg = { bg = groups.h1, blend = 20 },
		RenderMarkdownH2Bg = { bg = groups.h2, blend = 20 },
		RenderMarkdownH3Bg = { bg = groups.h3, blend = 20 },
		RenderMarkdownH4Bg = { bg = groups.h4, blend = 20 },
		RenderMarkdownH5Bg = { bg = groups.h5, blend = 20 },
		RenderMarkdownH6Bg = { bg = groups.h6, blend = 20 },
		RenderMarkdownCode = { bg = palette.mossy_bark },
		RenderMarkdownCodeInfo = { fg = palette.sea_glass, bg = palette.deep_pine },
		RenderMarkdownCodeBorder = { fg = groups.border, bg = palette.deep_pine },
		RenderMarkdownCodeLanguage = { fg = groups.link, bold = styles.bold },
		RenderMarkdownCodeFallback = { fg = palette.sage },
		RenderMarkdownCodeInline = { fg = palette.turquoise, bg = palette.deep_pine },
		RenderMarkdownQuote1 = { fg = palette.sea_glass },
		RenderMarkdownQuote2 = { fg = groups.h2 },
		RenderMarkdownQuote3 = { fg = groups.h3 },
		RenderMarkdownQuote4 = { fg = groups.h4 },
		RenderMarkdownQuote5 = { fg = groups.h5 },
		RenderMarkdownQuote6 = { fg = groups.h6 },
		RenderMarkdownQuote = { link = "RenderMarkdownQuote1" },
		RenderMarkdownLink = { fg = groups.link },
		RenderMarkdownWikiLink = { fg = groups.link },
		RenderMarkdownWikiLinkText = { fg = palette.parchment },
		RenderMarkdownWikiLinkUnderline = { sp = groups.link },
		RenderMarkdownUnchecked = { fg = palette.sea_glass },
		RenderMarkdownChecked = { fg = palette.turquoise },
		RenderMarkdownTodo = { fg = groups.todo },
		RenderMarkdownTableHead = { fg = palette.sea_glass, bold = styles.bold },
		RenderMarkdownTableRow = { fg = palette.sea_glass },
		RenderMarkdownTableFill = { link = "Conceal" },
		RenderMarkdownInfo = { fg = groups.info, bg = groups.info, blend = 10 },
		RenderMarkdownSuccess = { fg = groups.ok, bg = groups.ok, blend = 10 },
		RenderMarkdownHint = { fg = groups.hint, bg = groups.hint, blend = 10 },
		RenderMarkdownWarn = { fg = groups.warn, bg = groups.warn, blend = 10 },
		RenderMarkdownError = { fg = groups.error, bg = groups.error, blend = 10 },
		RenderMarkdownBullet = { fg = palette.chalk },
		RenderMarkdownDash = { fg = palette.sage },
		RenderMarkdownSign = { fg = palette.sea_glass },
		RenderMarkdownMath = { fg = palette.steel },
		RenderMarkdownIndent = { fg = palette.sage, nocombine = true },
		RenderMarkdownHtmlComment = { fg = palette.pine_crest, italic = styles.italic },
		RenderMarkdownInlineHighlight = { fg = palette.parchment, bg = palette.deep_shadow },

		GrugFarHelpHeader = { fg = palette.ice },
		GrugFarHelpHeaderKey = { fg = palette.chalk },
		GrugFarHelpWinActionKey = { fg = palette.chalk },
		GrugFarHelpWinActionPrefix = { fg = palette.turquoise },
		GrugFarHelpWinActionText = { fg = palette.ice },
		GrugFarHelpWinHeader = { link = "FloatTitle" },
		GrugFarInputLabel = { fg = palette.turquoise },
		GrugFarInputPlaceholder = { link = "Comment" },
		GrugFarResultsActionMessage = { fg = palette.turquoise },
		GrugFarResultsChangeIndicator = { fg = groups.git_change },
		GrugFarResultsRemoveIndicator = { fg = groups.git_delete },
		GrugFarResultsAddIndicator = { fg = groups.git_add },
		GrugFarResultsHeader = { fg = palette.ice },
		GrugFarResultsLineNo = { fg = palette.steel },
		GrugFarResultsLineColumn = { link = "GrugFarResultsLineNo" },
		GrugFarResultsMatch = { link = "CurSearch" },
		GrugFarResultsPath = { fg = palette.turquoise },
		GrugFarResultsStats = { fg = palette.steel },

		AvanteTitle = { fg = palette.pine_crest, bg = palette.crimson },
		AvanteReversedTitle = { fg = palette.crimson },
		AvanteSubtitle = { fg = palette.mossy_bark, bg = palette.turquoise },
		AvanteReversedSubtitle = { fg = palette.turquoise },
		AvanteThirdTitle = { fg = palette.mossy_bark, bg = palette.steel },
		AvanteReversedThirdTitle = { fg = palette.steel },
		AvantePromptInput = { fg = palette.parchment, bg = palette.deep_pine },
		AvantePromptInputBorder = { fg = groups.border },

		BlinkCmpMenu = { fg = palette.jade, bg = palette.mossy_bark },
		BlinkCmpMenuBorder = { fg = palette.sage, bg = palette.deep_pine },
		BlinkCmpMenuSelection = { fg = "NONE", bg = palette.deep_pine },
		BlinkCmpScrollBarThumb = { bg = palette.sea_glass },
		BlinkCmpScrollBarGutter = { bg = palette.mossy_bark },
		BlinkCmpLabel = { fg = palette.parchment, bg = "NONE" },
		BlinkCmpLabelDeprecated = { fg = palette.sage, bg = "NONE" },
		BlinkCmpLabelMatch = { fg = palette.jade, bg = "NONE", bold = styles.bold },
		BlinkCmpLabelMatchSelected = { fg = palette.jade, bg = "NONE", bold = styles.bold },
		BlinkCmpLabelDetail = { fg = palette.sea_glass, bg = "NONE" },
		BlinkCmpLabelDescription = { fg = palette.sea_glass, bg = "NONE" },
		BlinkCmpKind = { fg = palette.steel, bg = "NONE" },
		BlinkCmpSource = { fg = palette.sage, bg = "NONE" },
		BlinkCmpGhostText = { fg = palette.sage, bg = "NONE" },
		BlinkCmpDoc = { fg = palette.parchment, bg = palette.deep_pine },
		BlinkCmpDocBorder = { fg = palette.sage, bg = palette.deep_pine },
		BlinkCmpDocSeparator = { fg = palette.sage, bg = palette.deep_pine },
		BlinkCmpDocCursorLine = { bg = palette.deep_shadow },
		BlinkCmpSignatureHelp = { fg = palette.parchment, bg = palette.deep_pine },
		BlinkCmpSignatureHelpBorder = { fg = palette.sage, bg = palette.deep_pine },
		BlinkCmpSignatureHelpActiveParameter = { fg = palette.ice, bg = palette.deep_pine },

		BlinkCmpDefault = { fg = palette.mossy_bark },
		BlinkCmpKindText = { fg = palette.ice },
		BlinkCmpKindMethod = { fg = palette.turquoise },
		BlinkCmpKindFunction = { fg = palette.turquoise },
		BlinkCmpKindConstructor = { fg = palette.turquoise },
		BlinkCmpKindField = { fg = palette.ice },
		BlinkCmpKindVariable = { fg = palette.ice },
		BlinkCmpKindClass = { fg = palette.chalk },
		BlinkCmpKindInterface = { fg = palette.chalk },
		BlinkCmpKindModule = { fg = palette.turquoise },
		BlinkCmpKindProperty = { fg = palette.turquoise },
		BlinkCmpKindUnit = { fg = palette.ice },
		BlinkCmpKindValue = { fg = palette.chalk },
		BlinkCmpKindKeyword = { fg = palette.jade },
		BlinkCmpKindSnippet = { fg = palette.ice },
		BlinkCmpKindColor = { fg = palette.chalk },
		BlinkCmpKindFile = { fg = palette.turquoise },
		BlinkCmpKindReference = { fg = palette.chalk },
		BlinkCmpKindFolder = { fg = palette.turquoise },
		BlinkCmpKindEnum = { fg = palette.turquoise },
		BlinkCmpKindEnumMember = { fg = palette.turquoise },
		BlinkCmpKindConstant = { fg = palette.chalk },
		BlinkCmpKindStruct = { fg = palette.turquoise },
		BlinkCmpKindEvent = { fg = palette.turquoise },
		BlinkCmpKindOperator = { fg = palette.turquoise },
		BlinkCmpKindTypeParameter = { fg = palette.jade },
		BlinkCmpKindCodeium = { fg = palette.turquoise },
		BlinkCmpKindCopilot = { fg = palette.turquoise },
		BlinkCmpKindSupermaven = { fg = palette.turquoise },
		BlinkCmpKindTabNine = { fg = palette.turquoise },

		SnacksIndent = { fg = palette.sea_pine },
		SnacksIndentChunk = { fg = palette.sea_pine },
		SnacksIndentBlank = { fg = palette.sea_pine },
		SnacksIndentScope = { fg = palette.turquoise },

		SnacksPicker = { fg = palette.parchment, bg = palette.deep_pine },
		SnacksPickerBorder = { fg = palette.sage, bg = palette.deep_pine },
		SnacksPickerList = { fg = palette.parchment, bg = palette.deep_pine },
		SnacksPickerPreview = { fg = palette.parchment, bg = palette.deep_pine },
		SnacksPickerInput = { fg = palette.parchment, bg = palette.deep_pine },
		SnacksPickerMatch = { fg = palette.crimson, bold = styles.bold },

		Sneak = { fg = palette.pine_canopy, bg = palette.crimson },
		SneakCurrent = { link = "StatusLineTerm" },
		SneakScope = { link = "IncSearch" },

		DiffviewPrimary = { fg = palette.ice },
		DiffviewSecondary = { fg = palette.turquoise },
		DiffviewNormal = { fg = palette.parchment, bg = palette.deep_pine },
		DiffviewWinSeparator = { fg = palette.parchment, bg = palette.deep_pine },

		DiffviewFilePanelTitle = { fg = palette.turquoise, bold = styles.bold },
		DiffviewFilePanelCounter = { fg = palette.crimson },
		DiffviewFilePanelRootPath = { fg = palette.turquoise, bold = styles.bold },
		DiffviewFilePanelFileName = { fg = palette.parchment },
		DiffviewFilePanelSelected = { fg = palette.chalk },
		DiffviewFilePanelPath = { link = "Comment" },

		DiffviewFilePanelInsertions = { fg = groups.git_add },
		DiffviewFilePanelDeletions = { fg = groups.git_delete },
		DiffviewFilePanelConflicts = { fg = groups.git_merge },
		DiffviewFolderName = { fg = palette.turquoise, bold = styles.bold },
		DiffviewFolderSign = { fg = palette.sea_glass },
		DiffviewHash = { fg = palette.crimson },
		DiffviewReference = { fg = palette.turquoise, bold = styles.bold },
		DiffviewReflogSelector = { fg = palette.crimson },
		DiffviewStatusAdded = { fg = groups.git_add },
		DiffviewStatusUntracked = { fg = groups.git_untracked },
		DiffviewStatusModified = { fg = groups.git_change },
		DiffviewStatusRenamed = { fg = groups.git_rename },
		DiffviewStatusCopied = { fg = groups.git_untracked },
		DiffviewStatusTypeChange = { fg = groups.git_change },
		DiffviewStatusUnmerged = { fg = groups.git_change },
		DiffviewStatusUnknown = { fg = groups.git_delete },
		DiffviewStatusDeleted = { fg = groups.git_delete },
		DiffviewStatusBroken = { fg = groups.git_delete },
		DiffviewStatusIgnored = { fg = groups.git_ignore },
	}
	local transparency_highlights = {
		DiagnosticVirtualTextError = { fg = groups.error },
		DiagnosticVirtualTextHint = { fg = groups.hint },
		DiagnosticVirtualTextInfo = { fg = groups.info },
		DiagnosticVirtualTextOk = { fg = groups.ok },
		DiagnosticVirtualTextWarn = { fg = groups.warn },

		FloatBorder = { fg = palette.sage, bg = "NONE" },
		FloatTitle = { fg = palette.turquoise, bg = "NONE", bold = styles.bold },
		Folded = { fg = palette.parchment, bg = "NONE" },
		NormalFloat = { bg = "NONE" },
		Normal = { fg = palette.parchment, bg = "NONE" },
		NormalNC = {
			fg = palette.parchment,
			bg = config.options.dim_inactive_windows and palette.forest_floor or "NONE",
		},
		Pmenu = { fg = palette.sea_glass, bg = "NONE" },
		PmenuKind = { fg = palette.turquoise, bg = "NONE" },
		SignColumn = { fg = palette.parchment, bg = "NONE" },
		StatusLine = { fg = "#071412", bg = "#cbb18d" },
		StatusLineNC = { fg = palette.sea_glass, bg = palette.pine_canopy },
		TabLine = { bg = "NONE", fg = palette.sea_glass },
		TabLineFill = { bg = "NONE" },
		TabLineSel = { fg = palette.parchment, bg = "NONE", bold = styles.bold },

		["@markup.raw.markdown_inline"] = { fg = palette.chalk },

		TelescopeNormal = { fg = palette.sea_glass, bg = "NONE" },
		TelescopePromptNormal = { fg = palette.parchment, bg = "NONE" },
		TelescopeSelection = { fg = palette.parchment, bg = "NONE", bold = styles.bold },
		TelescopeSelectionCaret = { fg = palette.crimson },

		TroubleNormal = { bg = "NONE" },

		WhichKeyFloat = { bg = "NONE" },
		WhichKeyNormal = { bg = "NONE" },

		IblIndent = { fg = palette.sea_pine, bg = "NONE" },
		IblScope = { fg = palette.turquoise, bg = "NONE" },
		IblWhitespace = { fg = palette.sea_pine, bg = "NONE" },

		TreesitterContext = { bg = "NONE" },
		TreesitterContextLineNumber = { fg = palette.crimson, bg = "NONE" },

		MiniFilesTitleFocused = { fg = palette.crimson, bg = "NONE", bold = styles.bold },

		MiniPickPrompt = { bg = "NONE", bold = styles.bold },
		MiniPickBorderText = { fg = palette.parchment, bg = "NONE" },
	}

	if config.options.enable.legacy_highlights then
		for group, highlight in pairs(legacy_highlights) do
			highlights[group] = highlight
		end
	end
	for group, highlight in pairs(default_highlights) do
		highlights[group] = highlight
	end
	if styles.transparency then
		for group, highlight in pairs(transparency_highlights) do
			highlights[group] = highlight
		end
	end

	if config.options.highlight_groups ~= nil and next(config.options.highlight_groups) ~= nil then
		for group, highlight in pairs(config.options.highlight_groups) do
			local existing = highlights[group] or {}
			while existing.link ~= nil do
				existing = highlights[existing.link] or {}
			end
			local parsed = vim.tbl_extend("force", {}, highlight)

			if highlight.fg ~= nil then
				parsed.fg = utilities.parse_color(highlight.fg) or highlight.fg
			end
			if highlight.bg ~= nil then
				parsed.bg = utilities.parse_color(highlight.bg) or highlight.bg
			end
			if highlight.sp ~= nil then
				parsed.sp = utilities.parse_color(highlight.sp) or highlight.sp
			end

			if (highlight.inherit == nil or highlight.inherit) and existing ~= nil then
				parsed.inherit = nil
				highlights[group] = vim.tbl_extend("force", existing, parsed)
			else
				parsed.inherit = nil
				highlights[group] = parsed
			end
		end
	end

	for group, highlight in pairs(highlights) do
		if config.options.before_highlight ~= nil then
			config.options.before_highlight(group, highlight, palette)
		end

		if highlight.fg ~= nil then
			highlight.fg = utilities.parse_color(highlight.fg) or highlight.fg
		end
		if highlight.bg ~= nil then
			highlight.bg = utilities.parse_color(highlight.bg) or highlight.bg
		end
		if highlight.sp ~= nil then
			highlight.sp = utilities.parse_color(highlight.sp) or highlight.sp
		end

		if highlight.blend ~= nil and (highlight.blend >= 0 and highlight.blend <= 100) and highlight.bg ~= nil then
			highlight.bg = utilities.blend(highlight.bg, highlight.blend_on or palette.deep_pine, highlight.blend / 100)
		end

		highlight.blend = nil
		highlight.blend_on = nil

		if highlight._nvim_blend ~= nil then
			highlight.blend = highlight._nvim_blend
		end

		vim.api.nvim_set_hl(0, group, highlight)
	end

	if config.options.enable.terminal then
		vim.g.terminal_color_0 = palette.sea_pine
		vim.g.terminal_color_8 = palette.sea_glass
		vim.g.terminal_color_1 = palette.crimson
		vim.g.terminal_color_9 = palette.crimson
		vim.g.terminal_color_2 = palette.ice
		vim.g.terminal_color_10 = palette.ice
		vim.g.terminal_color_3 = palette.yellow
		vim.g.terminal_color_11 = palette.yellow
		vim.g.terminal_color_4 = palette.turquoise
		vim.g.terminal_color_12 = palette.turquoise
		vim.g.terminal_color_5 = palette.steel
		vim.g.terminal_color_13 = palette.steel
		vim.g.terminal_color_6 = palette.crimson
		vim.g.terminal_color_14 = palette.crimson
		vim.g.terminal_color_7 = palette.parchment
		vim.g.terminal_color_15 = palette.parchment

		vim.cmd([[
		augroup yblow
			autocmd!
			autocmd TermOpen * if &buftype=='terminal'
				\|setlocal winhighlight=StatusLine:StatusLineTerm,StatusLineNC:StatusLineTermNC
				\|else|setlocal winhighlight=|endif
			autocmd ColorSchemePre * autocmd! yblow
		augroup END
		]])
	end
end

---@param name? string
function M.colorscheme(name)
	vim.opt.termguicolors = true
	if vim.g.colors_name then
		vim.cmd("hi clear")
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = name or "yblow"

	package.loaded["yblow.palette"] = nil
	set_highlights()
end

function M.setup(options)
	config.extend_options(options or {})
end

return M
