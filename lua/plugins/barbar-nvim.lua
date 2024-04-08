return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    config = function()
        vim.g.barbar_auto_setup = true
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<S-tab>', '<Cmd>BufferPrevious<CR>', opts)
        vim.keymap.set('n', '<tab>', '<Cmd>BufferNext<CR>', opts)
        vim.keymap.set('n', '<alt>x', '<Cmd>BufferClose<CR>', opts)
    end,
    opts = {},
    version = "^1.0.0",
}
