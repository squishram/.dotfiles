local status_ok, leap = pcall(require, "leap")
if not status_ok then
    return
end

-- default keymaps
leap.set_default_keymaps()
