vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

vim.opt.guicursor = ""
vim.opt.scrolloff = 15
vim.opt.wrap = false

vim.opt.hlsearch = true -- :noh to clear
vim.opt.incsearch = true

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })

vim.keymap.set("v", "<C-down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<Leader>p", '"_dP')
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

vim.keymap.set("n", "<C-a>", "gg0VG$")
vim.keymap.set("i", "<C-a>", "<ESC>gg0VG$")

vim.keymap.set("n", "<C-_>", ":Commentary<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-_>", ":Commentary<CR>", { noremap = true, silent = true })

-- Auto format on save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format({async = false})]])

-- Ctrl + Backspace to remove previous word
vim.keymap.set("i", "<C-H>", "<C-w>")
vim.keymap.set("c", "<C-H>", "<C-w>")

-- Wrap and unwrap lines
vim.keymap.set("n", "<A-z>", ":lua WrapOrUnwrap()<CR>")
function WrapOrUnwrap()
    if vim.opt.wrap:get() then
        vim.opt.wrap = false
    else
        vim.opt.wrap = true
    end
end
