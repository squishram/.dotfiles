return {
  -- image to display images inline
  "3rd/image.nvim",
  -- BUG: need to have this installed, but doesn't seem to exist?
  build = "luarocks --local install magick",
  opts = {
    backend = "kitty",
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        -- NOTE: turn this on if there are too many images flying around on-screen
        only_render_image_at_cursor = false,
        -- markdown extensions (ie. quarto) can go here
        filetypes = { "markdown", "quarto" },
      },
      neorg = { enabled = false },
    },
    -- tweak these two to preference
    max_width = 100,
    max_height = 12,
    -- these two are optimised
    max_height_window_percentage = math.huge,
    max_width_window_percentage = math.huge,
    -- toggles images when windows are overlapped
    window_overlap_clear_enabled = true,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    -- auto show/hide images when the editor gains/looses focus
    editor_only_render_when_focused = false,
    -- auto show/hide images in the correct Tmux window (needs visual-activity off)
    tmux_show_only_in_active_window = false,
    -- render image files as images when opened
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
  },
}
