return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})

			vim.keymap.set("n", "kt", function()
				builtin.colorscheme({
					enable_preview = true,
					attach_mappings = function(_, map)
						map("i", "<CR>", function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							require("telescope.actions").close(prompt_bufnr)
							vim.cmd("colorscheme " .. selection.value)
							-- Save the colorscheme choice to a file
							local colorscheme_file = vim.fn.stdpath("config") .. "/colorscheme.lua"
							vim.fn.writefile(
								{ string.format("vim.cmd('colorscheme %s')", selection.value) },
								colorscheme_file
							)
						end)
						return true
					end,
				})
			end, { noremap = true, silent = true })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
