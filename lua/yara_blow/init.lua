local M = {}
local config = require("yara_blow.config")

function M.setup(options)
    config.extend_options(options or {})
end

---@param name? string
function M.colorscheme(name)
    require("yara_blow.theme").colorscheme(name)
end

return M
