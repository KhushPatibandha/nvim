return {
    {
        "mfussenegger/nvim-jdtls",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                cmd = { "/run/current-system/sw/bin/lua-language-server" },
            })

            vim.lsp.config("gopls", {
                capabilities = capabilities,
                cmd = { "/run/current-system/sw/bin/gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = { unusedparams = true, unreachable = true },
                    },
                },
            })

            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = { "/run/current-system/sw/bin/clangd" },
            })

            vim.lsp.config("hls", {
                capabilities = capabilities,
                settings = {
                    haskell = {
                        formattingProvider = "fourmolu",
                        hlintOn = true,
                        plugins = {
                            ormolu = { enable = false },
                            hlint = { enable = true },
                        },
                    },
                },
                -- cmd = { "/run/current-system/sw/bin/haskell-language-server-wrapper" },
            })

            vim.lsp.enable({ "lua_ls", "gopls", "clangd", "hls" })

            vim.keymap.set(
                "n",
                "<Leader>rn",
                vim.lsp.buf.rename,
                { desc = "Rename word under cursor through out the project" }
            )
            vim.keymap.set("n", "<Leader>gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
            vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, { desc = "Open code action menu" })
        end,
    },
}
