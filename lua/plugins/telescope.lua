return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
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
                "<Leader>tt",
                ":Telescope treesitter<CR>",
                { desc = "Search for symbols in current file with treesitter" }
            )
            vim.keymap.set(
                "n",
                "<Leader>ds",
                builtin.lsp_document_symbols,
                { desc = "Search for symbols in current file" }
            )
            vim.keymap.set(
                "n",
                "<Leader>ws",
                builtin.lsp_dynamic_workspace_symbols,
                { desc = "Search for symbols in whole project" }
            )
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

            vim.keymap.set("n", "<Leader>f/", function()
                builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 0,
                    previewer = true,
                    layout_strategy = "horizontal",
                    layout_config = {
                        height = 0.85,
                        width = 0.85,
                    },
                }))
            end, { desc = "Fuzzily find in current buffers" })

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
                                { string.format("vim.cmd('colorscheme %s')", selection.value) },
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
