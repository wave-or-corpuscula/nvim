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
  keys = {
    -- Модифицированные функции с передачей аргументов (на всякий случай)
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope find files (all)" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Telescope live grep (all)" },
    { "<leader>fG", function() require("telescope.builtin").git_files() end, desc = "Telescope git files" },
    -- Эти остаются без изменений
    { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Telescope buffers" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Telescope help tags" },
  },
}
