return {
    "mbbill/undotree",
    vim.keymap.set("n", "<Leader>ut", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree" }),
}
