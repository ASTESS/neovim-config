return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            transparent = false,
            hide_fillchars = false,
            borderless_picker = true,
            terminal_colors = true,
            options = {
                theme = {
                    variant = "dark"
                }
            }
        })
        vim.cmd.colorscheme "cyberdream"
    end,
}
