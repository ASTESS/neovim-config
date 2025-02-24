return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        pcall(require("telescope").load_extension, "fzf")
        require("telescope").load_extension("harpoon")

        require("telescope").setup { defaults = { file_ignore_patterns = { "node%_modules" } } }

        vim.keymap.set("n", "<leader>/", function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = "[/] Fuzzily search in current buffer" })


        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
        vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })

        vim.keymap.set("v", "<leader>sw", function()
            local selected_text = vim.fn.getreg("v")
            builtin.grep_string { search = selected_text }
        end, { desc = "[S]earch current [W]ord" })
    end
}

