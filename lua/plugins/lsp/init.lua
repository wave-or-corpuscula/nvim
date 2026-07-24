return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim", -- если используете для автоустановки
  },
  config = function()
    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")

    lspconfig.gopls.setup({
      root_dir = function(fname)
        local mod_root = util.root_pattern("go.mod", "go.work")(fname)

        if mod_root then return mod_root end

        local go_src_root = util.root_pattern("go.env", "codereview.cfg")(fname)
        if go_src_root then return go_src_root end

        return util.root_pattern(".git")(fname) or vim.fs.dirname(fname)
      end,
      settings = {
        gopls = {
          ["ui.navigation.importShortcut"] = "Definition",
          env = {
            GOPLS_BOOTSTRAP = "true"
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
  end
}
