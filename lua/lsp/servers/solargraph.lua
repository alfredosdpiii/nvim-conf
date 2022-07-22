local M = {}

-- Auto-install

local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, solargraph = lsp_installer_servers.get_server("solargraph")
if ok then
    if not solargraph:is_installed() then
        solargraph:install()
    end
end

-- Settings

M.settings = {}

return M
