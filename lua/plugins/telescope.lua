return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                defaults = {
                    winblend = 30,
                },
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "Find file in whole project" })
            vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "Grep in whole project" })
            vim.keymap.set(
                "n",
                "<Leader>fs",
                builtin.grep_string,
                { desc = "Grep current string under cursor in whole project" }
            )
            vim.keymap.set("n", "<Leader><Leader>", builtin.buffers, { desc = "List open buffers" })
            vim.keymap.set(
                "n",
                "<Leader>ft",
                ":TodoTelescope keywords=TODO,HACK,PERF,NOTE,FIX,WARNING<CR>",
                { desc = "Search for marked comments. eg: TODO, FIX" }
            )

            -- Lsp Stuff
            vim.keymap.set("n", "<Leader>gd", builtin.lsp_definitions, { desc = "Go to definition" })
            vim.keymap.set("n", "<Leader>gi", builtin.lsp_implementations, { desc = "Go to implementation" })
            vim.keymap.set(
                "n",
                "<Leader>gr",
                builtin.lsp_references,
                { desc = "Get all the references in the project" }
            )

            vim.keymap.set("n", "<Leader>kt", function()
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
                                { string.format('vim.cmd("colorscheme %s")', selection.value) },
                                colorscheme_file
                            )
                        end)
                        return true
                    end,
                })
            end, { noremap = true, silent = true, desc = "Open theme picker" })
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
