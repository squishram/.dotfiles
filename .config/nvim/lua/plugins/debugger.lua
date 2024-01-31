-- TODO: work in progress
return {
  {
    -- debugger for compiled languages (e.g. rust)
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      -- config = function()
      --   local dap = require("dapui")
      --   dap.listeners.before.attach.dapui_config = function()
      --     dapui.open()
      --   end
      --   dap.listeners.before.launch.dapui_config = function()
      --     dapui.open()
      --   end
      --   dap.listeners.before.event_terminated.dapui_config = function()
      --     dapui.close()
      --   end
      --   dap.listeners.before.event_exited.dapui_config = function()
      --     dapui.close()
      --   end
      -- end,
      opts = {},
    },

    keys = {
      {
        "<leader>db",
        "<cmd> lua require('dapui').open()<cr>",
        desc = "Start debugger",
      },

      {
        "<leader>dd",
        "<cmd>lua require('dap').toggle_breakpoint<cr>",
        desc = "Toggle debugger breakpoint",
      },

      {
        "<leader>dr",
        "<cmd>lua require('dap').clear_breakpoints<cr>",
        desc = "Clear debugger breakpoints",
      },

      {
        "<leader>dr",
        "<cmd>lua require('dap').repl.toggle()<cr>",
        desc = "Toggle debugger REPL",
      },

      {
        "<leader>dx",
        "<cmd>lua require('dap').toggle_breakpoint<cr>",
        desc = "Toggle break point (debugger)",
      },

      {
        "<leader>dt",
        function()
          require("dap").terminate()
          require("dapui").close()
        end,
        desc = "Terminate debugger",
      },

      {
        "<leader>dc",
        "<cmd>lua require('dap').continue()<cr>",
        desc = "Continue debugger",
      },

      {
        "<leader>dj",
        "<cmd>lua require('dap').step_over()<cr>",
        desc = "Step over (debugger)",
      },

      {
        "<leader>dl",
        "<cmd>lua require('dap').step_into()<cr>",
        desc = "Step into (debugger)",
      },

      {
        "<leader>dh",
        "<cmd>lua require('dap').step_out()<cr>",
        desc = "Step out (debugger)",
      },
    },
  },
}
