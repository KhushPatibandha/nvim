return {
    {
        "meatballs/notebook.nvim",
        config = function()
            local nb = require("notebook")
            vim.keymap.set("n", "<Leader>nba", ":NBAddCell<CR>", {})
            vim.keymap.set("n", "<Leader>nbi", ":NBInsertCell<CR>", {})
            vim.keymap.set("n", "<Leader>nbd", ":NBDeleteCell<CR>", {})
            vim.keymap.set("n", "<Leader>nbk", ":NBMoveCellUp<CR>", {})
            vim.keymap.set("n", "<Leader>nbj", ":NBMoveCellDown<CR>", {})
            nb.setup({
                insert_blank_line = true,
                show_index = true,
                show_cell_type = true,
                virtual_text_style = { fg = "lightblue", italic = true },
            })
        end,
    },
    {
        "hkupty/iron.nvim",
        config = function()
            local iron = require("iron.core")
            iron.setup({
                config = {
                    scratch_repl = true,
                    repl_definition = {
                        python = {
                            command = { "python" },
                        },
                    },
                    repl_open_cmd = require("iron.view").right(60),
                },
                keymaps = {
                    -- send_motion = "<Leader>rc",
                    visual_send = "<Leader>nbv",
                    send_file = "<Leader>nbf",
                    send_line = "<Leader>nbl",
                    -- send_mark = "<Leader>rm",
                    -- mark_motion = "<Leader>rmc",
                    -- mark_visual = "<Leader>rmc",
                    -- remove_mark = "<Leader>rmd",
                    -- cr = "<Leader>r<cr>",
                    -- interrupt = "<Leader>r<Leader>",
                    exit = "<Leader>nbq",
                    clear = "<Leader>nbx",
                },
                highlight = {
                    italic = true,
                },
                ignore_blank_lines = true,
            })
            -- vim.keymap.set("n", "<Leader>rs", "<cmd>IronRepl<cr>")
            -- vim.keymap.set("n", "<Leader>rr", "<cmd>IronRestart<cr>")
            -- vim.keymap.set("n", "<Leader>rF", "<cmd>IronFocus<cr>")
            -- vim.keymap.set("n", "<Leader>rh", "<cmd>IronHide<cr>")
        end,
    },
}
