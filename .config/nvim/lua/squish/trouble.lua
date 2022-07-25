local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  return
end

trouble.setup{
  -- position of the list can be: bottom, top, left, right
  position = "bottom",
  -- height of the trouble list when position is top or bottom
  height = 10,
  -- width of the list when position is left or right
  width = 50,
  -- use devicons for filenames
  icons = true,
  -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  mode = "workspace_diagnostics",
  -- icon used for open folds
  fold_open = "",
  -- icon used for closed folds
  fold_closed = "",
  -- group results by file
  group = true,
  -- add an extra new line on top of the list
  padding = true,
  action_keys = { -- key mappings for actions in the trouble list
    -- map to {} to remove a mapping, for example:
    -- close = {},
    -- close the list
    close = "q",
    -- cancel the preview and get back to your last window / buffer / cursor
    cancel = "<esc>",
    -- manually refresh
    refresh = "r",
    -- jump to the diagnostic or open / close folds
    jump = {"<cr>", "<tab>"},
    -- open buffer in new split
    open_split = { "<c-x>" },
    -- open buffer in new vsplit
    open_vsplit = { "<c-v>" },
    -- open buffer in new tab
    open_tab = { "<c-t>" },
    -- jump to the diagnostic and close the list
    jump_close = {"o"},
    -- toggle between "workspace" and "document" diagnostics mode
    toggle_mode = "m",
    -- toggle auto_preview
    toggle_preview = "P",
    -- opens a small popup with the full multiline message
    hover = "K",
    -- preview the diagnostic location
    preview = "p",
    -- close all folds
    close_folds = {"zM", "zm"},
    -- open all folds
    open_folds = {"zR", "zr"},
    -- toggle fold of current file
    toggle_fold = {"zA", "za"},
    -- preview item
    previous = "k",
    -- next item
    next = "j"
  },

  indent_lines = true, -- add an indent guide below the fold icons

  auto_open = false, -- automatically open the list when you have diagnostics
  auto_close = false, -- automatically close the list when you have no diagnostics
  auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
  auto_fold = false, -- automatically fold a file trouble list at creation
  auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
  signs = {
    -- icons / text used for a diagnostic
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "﫠"
  },
  use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- map quickfix menu here!
keymap("n", "<leader>t", ":TroubleToggle<CR>", opts)
