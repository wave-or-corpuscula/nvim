-- rename variable in all places
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename variable in all places" })

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim", -- если используете для автоустановки
  },
  config = function()
    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")

    lspconfig.gopls.setup({
      root_dir = util.root_pattern("go.mod", "go.work", ".git"),
      settings = {
        gopls = {
          ["ui.navigation.importShortcut"] = "Definition",
          env = {
            GOPLS_BOOTSTRAP = "true",
          },
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })

    lspconfig.pyright.setup({
      root_dir = function(fname)
        return util.root_pattern("pyproject.toml", ".git")(fname) or vim.fs.dirname(fname)
      end,

      on_attach = function(client, bufnr)
        client.server_capabilities.hoverProvider = false
        client.server_capabilities.signatureHelpProvider = false
      end,

      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            -- extraPaths = { "." },
            exclude = {
              "**/.venv",
            },
          },
        },
      },
    })

    lspconfig.ruff.setup({
      settings = {},
      keys = {
        {
          "gi",
          false,
          buffer = true,
        },
      },
    })

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
}
