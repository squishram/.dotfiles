return {
  "rasulomaroff/reactive.nvim",
  event = { "BufReadPre", "BufNewFile" },

  opts = {
    builtin = {
      cursorline = true,
      cursor = true,
      modemsg = true,
    },
  },
}
