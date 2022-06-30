local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("squish.lsp.lsp-installer")
require("squish.lsp.lsp-signature")
require("squish.lsp.handlers").setup()
require("squish.lsp.null-ls")
require("squish.lsp.aerial")
require("squish.lsp.renamer")
