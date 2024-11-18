return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "echasnovski/mini.icons" },
    opts = function()
        local utils = require("core.utils")
        local copilot_colors = {
            [""] = utils.get_hlgroup("Comment"),
            ["Normal"] = utils.get_hlgroup("Comment"),
            ["Warning"] = utils.get_hlgroup("DiagnosticError"),
            ["InProgress"] = utils.get_hlgroup("DiagnosticWarn"),
        }

        return {
            options = {
                component_separators = { left = " ", right = " " },
                section_separators = { left = " ", right = " " },
                theme = "auto",
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "alpha" } },
            },
            sections = {
                lualine_a = { { "mode", icon = "" } },
                lualine_b = {
                    -- { "branch", icon = "" }
                },
                lualine_c = {
                    -- {
                    --     "diagnostics",
                    --     symbols = {
                    --         error = " ",
                    --         warn = " ",
                    --         info = " ",
                    --         hint = "󰝶 ",
                    --     },
                    -- },
                    { "filetype", icon_only = true,                 separator = "", padding = { left = 1, right = 0 } },
                    { "filename", padding = { left = 1, right = 0 } },
                },
                lualine_x = {
                    -- {
                    --     require("lazy.status").updates,
                    --     cond = require("lazy.status").has_updates,
                    --     color = utils.get_hlgroup("String"),
                    -- },
                    -- {
                    --     function()
                    --         local icon = " "
                    --         local status = require("copilot.api").status.data
                    --         return icon .. (status.message or "")
                    --     end,
                    --     cond = function()
                    --         local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
                    --         return ok and #clients > 0
                    --     end,
                    --     color = function()
                    --         if not package.loaded["copilot"] then
                    --             return
                    --         end
                    --         local status = require("copilot.api").status.data
                    --         return copilot_colors[status.status] or copilot_colors[""]
                    --     end,
                    -- },
                    -- { "diff" },
                },
                lualine_y = {
                    {
                        "progress",
                    },
                    {
                        "location",
                        color = utils.get_hlgroup("Boolean"),
                    },
                },
                lualine_z = {
                    {
                        "datetime",
                        style = "  %X",
                    },
                },
            },

            extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
        }
    end,
}
