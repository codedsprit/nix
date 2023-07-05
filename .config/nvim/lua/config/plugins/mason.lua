local spec = {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  name = "mason",
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonUpdate",
  },
}

function spec:config()
  local mason = require("mason")
  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })

end

return spec

