-- settings/servers.lua
local lspconfig = require("lspconfig")

-- $ rustup component add rust-analyzer
lspconfig.rust_analyzer.setup({
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
})


lspconfig.gopls.setup({
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  single_file_support = true,
})


lspconfig.lua_ls.setup({
  cmd = {"lua-language-server"},
})
