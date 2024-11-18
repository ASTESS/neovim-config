return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        config = function()
            require("todo-comments").setup()
            vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", { desc = "Open todo comments" })
        end,
    }
}
