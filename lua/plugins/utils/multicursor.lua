return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  keys = {
    {
      "<Up>",
      function() require("multicursor-nvim").lineAddCursor(-1) end,
      mode = { "n", "v" },
      desc = "Add cursor above",
    },
    {
      "<Down>",
      function() require("multicursor-nvim").lineAddCursor(1) end,
      mode = { "n", "v" },
      desc = "Add cursor below",
    },
    {
      "<leader><Up>",
      function() require("multicursor-nvim").lineSkipCursor(-1) end,
      mode = { "n", "v" },
      desc = "Skip line above",
    },
    {
      "<leader><Down>",
      function() require("multicursor-nvim").lineSkipCursor(1) end,
      mode = { "n", "v" },
      desc = "Skip line below",
    },
    {
      "<C-n>",
      function() require("multicursor-nvim").matchAddCursor(1) end,
      mode = { "n", "v" },
      desc = "Add cursor to next match",
    },
    {
      "<C-p>",
      function() require("multicursor-nvim").matchAddCursor(-1) end,
      mode = { "n", "v" },
      desc = "Add cursor to prev match",
    },
    {
      "<leader><C-n>",
      function() require("multicursor-nvim").matchSkipCursor(1) end,
      mode = { "n", "v" },
      desc = "Skip match",
    },
    {
      "<Left>",
      function() require("multicursor-nvim").nextCursor() end,
      mode = { "n", "v" },
      desc = "Go to next cursor",
    },
    {
      "<Right>",
      function() require("multicursor-nvim").prevCursor() end,
      mode = { "n", "v" },
      desc = "Go to prev cursor",
    },
    {
      "<leader>x",
      function() require("multicursor-nvim").deleteCursor() end,
      mode = { "n", "v" },
      desc = "Delete current cursor",
    },
    {
      "<Esc>",
      function()
        local mc = require("multicursor-nvim")
        if mc.hasCursors() then
          mc.clearCursors()
        else
          vim.cmd("nohlsearch")
        end
      end,
      mode = "n",
      desc = "Clear cursors or search highlight",
    },
  },

  config = function()
    require("multicursor-nvim").setup()
  end,
}
