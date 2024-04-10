return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        opts = {},
        build = function()
            vim.cmd("UpdateRemotePlugins") -- You need to restart to make it works
        end,
        event = "VeryLazy",
        keys = {
            { "C", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
        },
    }
}
