local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end


local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },

}

configs.setup {
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",
  -- ensure_installed = {"all", "norg", "norg_meta", "norg_table"},

  -- install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- List of parsers to ignore installing
  ignore_install = { "" },
  -- autopairs
  autopairs = {
    enable = true,
  },

  highlight = {
    -- false will disable the whole extension
    enable = true,
    -- list of language that will be disabled
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },

  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    -- disable = { "jsx", "cpp" },
    -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    extended_mode = true,
     -- Do not enable for files with more than n lines, int
    max_file_lines = nil,
    -- Table of hex strings
    -- colors = {},
    -- table of colour name strings
    -- termcolors = {}
  },

  autotag = {
    enable = true,
  }

}
