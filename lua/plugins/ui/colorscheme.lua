return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  config = function()
    require("onedarkpro").setup({
      options = {
        cursorline = true,
        transparency = false,
        terminal_colors = true, -- Применять цвета темы внутри встроенного терминала
        highlight_inactive_windows = false,
      },
      colors = {
        vaporwave = { bg = "#1b202e" },
      }
      -- styles = {
      --   types = "NONE", -- Убираем курсив для типов данных, как в VSCode
      --   methods = "NONE",
      --   functions = "NONE",
      -- }
    })
    vim.cmd("colorscheme vaporwave") -- Активируем тему
  end,
}
