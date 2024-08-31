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

-- Load colorscheme if the file exists
local colorscheme_file = vim.fn.stdpath("config") .. "/colorscheme.lua"
if vim.loop.fs_stat(colorscheme_file) then
    vim.cmd("luafile " .. colorscheme_file)
end
