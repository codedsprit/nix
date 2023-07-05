local Binder = require("config.Binder")

local spec = {
   "VonHeikemen/fine-cmdline.nvim",
   dependencies = {
      "MunifTanjim/nui.nvim",
   },
   name = "cmdline",
   event = {
      "BufNewFile",
   },
   cmd = {
      "Cmd",
   },
   keys = {
      ":",
   },
}

function spec:config()
   local cmd_ui = require("fine-cmdline")
   local binder = Binder.new():with_modes({ "n" })
   binder:bind(":", function() cmd_ui.open() end)
end

return spec

