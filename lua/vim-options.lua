vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.list = true
vim.opt.listchars:append("space:·")
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("trail:·")
vim.opt.listchars:append("tab:» ")

---------------relative line numbers---------------
vim.cmd("set number relativenumber")
function ToggleNumber()
	if vim.wo.relativenumber then
		vim.cmd("set norelativenumber")
	else
		vim.cmd("set relativenumber")
	end
end

vim.api.nvim_set_keymap("n", "<leader>\\", ":lua ToggleNumber()<CR>", { noremap = true, silent = true })
--------------------------------------------------

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

----------------------------------------------- Lessons -----------------------------------------------

-- Lesson On Horizontal Movement
-- viw -> select the word
-- f 'x' -> find the next 'x' characters
-- F 'x' -> find the previous 'x' characters
-- vi 'parenthesis' -> select inside the parenthesis
-- va 'parenthesis' -> select inside of the parenthesis and the parenthesis
-- yi 'parenthesis' -> yank inside the parenthesis
-- ya 'parenthesis' -> yank inside the parenthesis and the parenthesis
-- ci 'parenthesis' -> change inside the parenthesis
-- ca 'parenthesis' -> change inside the parenthesis and the parenthesis
-- di 'parenthesis' -> delete inside the parenthesis
-- da 'parenthesis' -> delete inside the parenthesis and the parenthesis
-- o -> move to the other end of the selection
-- vip -> select the paragraph
-- vap -> select the paragraph including the white spaces
-- yap -> contiguously select and yank the paragraph including all the white space at the end and above
-- yip -> contiguously select and yank the paragraph but not the white space at the end and above
-- dip -> contiguously select and delete the paragraph but not the white space at the end and above
-- dap -> contiguously select and delete the paragraph including the white space at the end and above
