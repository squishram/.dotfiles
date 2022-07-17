local status_ok, colouriser = pcall(require, "colorizer")
if not status_ok then
  return
end

colouriser.setup()
