return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- vim.keymap.set('n', '<C-b>', ':Neotree toggle right<CR>', {})
		require("neo-tree").setup({
			close_if_last_window = true,
			window = {
				mappings = {
					["<C-b>"] = "close_window",
				},
			},
		})
		vim.keymap.set("n", "<C-b>", function()
			local neo_tree_window
			for _, win in ipairs(vim.api.nvim_list_wins()) do
				local buf = vim.api.nvim_win_get_buf(win)
				if vim.bo[buf].filetype == "neo-tree" then
					neo_tree_window = win
					break
				end
			end
			if vim.bo.filetype == "neo-tree" then
				vim.cmd("Neotree close")
			elseif neo_tree_window then
				vim.api.nvim_set_current_win(neo_tree_window)
			else
				vim.cmd("Neotree toggle right")
			end
		end, { noremap = true, silent = true })

		-- vim.keymap.set("n", "<Leader>fb", ":Neotree buffers reveal float<CR>", {})
	end,
}
