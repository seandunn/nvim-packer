local status, plugin = pcall(require, "nvim-autopairs")
if (not status) then return end

plugin.setup()
