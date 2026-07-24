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
        '--hidden',        -- искать в скрытых файлах
        '--no-ignore',     -- игнорировать .gitignore
        '--glob', '!.git/*', -- НО не заходить в саму папку .git
      },
    },
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true,
        -- Исключаем папку .git из поиска по именам файлов
        file_ignore_patterns = { '^%.git/' }, 
      },
    },
  },
  keys = {
    -- Модифицированные функции с передачей аргументов (на всякий случай)
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope find files (all)" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Telescope live grep (all)" },
    -- Эти остаются без изменений
    { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Telescope buffers" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Telescope help tags" },
  },
}
