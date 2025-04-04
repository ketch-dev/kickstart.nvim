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
    require('mini.surround').setup {
      mappings = { add = 'ua', delete = 'ud', find = 'uf', find_left = 'uF', highlight = 'uh', replace = 'ur', update_n_lines = 'un' },
    }

    if not vim.g.vscode then
      local statusline = require 'mini.statusline' -- Simple and easy statusline.
      statusline.setup {
        use_icons = not vim.g.vscode and vim.g.have_nerd_font or false,
      }
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end
  end,
}
