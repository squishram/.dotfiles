local status_ok, styler = pcall(require, "styler")
if not status_ok then
    return
end

-- everforest
-- tundra
-- material
-- catppuccin
-- zephyr
-- gruvbox
-- meliora-theme/neovim
-- rebelot/kanagawa.nvim
-- rmehri01/onenord.nvim
-- rafamadriz/neon
-- sainnhe/everforest
-- sainnhe/edge
-- sainnhe/sonokai
-- sainnhe/gruvbox-material
-- luisiacc/gruvbox-baby
-- EdenEast/nightfox.nvim
-- marko-cerovac/material.nvim
-- folke/tokyonight.nvim
-- glepnir/zephyr-nvim
-- theniceboy/nvim-deus
-- Th3Whit3Wolf/one-nvim
-- andersevenrud/nordic.nvim
-- NTBBloodbath/doom-one.nvim
-- cpea2506/one_monokai.nvim
-- sam4llis/nvim-tundra
-- catppuccin/nvim
-- ellisonleao/gruvbox.nvim
-- rose-pine/neovim, as = 'rose-pine'


styler.setup({
    themes = {
        latex = { colorscheme = "everforest" },
        python = { colorscheme = "gruvbox" },
        help = { colorscheme = "catppuccin" },
        lua = { colorscheme = "catppuccin" },
        norg = { colorscheme = "everforest" },
        markdown = { colorscheme = "everforest" },
    },
})
