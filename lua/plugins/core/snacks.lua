return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      enabled = false,
    },
    picker = {
      sources = {
        explorer = {
          ignored = true, -- true заставляет Snacks ОТОБРАЖАТЬ файлы из .gitignore
          hidden = true,  -- true также включает показ скрытых (dotfiles) файлов, например .env
        },
      },
    },
  },
}

