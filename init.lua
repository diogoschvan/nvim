-- Leader key (tecla principal para atalhos customizados)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Habilita Nerd Font (fontes com ícones)
vim.g.have_nerd_font = false

-- Aparência e Interface
vim.opt.number = true -- Mostra números das linhas
vim.opt.mouse = 'a' -- Habilita o mouse
vim.opt.showmode = false -- Não mostra o modo (já aparece na statusline)
vim.opt.cursorline = true -- Destaca a linha atual
vim.opt.signcolumn = 'yes' -- Sempre mostra coluna de sinais (git, diagnósticos)
vim.opt.list = true -- Mostra caracteres invisíveis
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Indentação e formatação
vim.opt.breakindent = true -- Mantém indentação ao quebrar linha

-- Busca
vim.opt.ignorecase = true -- Ignora maiúsculas/minúsculas na busca
vim.opt.smartcase = true -- Considera maiúsculas se você digitar maiúsculas
vim.opt.inccommand = 'split' -- Preview de substituições ao vivo

-- Histórico e performance
vim.opt.undofile = true -- Salva histórico de undo permanentemente
vim.opt.updatetime = 250 -- Tempo para atualizar (ms)
vim.opt.timeoutlen = 300 -- Tempo de espera para sequências de teclas (ms)

-- Janelas e splits
vim.opt.splitright = true -- Abre splits verticais à direita
vim.opt.splitbelow = true -- Abre splits horizontais abaixo
vim.opt.scrolloff = 10 -- Mantém 10 linhas visíveis acima/abaixo do cursor

-- Confirmações
vim.opt.confirm = true -- Pede confirmação ao invés de dar erro

-- Clipboard (sincroniza com sistema operacional)
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Atalhos customizados
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Abrir explorador de arquivos' })

-- Navegação entre janelas
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Janela esquerda' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Janela direita' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Janela inferior' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Janela superior' })

-- Autocommands
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight ao copiar',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Setup do Lazy.nvim (gerenciador de plugins)
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- Carrega plugins
require('lazy').setup('plugins', {
  ui = {
    -- Ícones do menu :Lazy
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
  performance = {
    reset_packpath = true,
  },
})
