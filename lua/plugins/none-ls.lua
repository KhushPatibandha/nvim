return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },

    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Existing sources
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.diagnostics.mypy,
                null_ls.builtins.formatting.black,
                require("none-ls.diagnostics.ruff"),
                null_ls.builtins.completion.spell.with({
                    filetypes = { "text", "markdown" },
                }),
                require("none-ls.diagnostics.eslint_d"),

                -- Java
                null_ls.builtins.formatting.google_java_format.with({
                    extra_args = { "--aosp" }, -- AOSP style uses 4 spaces
                }),

                -- Go
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.diagnostics.golangci_lint,
                null_ls.builtins.code_actions.gomodifytags,
                null_ls.builtins.code_actions.impl,
            },
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "java", "go" },
            callback = function()
                vim.opt_local.tabstop = 4
                vim.opt_local.shiftwidth = 4
                vim.opt_local.expandtab = true
            end,
        })

        vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, { desc = "Format file" })
    end,
}
