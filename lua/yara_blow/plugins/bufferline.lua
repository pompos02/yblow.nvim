local p = require("yara_blow.palette")

return {
    tab_selected = {
        fg = p.text,
        bg = p.overlay,
    },
    buffer_visible = {
        fg = p.subtle,
        bg = p.base,
    },
    buffer_selected = {
        fg = p.text,
        bg = p.surface,
        bold = true,
        italic = true,
    },
}
