return {
  {
    -- highlights text that has changed since the list git commit
    -- also lets you interactively stage & unstage hunks in a commit
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

      -- stylua: ignore start
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")
      map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>ghd", gs.diffthis, "Diff This")
      map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },

  {
    "f-person/git-blame.nvim",
    opts = {
      -- enable gitblame
      enabled = true,
      -- <author>, <committer>, <date>, <committer-date>, <summary>, <sha>
      message_template = "<summary> • <date> • <author>",
      -- %r  relative date (e.g., 3 days ago)
      -- %a  abbreviated weekday name (e.g., Wed)
      -- %A  full weekday name (e.g., Wednesday)
      -- %b  abbreviated month name (e.g., Sep)
      -- %B  full month name (e.g., September)
      -- %c  date and time (e.g., 09/16/98 23:48:10)
      -- %d  day of the month (16) [01-31]
      -- %H  hour, using a 24-hour clock (23) [00-23]
      -- %I  hour, using a 12-hour clock (11) [01-12]
      -- %M  minute (48) [00-59]
      -- %m  month (09) [01-12]
      -- %p  either "am" or "pm" (pm)
      -- %S  second (10) [00-61]
      -- %w  weekday (3) [0-6 = Sunday-Saturday]
      -- %x  date (e.g., 09/16/98)
      -- %X  time (e.g., 23:48:10)
      -- %Y  full year (1998)
      -- %y  two-digit year (98) [00-99]
      -- %%  the character `%´
      date_format = "%r",
      message_when_not_committed = "Not Comitted!",
      display_virtual_text = 0,
    },
  },
}
