local M = {}
local config = require("yblow.config")

function M.setup(options)
    config.extend_options(options or {})
end

---@param name? string
function M.colorscheme(name)
	require("yblow.theme").colorscheme(name)
end

return M
