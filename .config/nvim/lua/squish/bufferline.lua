local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    numbers = "none", -- "ordinal" | "both"
    -- can be a string | function, see "Mouse actions"
    close_command = "bdelete! %d",
    -- can be a string | function, see "Mouse actions"
    -- right_mouse_command = nil,
    -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",
    -- can be a string | function, see "Mouse actions"
    middle_mouse_command =  "bdelete! %d",

    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',

    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    -- buf contains a "name", "path" and "bufnr"
    name_formatter = function(buf)
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,

    max_name_length = 18,
    -- prefix used when a buffer is de-duplicated
    max_prefix_length = 15,
    tab_size = 18,
    -- "nvim_lsp" | none
    diagnostics = false,
    diagnostics_update_in_insert = false,
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   return "("..count..")"
    -- end,

    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
    end,

    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
    -- disable filetype icons for buffers
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,

    -- whether or not custom sorted buffers should persist
    persist_buffer_sort = true,
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    -- slant/ thick/ thin
    separator_style = "thick",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    -- insert_after_current, insert_at_end, id, extension, relative_directory
    sort_by = 'insert_after_current',
  }
}

-- keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- goto buffers
keymap("n", "<leader>bp", ":BufferLinePick<CR>", opts)
keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
-- reorder buffers
keymap("n", "<leader>hl", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<leader>lh", ":BufferLineMovePrev<CR>", opts)
