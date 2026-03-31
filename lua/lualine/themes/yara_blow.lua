local p = require("yara_blow.palette")

return {
    normal = {
        a = { bg = p.text, fg = p.shadow, gui = "bold" },
        b = { bg = p.text, fg = p.shadow },
        c = { bg = p.text, fg = p.shadow },
    },
    insert = {
        a = { bg = p.text, fg = p.shadow, gui = "bold" },
        b = { bg = p.text, fg = p.shadow },
        c = { bg = p.text, fg = p.shadow },
    },
    visual = {
        a = { bg = p.text, fg = p.shadow, gui = "bold" },
        b = { bg = p.text, fg = p.shadow },
        c = { bg = p.text, fg = p.shadow },
    },
    replace = {
        a = { bg = p.text, fg = p.shadow, gui = "bold" },
        b = { bg = p.text, fg = p.shadow },
        c = { bg = p.text, fg = p.shadow },
    },
    command = {
        a = { bg = p.text, fg = p.shadow, gui = "bold" },
        b = { bg = p.text, fg = p.shadow },
        c = { bg = p.text, fg = p.shadow },
    },
    inactive = {
        a = { bg = p.reef, fg = p.mist, gui = "bold" },
        b = { bg = p.reef, fg = p.harbor },
        c = { bg = p.reef, fg = p.harbor },
    },
}
