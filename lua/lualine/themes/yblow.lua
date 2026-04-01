local p = require("yara_blow.palette")

local active_bg = "#cbb18d"
local active_fg = "#071412"

return {
    normal = {
        a = { bg = active_bg, fg = active_fg, gui = "bold" },
        b = { bg = active_bg, fg = active_fg },
        c = { bg = active_bg, fg = active_fg },
    },
    insert = {
        a = { bg = active_bg, fg = active_fg, gui = "bold" },
        b = { bg = active_bg, fg = active_fg },
        c = { bg = active_bg, fg = active_fg },
    },
    visual = {
        a = { bg = active_bg, fg = active_fg, gui = "bold" },
        b = { bg = active_bg, fg = active_fg },
        c = { bg = active_bg, fg = active_fg },
    },
    replace = {
        a = { bg = active_bg, fg = active_fg, gui = "bold" },
        b = { bg = active_bg, fg = active_fg },
        c = { bg = active_bg, fg = active_fg },
    },
    command = {
        a = { bg = active_bg, fg = active_fg, gui = "bold" },
        b = { bg = active_bg, fg = active_fg },
        c = { bg = active_bg, fg = active_fg },
    },
    inactive = {
        a = { bg = p.reef, fg = p.mist, gui = "bold" },
        b = { bg = p.reef, fg = p.mist },
        c = { bg = p.reef, fg = p.mist },
    },
}
