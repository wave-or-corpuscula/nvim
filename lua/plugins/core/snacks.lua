return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      enabled = true,
      sources = {
        explorer = {
          ignored = true, -- true заставляет Snacks ОТОБРАЖАТЬ файлы из .gitignore
          hidden = true,  -- true также включает показ скрытых (dotfiles) файлов, например .env
          exclude = {
            "__pycache__",
            "*.pyc",
            ".venv",
            "node_modules",
            ".git",
            ".pytest_cache",
          },
        },
      },
    },
  },
}

