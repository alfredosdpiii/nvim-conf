local baseDefinitionHandler = vim.lsp.handlers["textDocument/definition"]

local filter = require("lsp.utils.filter").filter
local filterReactDTS = require("lsp.utils.filterReactDTS").filterReactDTS

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    silent = true,
    border = EcoVim.ui.float.border,
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = EcoVim.ui.float.border }),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = true }
  ),
  -- ["textDocument/publishDiagnostics"] = function(
  --   _,
  --   result,
  --   ctx,
  --   config
  -- )
  --   if result.diagnostics == nil then
  --     return
  --   end
  --
  --   -- ignore some tsserver diagnostics
  --   local idx = 1
  --   while idx <= #result.diagnostics do
  --     local entry = result.diagnostics[idx]
  --
  --     local formatter = require('format-ts-errors')[entry.code]
  --     entry.message = formatter and formatter(entry.message) or entry.message
  --
  --     -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
  --     if entry.code == 80001 then
  --       -- { message = "File is a CommonJS module; it may be converted to an ES module.", }
  --       table.remove(result.diagnostics, idx)
  --     else
  --       idx = idx + 1
  --     end
  --   end
  --
  --   vim.lsp.diagnostic.on_publish_diagnostics(
  --     _,
  --     result,
  --     ctx,
  --     config
  --   )
  --   { virtual_text = true }
  -- end,
  ["textDocument/definition"] = function(err, result, method, ...)
    P(result)
    if vim.tbl_islist(result) and #result > 1 then
      local filtered_result = filter(result, filterReactDTS)
      return baseDefinitionHandler(err, filtered_result, method, ...)
    end

    baseDefinitionHandler(err, result, method, ...)
  end,
}

require("typescript-tools").setup({
  on_attach = function(client, bufnr)
    if vim.fn.has("nvim-0.10") then
      -- Enable inlay hints
      vim.lsp.inlay_hint(bufnr, true)
    end
  end,
  handlers = handlers,
  settings = {
    separate_diagnostic_server = true,
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeCompletionsForModuleExports = true,
      quotePreference = "auto",
    },
  },
})
