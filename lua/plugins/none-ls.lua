return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua.with({
                    command = "/run/current-system/sw/bin/stylua",
                }),
                null_ls.builtins.formatting.prettier.with({
                    command = "/run/current-system/sw/bin/prettierd",
                }),
                null_ls.builtins.diagnostics.mypy.with({
                    command = "/run/current-system/sw/bin/mypy",
                }),
                null_ls.builtins.formatting.black.with({
                    command = "/run/current-system/sw/bin/black",
                }),
                require("none-ls.diagnostics.ruff").with({
                    command = "/run/current-system/sw/bin/ruff",
                }),
                require("none-ls.diagnostics.eslint_d").with({
                    command = "/run/current-system/sw/bin/eslint_d",
                }),
                null_ls.builtins.formatting.google_java_format.with({
                    command = "/run/current-system/sw/bin/google-java-format",
                    extra_args = { "--aosp" },
                }),
                null_ls.builtins.formatting.gofmt.with({
                    command = "/run/current-system/sw/bin/gofmt",
                }),
                null_ls.builtins.formatting.gofumpt.with({
                    command = "/run/current-system/sw/bin/gofumpt",
                }),
                null_ls.builtins.formatting.goimports_reviser.with({
                    command = "/run/current-system/sw/bin/goimports-reviser",
                }),
                null_ls.builtins.diagnostics.golangci_lint.with({
                    command = "/run/current-system/sw/bin/golangci-lint",
                }),
                null_ls.builtins.code_actions.gomodifytags.with({
                    command = "/run/current-system/sw/bin/gomodifytags",
                }),
                null_ls.builtins.code_actions.impl.with({
                    command = "/run/current-system/sw/bin/impl",
                }),
                null_ls.builtins.completion.spell.with({
                    filetypes = { "text", "markdown" },
                }),
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

-- return {
--     "nvimtools/none-ls.nvim",
--     dependencies = {
--         "nvimtools/none-ls-extras.nvim",
--     },

--     config = function()
--         local null_ls = require("null-ls")

--         null_ls.setup({
--             sources = {
--                 -- Existing sources
--                 null_ls.builtins.formatting.stylua,
--                 null_ls.builtins.formatting.prettier,
--                 null_ls.builtins.diagnostics.mypy,
--                 null_ls.builtins.formatting.black,
--                 require("none-ls.formatting.rustfmt"),
--                 require("none-ls.diagnostics.ruff"),
--                 null_ls.builtins.completion.spell.with({
--                     filetypes = { "text", "markdown" },
--                 }),
--                 require("none-ls.diagnostics.eslint_d"),

--                 -- Java
--                 null_ls.builtins.formatting.google_java_format.with({
--                     extra_args = { "--aosp" }, -- AOSP style uses 4 spaces
--                 }),

--                 -- Go
--                 null_ls.builtins.formatting.gofmt,
--                 null_ls.builtins.formatting.goimports_reviser,
--                 null_ls.builtins.diagnostics.golangci_lint,
--                 null_ls.builtins.code_actions.gomodifytags,
--                 null_ls.builtins.code_actions.impl,
--             },
--         })

--         vim.api.nvim_create_autocmd("FileType", {
--             pattern = { "java", "go" },
--             callback = function()
--                 vim.opt_local.tabstop = 4
--                 vim.opt_local.shiftwidth = 4
--                 vim.opt_local.expandtab = true
--             end,
--         })

--         vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, { desc = "Format file" })
--     end,
-- }
