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

vim.opt.hlsearch = false -- :noh to clear
vim.opt.incsearch = true

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })

vim.keymap.set("v", "<C-down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
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

-- Wrap and unwrap lines
vim.keymap.set("n", "<A-z>", ":lua WrapOrUnwrap()<CR>")
function WrapOrUnwrap()
	if vim.opt.wrap:get() then
		vim.opt.wrap = false
	else
		vim.opt.wrap = true
	end
end

-- Goto line
local function goto_line()
	local line = vim.fn.input("Goto line: ")
	if line ~= "" then
		vim.cmd(":" .. line)
	end
end
vim.keymap.set({ "n", "i", "v" }, "<C-l>", goto_line)

-- @lua/vim-visual-multi.lua
-- Ctrl-n to select all keyword matches below the cursor
--   -> n (same as ctrl-n) to go to next match
--   -> N to go to previous match
--   -> q to skip the current match and go to the next match
--   -> Q to skip the current match and go to the previous selected match
--   -> ] to traverse next matches
--   -> [ to traverse previous matches
-- ctrl-up and ctrl-down in normal mode to swap multiple cursor up or down
