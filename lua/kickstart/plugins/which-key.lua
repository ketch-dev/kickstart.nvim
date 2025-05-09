-- ==================== Show you pending keybinds ====================

return {
  'folke/which-key.nvim',
  cond = not vim.g.vscode,
  event = 'VimEnter', -- sets the loading event to 'VimEnter'. Events can be normal autocommands events (`:help autocmd-events`)
  opts = {
    icons = {
      mappings = vim.g.have_nerd_font, -- set icon mappings to true if you have a Nerd Font
      keys = vim.g.have_nerd_font and {} or { -- empty table make plugin to use the default Nerd Font icons
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },
    spec = { -- document existing key chains
      { '<leader>c', group = '[C]ode:', mode = { 'n', 'x' } },
      { '<leader>d', group = '[D]ocument:' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>e', group = '[E]xplorer:' },
      { '<leader>s', group = '[S]plit:' },
      { '<leader>f', group = '[F]ind:' },
      { '<leader>w', group = '[W]orkspace:' },
      { '<leader>t', group = '[T]ab:' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
  },
}
