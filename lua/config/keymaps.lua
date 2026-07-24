-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


--core
vim.keymap.set('n', 'vv', '<C-v>', { desc = "Visual block mode" })

-- bufdelete
vim.keymap.set('n', 'qb', ":Bdelete<CR>", { silent = true, desc = 'Close current buffer' })
