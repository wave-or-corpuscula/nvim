return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  -- Глобальные настройки для Telescope
  opts = {
    defaults = {
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden',
        '--no-ignore',
        '--glob', '!.git/*',
        '--glob', '!.venv/*',
        '--glob', '!node_modules/*',
        '--glob', '!__pycache__/*',
        '--glob', '!*.pyc',
      },
    },
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true,
        file_ignore_patterns = {
          '^%.git/',
          '^%.venv/',
          '^node_modules/',
          '^__pycache__/',
          '%.pyc$',
        },
      },
      live_grep = {
        additional_args = function()
          return { '--glob', '!.venv/*', '--glob', '!node_modules/*', '--glob', '!__pycache__/*' }
        end,
      },
    },
  },
  config = function()
    vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true, desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true, desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fG", ":Telescope git_files<CR>", { silent = true, desc = "Telescope git files" })
    vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true, desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { silent = true, desc = "Telescope help tags" })
  end,
}
