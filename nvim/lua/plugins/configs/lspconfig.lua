dofile(vim.g.base46_cache .. "lsp")
require "nvchad.lsp"

local M = {}
local utils = require "core.utils"
local util = require "lspconfig.util"
-- export on_attach & capabilities for custom lspconfigs
M.on_attach = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end
end

-- disable semantic tokens
M.on_init = function(client, _)
  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

require("lspconfig").lua_ls.setup {
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
--
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
--
require'lspconfig'.gopls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    cmd = {"gopls"},
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
      }
    },
  },
}
local path_to_elixirls = vim.fn.expand("~/.cache/nvim/lspconfig/elixirls/elixir-ls/release/language_server.sh")

require'lspconfig'.elixirls.setup({
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    cmd = {path_to_elixirls},
    filetypes = {"ex", "exs", "elixir"},
    settings = {
        elixirLS = {
          -- I choose to disable dialyzer for personal reasons, but
          -- I would suggest you also disable it unless you are well
          -- acquainted with dialzyer and know how to use it.
          dialyzerEnabled = false,
          -- I also choose to turn off the auto dep fetching feature.
          -- It often get's into a weird state that requires deleting
          -- the .elixir_ls directory and restarting your editor.
          fetchDeps = false
    }
  }
})
return M
