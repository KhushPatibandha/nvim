return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set("n", "<A-d>", ":Copilot disable<CR>", {})
		vim.keymap.set("n", "<A-a>", ":Copilot enable<CR>", {})
	end,
}
