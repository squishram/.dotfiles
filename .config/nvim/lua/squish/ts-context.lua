local status_ok, tscontext = pcall(require, "tscontext")
if not status_ok then
  return
end

tscontext.setup{
    -- Enable this plugin (Can be enabled/disabled later via commands)
    enable = true,
    -- Throttles plugin updates (may improve performance)
    throttle = true,
    -- How many lines the window should span. Values <= 0 mean no limit.
    max_lines = 0,
    -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    patterns = {
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            -- 'switch',
            -- 'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
          python = {
            'def',
            'with',
          },
    },
}
-- Commands
-- TSContextEnable, TSContextDisable and TSContextToggle.
--
-- Appearance
-- Use the highlight group TreesitterContext to change the colors of the context. Per default it links to NormalFloat.
