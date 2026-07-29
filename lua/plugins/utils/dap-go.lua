local function run_all_go_tests()
  local file_dir = vim.fn.expand('%:p:h')
  local file_name = vim.fn.expand('%:t')
  print("Running all tests in: " .. file_dir .. "/" .. file_name)

  vim.cmd("split | terminal go test -C " .. vim.fn.fnameescape(file_dir) .. " -v")
  vim.cmd("startinsert")
end

local function run_closest_go_test()
  local current_line = vim.fn.line(".")
  local test_name = nil

  for i = current_line, 1, -1 do 
    local line = vim.fn.getline(i)
    test_name = string.match(line, "func%s+(Test[%w_]+)%s*%(")
    if test_name then
      break
    end
  end

  local file_dir = vim.fn.expand('%:p:h')
  print("Running test in: " .. file_dir)

  if test_name then
    vim.cmd("split | terminal go test -C " .. vim.fn.fnameescape(file_dir) .. " -run ^" .. test_name .. "$ -v")
    vim.cmd("startinsert")
  else
    print("Not found any tests above cursor!")
  end
end


return {
  "leoluz/nvim-dap-go",
  ft = "go",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    require("dap-go").setup({
      dap_configurations = {
        {
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      delve = {
        path = "dlv",
        initialize_timeout_sec = 20,
        port = "${port}",
        args = {},
        build_flags = {},
        detached = false,
        cwd = nil,
      },
      tests = {
        verbose = true,
      },
    })

    vim.keymap.set("n", "<leader>ra", run_all_go_tests, { desc = "Go: Run all tests in current file" }) 
    vim.keymap.set("n", "<leader>rt", run_closest_go_test, { desc = "Go: Run nearest go test" })
    vim.keymap.set("n", "<leader>dt", function()
      local original_cwd = vim.fn.getcwd()

      local current_file_dir = vim.fn.expand("%:p:h")
      local root_markers = { "go.mod" }
      local found = vim.fs.find(root_markers, { path = current_file_dir, upward = true })

      local project_root = #found > 0 and vim.fs.dirname(found[1]) or current_file_dir

      vim.api.nvim_set_current_dir(project_root)

      require("dap-go").debug_test()

      vim.defer_fn(function()
        vim.api.nvim_set_current_dir(original_cwd)
      end, 100)
    end, { desc = "Dap Go: Debug nearest test" })
  end,
}
