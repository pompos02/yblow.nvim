local M = {}
local config = require("dolores.config")

function M.setup(options)
    config.extend_options(options or {})
end

---@param name? string
function M.colorscheme(name)
	require("dolores.theme").colorscheme(name)
end

return M
