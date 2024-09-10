return {
    {
        "rcarriga/cmp-dap",
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "leoluz/nvim-dap-go",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            require("dapui").setup()
            require("dap-go").setup() -- debugger for go

            ---------------------> Java debugger config
            function attach_to_debug()
                dap.configurations.java = {
                    {
                        type = "java",
                        request = "attach",
                        name = "Attach to the process",
                        hostName = "localhost",
                        port = "5005",
                    },
                }
                dap.continue()
            end

            -------------------------> Spring Stuff <-------------------------
            function get_spring_boot_runner(profile, debug)
                local debug_param = ""
                if debug then
                    debug_param =
                    ' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005" '
                end
                local profile_param = ""
                if profile then
                    profile_param = " -Dspring-boot.run.profiles=" .. profile .. " "
                end
                return "mvn spring-boot:run " .. profile_param .. debug_param
            end

            function run_spring_boot(debug)
                vim.cmd("term " .. get_spring_boot_runner("local", debug))
            end

            -------------------------> Spring Stuff <-------------------------

            -- run debug
            function get_test_runner(test_name, debug)
                if debug then
                    return 'mvn test -Dmaven.surefire.debug -Dtest="' .. test_name .. '"'
                end
                return 'mvn test -Dtest="' .. test_name .. '"'
            end

            function run_java_test_method(debug)
                local utils = require("utils")
                local method_name = utils.get_current_full_method_name("\\#")
                vim.cmd("term " .. get_test_runner(method_name, debug))
            end

            function run_java_test_class(debug)
                local utils = require("utils")
                local class_name = utils.get_current_full_class_name()
                vim.cmd("term " .. get_test_runner(class_name, debug))
            end

            vim.keymap.set("n", "<Leader>da", ":lua attach_to_debug()<CR>", { desc = "Attach to debugger (java only)" })
            vim.keymap.set("n", "<F9>", function()
                run_spring_boot()
            end, { desc = "Run Spring Boot Application" })
            vim.keymap.set("n", "<F10>", function()
                run_spring_boot(true)
            end, { desc = "Run Spring Boot Application in Debug Mode" })
            vim.keymap.set("n", "<leader>tm", function()
                run_java_test_method()
            end, { desc = "Run single test in normal mode" })
            vim.keymap.set("n", "<leader>TM", function()
                run_java_test_method(true)
            end, { desc = "Run single test in debug mode" })
            vim.keymap.set("n", "<leader>tc", function()
                run_java_test_class()
            end, { desc = "Run test class in normal mode" })
            vim.keymap.set("n", "<leader>TC", function()
                run_java_test_class(true)
            end, { desc = "Run test class in debug mode" })

            -- view informations in debug
            function show_dap_centered_scopes()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.scopes)
            end

            vim.keymap.set(
                "n",
                "<Leader>dg",
                ":lua show_dap_centered_scopes()<CR>",
                { desc = "View information in debug" }
            )
            --------------------------------> Java Debugger config

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Toggle debug breakpoint" })
            vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Start or continue debugging" })
            vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step into" })
            vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "Step over" })
            vim.keymap.set("n", "<Leader>du", dap.step_out, { desc = "Step out" })
            vim.keymap.set("n", "<Leader>db", dap.step_back, { desc = "Step back" })
            vim.keymap.set("n", "<Leader>dr", dap.restart, { desc = "Restart" })
        end,
    },
}
