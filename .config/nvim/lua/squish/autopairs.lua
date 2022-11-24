local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end

autopairs.setup({
    check_ts = true,
    ts_config = {
        -- it will not add a pair on that treesitter node
        -- lua = {'string'},
        -- javascript = {'template_string'},
        -- don't check treesitter on java
        -- java = false,
    },

    disable_filetype = {"TelescopePrompt"},

    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        -- Offset from pattern match
        offset = 0,
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
    },
})
