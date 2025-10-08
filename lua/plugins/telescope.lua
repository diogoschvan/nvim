return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'

    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Buscar arquivos' })
    vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Buscar texto' })
    vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Buscar buffers' })
    vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Buscar ajuda' })
    vim.keymap.set('n', '<leader>pk', builtin.keymaps, { desc = 'Buscar keymaps' })
    vim.keymap.set('n', '<leader>pw', builtin.grep_string, { desc = 'Buscar palavra' })
    vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = 'Buscar diagnósticos' })
    vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = 'Retomar busca' })
    vim.keymap.set('n', '<leader>pn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Buscar config Neovim' })

    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = 'Buscar no buffer atual' })
  end,
}
