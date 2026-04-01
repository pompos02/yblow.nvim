local p = require("yblow.palette")

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
        a = { bg = p.pine_canopy, fg = p.sea_glass, gui = "bold" },
        b = { bg = p.pine_canopy, fg = p.sea_glass },
        c = { bg = p.pine_canopy, fg = p.sea_glass },
    },
}
