-- ==================== Collection of various small independent plugins/modules ====================

return { 
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects, for example:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }
    -- Add/delete/replace surroundings (brackets, quotes, etc.), for example:
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    local statusline = require 'mini.statusline' -- Simple and easy statusline.
    statusline.setup { use_icons = vim.g.have_nerd_font } -- You can remove this setup call if you don't like it, and try some other statusline plugin

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function() -- Override the default statusline 'location' section to LINE:COLUMN
      return '%2l:%-2v'
    end
    -- ... and there is more! Check out: https://github.com/echasnovski/mini.nvim
  end,
}