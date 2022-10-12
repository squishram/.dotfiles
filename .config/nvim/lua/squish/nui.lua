local status_ok, nui = pcall(require, "nui")
if not status_ok then
  return
end

nui.setup{}
