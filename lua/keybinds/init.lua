vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Noh command
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })

-- Window movement
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Remap to make life easyier cause i use a alot
vim.keymap.set("n", "ga", "gi", { desc = "Move to the last insertion and INSERT" })

-- Telescope
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>")
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>")

-- Lsp actions
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--   callback = function(ev)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
--
--     -- Buffer local mappings.
--     vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions", buffer = ev.buf })
--     vim.keymap.set("n", "<leader>cf", function()
--       vim.lsp.buf.format { async = true }
--     end, { desc = "Format code", buffer = ev.buf })
--     vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename variable", buffer = ev.buf })
--     vim.keymap.set({ "n", "i" }, "<leader>ci", vim.lsp.buf.hover, { desc = "Get info", buffer = ev.buf })
--   end,
-- })

-- Oil
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

-- Github copilot
vim.keymap.set("i", "<C-q>", "copilot#Accept()", { expr = true, silent = true, replace_keycodes = false })
-- let copilot predict
vim.keymap.set("i", "<C-b>", "copilot#Suggest()", { expr = true, silent = true, replace_keycodes = false })
vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap('n', '<C-c>', '<S-c>', { noremap = true })

-- Lazygit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open lazygit" })

-- Theme toggle (dark/light)
vim.api.nvim_set_keymap("n", "<leader>tt", ":CyberdreamToggleMode<CR>", { noremap = true, silent = true })

-- Change arrow keys + shift
vim.api.nvim_set_keymap("n", "<S-Left>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-Right>", "<Right>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-Up>", "<Up>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-Down>", "<Down>", { noremap = true })
vim.api.nvim_set_keymap("v", "<S-Left>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("v", "<S-Right>", "<Right>", { noremap = true })
vim.api.nvim_set_keymap("v", "<S-Up>", "<Up>", { noremap = true })
vim.api.nvim_set_keymap("v", "<S-Down>", "<Down>", { noremap = true })
vim.api.nvim_set_keymap("i", "<S-Left>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "<S-Right>", "<Right>", { noremap = true })
vim.api.nvim_set_keymap("i", "<S-Up>", "<Up>", { noremap = true })
vim.api.nvim_set_keymap("i", "<S-Down>", "<Down>", { noremap = true })
