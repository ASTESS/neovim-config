return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            transparent = false,
            hide_fillchars = false,
            borderless_telescope = true,
            terminal_colors = true,
            theme = {
                variant = "dark"
            }
        })
        vim.cmd.colorscheme "cyberdream"
    end,
}
