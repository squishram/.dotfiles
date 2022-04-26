local status_ok, surround = pcall(require, "surround")
if not status_ok then
  return
end

surround.setup {
  -- number of lines to look for above and below the current line while searching for nestable pairs. (default: 100)
  context_offset = 100,
  -- whether to load inbuilt autogroups or not. (default: false)
  load_autogroups = false,
  -- "surround" or "sandwich" (default: sandwich)
  mappings_style = "surround",
  -- whether to load insert mode mappings or not. (default: true)
  map_insert_mode = true,
  -- what are considered quotes and brackets?
  quotes = {"'", '"', '*'},
  brackets = {"(", '{', '['},
  -- if the closing char should add surround space rather than the opening char. (default: false)
  space_on_closing_char = true,
  pairs = {
    nestable = {{"(", ")"}, {"[", "]"}, {"{", "}"}},
    linear = {{"'", "'"}, {"`", "`"}, {'"', '"'}, {'*', '*'}}
  },
  prefix = "s"
}
