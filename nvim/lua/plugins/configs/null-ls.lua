local null_ls = require "null-ls"

local opts = {
  sources = {
    null_ls.builtins.formmating.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
  },
}
return opts