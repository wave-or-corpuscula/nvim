vim.opt.mouse = "a"
vim.opt.mousemoveevent = true

return
{
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    -- Переназначаем строчные [b и ]b на физическое перемещение вкладок
    { "[b", "<CMD>BufferLineMovePrev<CR>", mode = "n", desc = "Move buffer left" },
    { "]b", "<CMD>BufferLineMoveNext<CR>", mode = "n", desc = "Move buffer right" },
    
    -- Переназначаем заглавные [B и ]B на обычное переключение вкладок
    { "[B", "<CMD>BufferLineCyclePrev<CR>", mode = "n", desc = "Previous buffer" },
    { "]B", "<CMD>BufferLineCycleNext<CR>", mode = "n", desc = "Next buffer" },
  },
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        separator_style = "thick",
        padding = { 1, 2 },
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 100,
          reveal = { 'close' },
        },
        style_preset = {
          bufferline.style_preset.no_italic,
        },
        diagnostics = "nvim_lsp",
      },
    })
  end,
}
