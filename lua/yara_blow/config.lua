---@alias PaletteColor
---| "abyss"
---| "trench"
---| "reef"
---| "shelf"
---| "tide"
---| "harbor"
---| "mist"
---| "sand"
---| "ember"
---| "ivory"
---| "scarlet"
---| "moss"
---| "frost"
---| "spring"
---| "aqua"
---| "slate"
---| "jade"
---| "shadow"
---| "veil"
---| "crest"
---@alias Highlight { link: string, inherit: boolean } | { fg: string, bg: string, sp: string, bold: boolean, italic: boolean, undercurl: boolean, underline: boolean, underdouble: boolean, underdotted: boolean, underdashed: boolean, strikethrough: boolean, inherit: boolean }

local config = {}

---@class Options
config.options = {
    dim_inactive_windows = false,
    extend_background_behind_borders = true,
    enable = {
        legacy_highlights = true,
        migrations = true,
        terminal = true,
    },
    styles = {
        bold = true,
        italic = true,
        transparency = false,
    },
    ---@type table<string, string>
    palette = {},
    ---@type table<string, string | PaletteColor>
    groups = {
        border = "harbor",
        link = "slate",
        panel = "shelf",

        error = "ember",
        hint = "frost",
        info = "aqua",
        ok = "jade",
        warn = "ivory",
        note = "frost",
        todo = "scarlet",

        git_add = "jade",
        git_change = "ivory",
        git_delete = "ember",
        git_dirty = "ivory",
        git_ignore = "harbor",
        git_merge = "slate",
        git_rename = "frost",
        git_stage = "slate",
        git_text = "scarlet",
        git_untracked = "mist",

        h1 = "jade",
        h2 = "ivory",
        h3 = "frost",
        h4 = "aqua",
        h5 = "ember",
        h6 = "moss",
    },
    ---@type table<string, Highlight>
    highlight_groups = {},
    ---Called before each highlight group, before setting the highlight.
    ---@param group string
    ---@param highlight Highlight
    ---@param palette table<string, string>
    ---@diagnostic disable-next-line: unused-local
    before_highlight = function(group, highlight, palette) end,
}

local function migrate(options)
    if options.bold_vert_split then
        local border = options.groups.border or "harbor"
        options.highlight_groups["VertSplit"] = { fg = border, bg = border }
        options.highlight_groups["WinSeparator"] = { fg = border, bg = border }
    end

    if options.disable_background then
        options.highlight_groups["Normal"] = { bg = "NONE" }
    end

    if options.disable_float_background then
        options.highlight_groups["NormalFloat"] = { bg = "NONE" }
    end

    options.dim_inactive_windows = options.dim_nc_background or options.dim_inactive_windows

    if options.groups.background ~= nil then
        options.highlight_groups["Normal"] = { bg = options.groups.background }
    end

    if options.groups.comment ~= nil then
        options.highlight_groups["Comment"] = { fg = options.groups.comment }
    end

    if options.groups.punctuation ~= nil then
        options.highlight_groups["@punctuation"] = { fg = options.groups.punctuation }
    end

    options.styles.transparency = (options.disable_background and options.disable_float_background)
        or options.styles.transparency

    options.styles.bold = not (options.disable_bold or options.disable_bolds) and options.styles.bold or false
    options.styles.italic = not (options.disable_italic or options.disable_italics) and options.styles.italic or false

    if type(options.groups.headings) == "string" then
        options.groups.h1 = options.groups.headings
        options.groups.h2 = options.groups.headings
        options.groups.h3 = options.groups.headings
        options.groups.h4 = options.groups.headings
        options.groups.h5 = options.groups.headings
        options.groups.h6 = options.groups.headings
    elseif type(options.groups.headings) == "table" then
        options.groups.h1 = options.groups.headings.h1 or options.groups.h1
        options.groups.h2 = options.groups.headings.h2 or options.groups.h2
        options.groups.h3 = options.groups.headings.h3 or options.groups.h3
        options.groups.h4 = options.groups.headings.h4 or options.groups.h4
        options.groups.h5 = options.groups.headings.h5 or options.groups.h5
        options.groups.h6 = options.groups.headings.h6 or options.groups.h6
    end
    options.groups.headings = nil

    return options
end

---@param options Options | nil
function config.extend_options(options)
    config.options = vim.tbl_deep_extend("force", config.options, options or {})

    if config.options.enable.migrations then
        config.options = migrate(config.options)
    end
end

return config
