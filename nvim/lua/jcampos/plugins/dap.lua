-- VSCode-style debugger: nvim-dap core + UI + inline values + mason auto-install.
-- Language adapters: Python (debugpy), JS/TS (js-debug-adapter), Go (delve).
return {
	{
		"mfussenegger/nvim-dap",
		version = "*",
		dependencies = {
			{ "rcarriga/nvim-dap-ui", version = "*", dependencies = { "nvim-neotest/nvim-nio" } },
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = "mason-org/mason.nvim",
				opts = {
					handlers = {},
					ensure_installed = {
						"python",        -- debugpy
						"js",            -- js-debug-adapter
						"delve",         -- Go
					},
				},
			},
			{ "leoluz/nvim-dap-go", ft = "go", opts = {} },
			{
				"mfussenegger/nvim-dap-python",
				ft = "python",
				config = function()
					local mason_path = vim.fn.stdpath("data") .. "/mason"
					require("dap-python").setup(mason_path .. "/packages/debugpy/venv/bin/python")
				end,
			},
		},
		keys = {
			-- VSCode-parity function keys
			{ "<F5>",  function() require("dap").continue() end,          desc = "Debug: continue / start" },
			{ "<F10>", function() require("dap").step_over() end,         desc = "Debug: step over" },
			{ "<F11>", function() require("dap").step_into() end,         desc = "Debug: step into" },
			{ "<F12>", function() require("dap").step_out() end,          desc = "Debug: step out" },

			-- Leader-d group
			{ "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Debug: toggle breakpoint" },
			{ "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end,            desc = "Debug: conditional breakpoint" },
			{ "<leader>dc", function() require("dap").continue() end,                                             desc = "Debug: continue" },
			{ "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Debug: run to cursor" },
			{ "<leader>di", function() require("dap").step_into() end,                                            desc = "Debug: step into" },
			{ "<leader>do", function() require("dap").step_over() end,                                            desc = "Debug: step over" },
			{ "<leader>dO", function() require("dap").step_out() end,                                             desc = "Debug: step out" },
			{ "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Debug: REPL" },
			{ "<leader>dl", function() require("dap").run_last() end,                                             desc = "Debug: run last" },
			{ "<leader>dt", function() require("dap").terminate() end,                                            desc = "Debug: terminate" },
			{ "<leader>du", function() require("dapui").toggle() end,                                             desc = "Debug: toggle UI" },
			{ "<leader>de", function() require("dapui").eval() end, mode = { "n", "v" },                          desc = "Debug: eval expression" },
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			-- Auto open/close UI on session start/exit
			dap.listeners.before.attach.dapui_config = function() dapui.open() end
			dap.listeners.before.launch.dapui_config = function() dapui.open() end
			dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
			dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

			-- Breakpoint signs (VSCode-ish)
			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { text = "◉", texthl = "DiagnosticInfo", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticOk", numhl = "" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "DiagnosticError", numhl = "" })

			-- JS/TS: mason-nvim-dap installs js-debug-adapter but doesn't wire
			-- launch configs. Define minimal ones for node + chrome attach/launch.
			for _, lang in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
				dap.configurations[lang] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch current file (pwa-node)",
						cwd = vim.fn.getcwd(),
						program = "${file}",
						sourceMaps = true,
						protocol = "inspector",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach to process (pwa-node)",
						processId = require("dap.utils").pick_process,
						cwd = vim.fn.getcwd(),
					},
				}
			end
		end,
	},
}
