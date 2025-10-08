return {
  'sainnhe/everforest',
  priority = 1000,
  config = function()
    -- Opções do tema (opcional)
    -- 'hard', 'medium' (padrão), 'soft'
    vim.g.everforest_background = 'hard'

    -- Melhor contraste para diagnósticos
    vim.g.everforest_better_performance = 1

    -- Desabilita itálico (opcional)
    vim.g.everforest_disable_italic_comment = 1

    vim.cmd.colorscheme 'everforest'
  end,
}
