return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "HiPhish/rainbow-delimiters.nvim",
        },
        build = ":TSUpdate",
        config = function()
            require "nvim-treesitter.configs".setup {
                -- A list of parser names, or "all"
                ensure_installed = { "lua", "tsx", "html", "typescript" },

                sync_install = false,

                auto_install = true,

                ignore_install = {},

                modules = {},

                highlight = {
                    enable = true,
                    use_languagetree = true,
                    additional_vim_regex_highlighting = false,
                },
                autotag = {
                    enable = true,
                },
            }
        end
    }
}

