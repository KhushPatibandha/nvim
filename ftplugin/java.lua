local config = {
    cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
    -- cmd = {'/path/to/jdt-language-server/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
    settings = {
        java = {
            signatureHelp = {
                enabled = true,
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                generateComments = true,
                insertPackage = true,
            },
        },
    },
    capabilities = {
        workspace = {
            configuration = true,
        },
        textDocument = {
            completion = {
                completionItem = {
                    snippentSupport = true,
                },
            },
        },
    },
}
config.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
require("jdtls").start_or_attach(config)
