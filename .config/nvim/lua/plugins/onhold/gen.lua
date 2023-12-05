return {
  -- hooks into local LLMs installed via ollama to provide AI functionality
  -- needs a decent amount of RAM to work, hence why I left it for now
  "David-Kunz/gen.nvim",
  keys = {
    { "<leader>]", "<cmd>Gen<cr>", mode = { "n", "v" }, desc = "LLM" },
  },
}
