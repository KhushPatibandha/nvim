return {
    {
        "mfussenegger/nvim-jdtls",
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "google-java-format",
                    "checkstyle",
                    "golangci-lint",
                    "gomodifytags",
                    "impl",
                    "gofumpt", -- An enhanced version of gofmt
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "gopls", "ts_ls", "pyright" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
            -- local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.gopls.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities })
            lspconfig.pyright.setup({ capabilities = capabilities })

            -- vim.keymap.set(
            --     "n",
            --     "<leader>gr",
            --     vim.lsp.buf.references,
            --     { desc = "Get all the references in the project" }
            -- )
            -- vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
            -- vim.keymap.set("n", "<Leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
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
