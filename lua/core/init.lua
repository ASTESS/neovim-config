vim.wo.number = true
vim.opt.relativenumber = true

vim.o.undofile = true
vim.o.breakindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = "yes"

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = "menuone,noselect"

vim.o.termguicolors = true

vim.opt.mouse = ""

vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.cmd [[set clipboard=unnamedplus]]
