local p = require("yblow.palette")

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
