return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-golang",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local neotest = require("neotest")
    local neotest_python = require("neotest-python")
    local neotest_golang = require("neotest-golang")

    neotest.setup({
      log_level = vim.log.levels.INFO,
      consumers = {},
      icons = {},
      highlights = {},
      floating = {},
      strategies = {},
      run = {},
      summary = {},
      output = {},
      output_panel = {},
      quickfix = {},
      status = {},
      state = {},
      watch = {},
      diagnostic = {},
      projects = {},
      discovery = {},
      running = {},
      default_strategy = "integrated",
      -- Ваш адаптер
      adapters = {
        neotest_python({
          runner = "pytest",
          python = "python3",
        }),
        neotest_golang({
          go_test_args = { "-v" },
          dap_go_enabled = true,
        }),
      },
    })  end,
  keys = {
    { "<leader>tr", function() require("neotest").run.run() end, desc = "Run nearest test" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run all tests in file" },
    { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug nearest test" },
    { "<leader>to", function() require("neotest").output.open() end, desc = "Open test output" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
    { "<leader>tw", function() require("neotest").watch.toggle() end, desc = "Toggle auto-run tests" },
  },
}
