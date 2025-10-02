local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

vim.cmd("Copilot disable")

-- Load colorscheme if the file exists
local colorscheme_file = vim.fn.stdpath("config") .. "/colorscheme.lua"
if vim.loop.fs_stat(colorscheme_file) then
    vim.cmd("luafile " .. colorscheme_file)
end

-- vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "#000000" })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#000000" })
-- vim.api.nvim_set_hl(0, "VertSplit", { bg = "#000000" })
