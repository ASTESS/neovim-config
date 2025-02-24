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
vim.diagnostic.config({ jump = { float = true }})
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Remap to make life easyier cause i use a alot
vim.keymap.set("n", "ga", "gi", { desc = "Move to the last insertion and INSERT" })

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

-- Telescope
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>")
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>")

-- Lsp
local on_lsp_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format { async = true } end,
        { desc = "Format code", buffer = bufnr })
end

vim.api.nvim_create_autocmd("LspAttach", {
        callback = on_lsp_attach,
    })
