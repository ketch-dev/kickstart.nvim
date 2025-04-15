-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  cond = not vim.g.vscode,
  lazy = false,
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  opts = {
    window = {
      mappings = {
        -- Disable default hjkl (optional)
        -- ['h'] = 'none', -- Disable collapse (if unused)
        ['j'] = 'none', -- Disable down
        -- ['k'] = 'none', -- Disable up
        ['l'] = 'none', -- Disable expand/open

        -- Remap r/s/f/t to act like h/j/k/l
        ['r'] = 'close_node', -- Collapse directory (like 'h')
        ['s'] = 'move_down', -- Down (or "move_down")
        ['f'] = 'move_up', -- Up (or "move_up")
        ['t'] = 'open', -- Expand/open (like 'l')
        ['<C-p>'] = 'prev_source',
        ['<C-n>'] = 'next_source',

        -- Restore original functions elsewhere (e.g., <Leader> keys)
        ['<Leader>r'] = 'refresh', -- Original 'r' (refresh)
        ['<Leader>s'] = 'split', -- Original 's' (split)
        ['<Leader>f'] = 'filter', -- Original 'f' (filter)
        ['<Leader>t'] = 'open_tab', -- Original 't' (open in tab)

        ['n'] = 'rename',
        ['y'] = 'copy_to_clipboard',
        ['h'] = 'open_split',
        ['v'] = 'open_vsplit',
        ['k'] = 'close_all_nodes',
        ['K'] = 'expand_all_nodes',
      },
    },
    filesystem = {
      hijack_netrw_behavior = 'open_default',
      group_empty_dirs = true,
      follow_current_file = { enabled = true },
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          'node_modules',
          '.git',
        },
      },
    },
    default_component_configs = {
      icon = {
        folder_closed = '', -- Arrow right (closed folder)
        folder_open = '', -- Arrow down (open folder)
        folder_empty = '', -- Arrow right (empty folder)
        folder_empty_open = '', -- Arrow down (empty open folder)
      },
    },
  },
}
