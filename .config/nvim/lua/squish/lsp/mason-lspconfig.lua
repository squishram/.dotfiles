local status_ok, masonlsp = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local servers = {
  -- "cssls",
  -- "cssmodules_ls",
  -- "emmet_ls",
  "html",
  -- "jdtls",
  -- "jsonls",
  -- "solc",
  "sumneko_lua",
  -- "tflint",
  -- "tsserver",
  "pyright",
  "yamlls",
  "bashls",
  -- "clangd",
  "rust_analyzer",
  "texlab",
  -- "taplo",
}

masonlsp.setup({
    -- A list of servers to automatically install if they're not already installed
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = servers

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = false,
})
