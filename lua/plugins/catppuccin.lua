return {
	{
    		"catppuccin/nvim",
    		lazy = false,
    		name = "catppuccin",
    		priority = 100,
    		config = function()
      			vim.cmd.colorscheme "catppuccin-mocha"
    		end
  	}
}
