local on_lsp_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.hover() end, opts)
    -- vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format { async = true } end,
        { desc = "Format code", buffer = bufnr })
end

return {
    {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup()
        end,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'saadparwaiz1/cmp_luasnip' },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'nvim_lsp_signature_help' },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete {},
                    ["<C-d>"] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    -- ['<Tab>'] = cmp_action.luasnip_supertab(),
                    -- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                }),
                preselect = 'item',
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                },
            })
            require("luasnip.loaders.from_vscode").load({ paths = { "~/.config/snippets" } })
        end
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                on_lsp_attach(client, bufnr)
            end)
            lsp_zero.set_server_config({
                capabilities = {
                    textDocument = {
                        foldingRange = {
                            dynamicRegistration = false,
                            lineFoldingOnly = true
                        }
                    }
                }
            })

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })
        end
    },
    -- Dotnet Roslyn
    {
        'jmederosalvarado/roslyn.nvim',
        dependencies = { 'hrsh7th/cmp-nvim-lsp' },
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
            require("roslyn").setup({
                on_attach = on_lsp_attach,
                capabilities = capabilities
            })
        end
    },
}
