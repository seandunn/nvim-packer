local status, plugin = pcall(require, "windows")
if (not status) then return end

plugin.setup()
