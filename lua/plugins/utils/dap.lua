-- debudder plugin

vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '◆', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '📝', texthl = 'DapLogPoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶️', texthl = 'DapStopped', linehl = 'Visual', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '🚫', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' })

return {
  -- 1. Ядро дебаггера
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- Графический интерфейс для дебаггера (переменные, логи, стек)
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
      -- Автоматическая настройка дебаггера для Python
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Инициализируем графический интерфейс
      dapui.setup()

      -- Автоматически открывать/закрывать окна дебаггера при старте и финише
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      -- Настраиваем плагин дебаггера для Python
      -- Указываем путь к debugpy, который ставится через Mason
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(mason_path)

      -- Назначаем горячие клавиши напрямую внутри конфигурации
      vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Dap: Breakpoint" })
      vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Dap: Start / Continue" })
      vim.keymap.set("n", "<leader>dt", function() dap.terminate() end, { desc = "Dap: Break" })
      vim.keymap.set("n", "<leader>do", function() dap.step_over() end, { desc = "Dap: Step outside" })
      vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Dap: Step inside" })
    end,
  },
}
