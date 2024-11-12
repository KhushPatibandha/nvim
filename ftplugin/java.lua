local jdtls = require("jdtls")

local config = {
    cmd = { "/run/current-system/sw/bin/jdtls" },
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),

    settings = {
        java = {
            signatureHelp = { enabled = true },
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
    capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities({
            workspace = { configuration = true },
            textDocument = {
                completion = {
                    completionItem = {
                        snippetSupport = true,
                    },
                },
            },
        })
    ),
}
jdtls.start_or_attach(config)
