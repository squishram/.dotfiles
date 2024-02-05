local lualineConfig = {

  extensions = { "trouble", "lazy" },
  options = {
    refresh = { statusline = 1000 },
    ignore_focus = {
      "DressingInput",
      "DressingSelect",
      "ccc-ui",
    },
    globalstatus = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    theme = "auto",
    disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
  },

  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      { "branch" },
      { "diff" },
      { "diagnostics", symbols = { error = "󰅚 ", warn = " ", info = "󰋽 ", hint = "󰘥 " } },
    },

    lualine_c = {
      -- git-blame
      {
        require("gitblame").get_current_blame_text,
        cond = require("gitblame").is_blame_text_available,
      },
    },

    lualine_x = {
      -- Word Count on certain filetypes
      {
        function()
          local words = vim.fn.wordcount()["words"]
          return "Words: " .. words
        end,
        cond = function()
          local ft = vim.opt_local.filetype:get()
          local count = {
            latex = true,
            tex = true,
            text = true,
            markdown = true,
            vimwiki = true,
          }
          return count[ft] ~= nil
        end,
      },
      {
        function()
          local recording_register = vim.fn.reg_recording()
          if recording_register == "" then
            return ""
          else
            return "Recording @" .. recording_register
          end
        end,
      },
    },

    lualine_y = {
      { "progress" },
      { "location" },
    },

    lualine_z = {
      function()
        return " " .. os.date("%R")
      end,
    },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "f-person/git-blame.nvim",
  },
  -- lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  opts = lualineConfig,
}
