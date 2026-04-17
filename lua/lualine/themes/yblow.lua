local p = require("yblow.palette")

local active_bg = p.c2
local active_fg = p.text

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
        a = { bg = p.c2, fg = p.c6, gui = "bold" },
        b = { bg = p.c2, fg = p.c6 },
        c = { bg = p.c2, fg = p.c6 },
    },
}
