return {
  -- disable mini.pairs
  { "echasnovski/mini.pairs", enabled = false },

  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6",
    opts = {
      -- what profile to use
      profile = "default",
      -- whether to allow any insert map
      map = true,
      -- whether to allow any cmd-line map
      cmap = true, --cmap stands for cmd-line map
      -- whether to allow pair insert map
      pair_map = true,
      -- whether to allow pair cmd-line map
      pair_cmap = true,
      -- enable/disable multiline
      multiline = true,
      -- *ultimate-autopair-map-backspace-config*
      bs = {
        enable = true,
        map = "<bs>",
        cmap = "<bs>",
        -- delete closing if deleting opening?
        -- true: (|foo) > bs > |foo
        overjumps = true,
        -- delete spaces on both ends?
        -- true: ( |foo ) > bs > (|foo)
        -- balance: ( |foo  ) > bs > ( |foo )
        space = true, -- false, true or 'balance'
        -- remove surrounding newlines when deleting pair content?
        -- true: (\n\t|\n) > bs > (|)
        indent_ignore = false,
        -- idrk what this is
        -- true: <!--|--> > bs > <!-|
        single_delete = false,
        -- contains extension config
        conf = {},
        -- use multiple configs (|ultimate-autopair-map-multi-config|)
        multi = false,
      },

      -- *ultimate-autopair-map-newline-config*
      cr = {
        enable = true,
        map = "<cr>", --string or table
        -- autoclose pair on <CR>?
        -- true: (| > cr > (\n|\n)
        autoclose = false,
        --contains extension config
        conf = {
          cond = function(fn)
            return not fn.in_lisp()
          end,
        },
        --use multiple configs (|ultimate-autopair-map-multi-config|)
        multi = false,
      },

      -- *ultimate-autopair-map-space-config*
      space = {
        enable = true,
        map = " ",
        cmap = " ",
        --+ [|] > space > + [ ]
        check_box_ft = { "markdown", "vimwiki" },
        --contains extension config
        conf = {},
        --use multiple configs (|ultimate-autopair-map-multi-config|)
        multi = false,
      },

      -- *ultimate-autopair-map-space2-config*
      space2 = {
        enable = false,
        match = [[\k]],
        --what character activate
        conf = {},
        --contains extension config
        multi = false,
        --use multiple configs (|ultimate-autopair-map-multi-config|)
      },

      -- *ultimate-autopair-map-fastwarp-config*
      fastwarp = {
        enable = true,
        enable_normal = true,
        enable_reverse = true,
        -- jump to closing bracket on fastwarp?
        -- true: {(|)} > fastwarp > {(}|)
        hopout = false,
        map = "<A-e>",
        rmap = "<A-E>",
        cmap = "<A-e>",
        rcmap = "<A-E>",
        -- let fastwarp work over multiple lines
        -- true: (|) > fastwarp > (\n|)
        multiline = true,
        -- makes the cursor not move
        -- true: (|)foo > fastwarp > (|foo)
        -- disables multiline feature
        -- only activates if prev char is start pair, otherwise fallback to normal
        nocursormove = true,
        -- add a module so that if fastwarp fails
        -- then an `e` will not be inserted
        do_nothing_if_fail = true,
        no_filter_nodes = { "string", "raw_string" },
        --which nodes to skip for tsnode filtering
        faster = false,
        --only enables jump over pair, goto end/next line
        --useful for the situation of:
        --{|}M.foo('bar') > {M.foo('bar')|}
        conf = {},
        --contains extension config
        multi = false,
        --use multiple configs (|ultimate-autopair-map-multi-config|)
      },

      -- *ultimate-autopair-map-close-config*
      close = {
        enable = true,
        map = "<A-)>",
        cmap = "<A-)>",
        -- contains extension config
        conf = {},
        -- use multiple configs (|ultimate-autopair-map-multi-config|)
        multi = false,
        -- add a module so that if close fails
        -- then a `)` will not be inserted
        do_nothing_if_fail = true,
      },

      -- *ultimate-autopair-map-tabout-config*
      tabout = {
        enable = true,
        map = "<A-tab>",
        cmap = "<A-tab>",
        -- contains extension config
        conf = {},
        -- use multiple configs (|ultimate-autopair-map-multi-config|)
        multi = false,
        -- (|) > tabout > ()|
        hopout = true,
        --add a module so that if close fails
        --then a `\t` will not be inserted
        do_nothing_if_fail = true,
      },

      -- *ultimate-autopair-extensions-default-config*
      extensions = {
        cmdtype = { skip = { "/", "?", "@", "-" }, p = 100 },
        filetype = { p = 90, nft = { "TelescopePrompt" }, tree = true },
        escape = { filter = true, p = 80 },
        utf8 = { p = 70 },
        tsnode = { p = 60, separate = { "comment", "string", "raw_string" } },
        cond = { p = 40, filter = true },
        alpha = { p = 30, filter = false, all = false },
        suround = { p = 20 },
        fly = {
          other_char = { " " },
          nofilter = false,
          p = 10,
          undomapconf = {},
          undomap = nil,
          undocmap = nil,
          only_jump_end_pair = false,
        },
      },

      -- *ultimate-autopair-pairs-default-pairs*
      internal_pairs = {
        { "[", "]", fly = true, dosuround = true, newline = true, space = true },
        { "(", ")", fly = true, dosuround = true, newline = true, space = true },
        { "{", "}", fly = true, dosuround = true, newline = true, space = true },
        { '"', '"', suround = true, multiline = false, alpha = { "txt" } },
        {
          "'",
          "'",
          suround = true,
          cond = function(fn)
            return not fn.in_lisp() or fn.in_string()
          end,
          alpha = true,
          nft = { "tex", "latex" },
          multiline = false,
        },
        { "`", "`", nft = { "tex", "latex" }, multiline = false },
        { "``", "''", ft = { "tex", "latex" } },
        { "```", "```", newline = true, ft = { "markdown" } },
        { "<!--", "-->", ft = { "markdown", "html" } },
        { '"""', '"""', newline = true, ft = { "python" } },
        { "'''", "'''", newline = true, ft = { "python" } },
      },
    },
  },
}
