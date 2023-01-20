local status_ok, revj = pcall(require, "revj")
if not status_ok then
  return
end

revj.setup{
    -- brackets to consider surrounding arguments
    brackets = {first = '([{<', last = ')]}>'},

    -- add new line between last argument and last bracket (only if no last seperator)
    new_line_before_last_bracket = true,

    -- if a seperator should be added if not present after last parameter
    add_seperator_for_last_parameter = true,

    -- enables default keymaps without having to set them below
    enable_default_keymaps = false,

    keymaps = {
        -- for operator (+motion)
        operator = '<Leader>J',
        -- for formatting current line
        line = '<Leader>j',
        -- for formatting visual selection
        visual = '<Leader>j',
    },

    -- specifies what text object selects an arguments (ie a, and i, by default)
    parameter_mapping = ',',
    -- if you're using `vim-textobj-parameter` you can also set this to `vim.g.vim_textobj_parameter_mapping`
}
