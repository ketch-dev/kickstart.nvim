-- ==================== Fuzzy finder. Press <c-/> (I) or ? (N) to open a window with keymaps for the current picker ====================

return {
  'nvim-telescope/telescope.nvim',
  cond = not vim.g.vscode,
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make', -- `build` is used to run some command when the plugin is installed/updated, this is only run then, not every time Neovim starts up
      cond = function() -- `cond` is a condition used to determine whether this plugin should be installed and loaded
        return vim.fn.executable('make') == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup({
      defaults = {
        path_display = { 'smart' },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    })
    -- enable telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require('telescope.builtin') -- see `:help telescope.builtin`
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind: [H]elp' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind: [K]eymaps' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind: [F]iles' })
    vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[F]ind: [S]elect Telescope' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind: current [W]ord' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind: [G]rep' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind: [D]iagnostics' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind: [R]esume' })
    vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind: Recent Files' })
    vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = '[F]ind: [T]odo' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind: [B]uffers' })

    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = '[/] Fuzzily find in current buffer' })

    vim.keymap.set('n', '<leader>f/', function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      })
    end, { desc = '[F]ind: [/] in Open Files' })

    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files({ cwd = vim.fn.stdpath('config') })
    end, { desc = '[F]ind: [N]eovim files' })
  end,
}
