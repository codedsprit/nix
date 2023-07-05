-- settings/adapters.lua
local dap = require("dap")

-- https://github.com/vadimcn/codelldb
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fs.normalize("/path/to/codelldb/extension/adapter/codelldb"),
    args = { "--port", "${port}" },
  },
}
