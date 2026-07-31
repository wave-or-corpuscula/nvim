return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            go = { "gofumpt" },  -- только gofumpt, без goimports
            -- go = { "goimports" },  -- или только goimports
        },
    },
}
