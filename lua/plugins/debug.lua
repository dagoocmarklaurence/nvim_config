-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
	-- NOTE: Yes, you can install new plugins here!
	"mfussenegger/nvim-dap",
	-- NOTE: And you can specify dependencies as well
	dependencies = {
		-- Creates a beautiful debugger UI
		"rcarriga/nvim-dap-ui",

		-- Required dependency for nvim-dap-ui
		"nvim-neotest/nvim-nio",

		-- Installs the debug adapters for you
		"mason-org/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		-- Add your own debuggers here
		"samsung/netcoredbg",
		"firefox-devtools/vscode-firefox-debug",
	},
	keys = {
		-- Basic debugging keymaps, feel free to change to your liking!
		{
			"<F1>",
			function()
				require("dap").continue()
			end,
			desc = "Debug: Start/Continue",
		},
		{
			"<F2>",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step Into",
		},
		{
			"<F3>",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step Over",
		},
		{
			"<F4>",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step Out",
		},
		{
			"<F5>",
			function()
				require("dap").terminate()
			end,
			desc = "Debug: Terminate",
		},
		{
			"<F6>",
			function()
				require("dap").run_last()
			end,
			desc = "Debug: Run Last",
		},
		{
			"<F7>",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: See last session result.",
		},
		{
			"<F8>",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Debug: Set Breakpoint",
		},
		-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
		{
			"<F9>",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debug: Toggle Breakpoint",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		-- NOTE: require the line below if you want to debug automatically detecting dll
		local dotnet = require("plugins.nvim-dap-dotnet")
		local mason_path = vim.fn.stdpath("data") .. "\\mason\\packages\\netcoredbg\\netcoredbg"

		require("mason-nvim-dap").setup({
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_installation = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the langs you want
				-- "delve",
				-- "pwa-node",
				-- "pwa-chrome",
				-- "js-debug-adapter",
				"pwa-firefox",
				"coreclr",
			},
		})

		dap.configurations.cs = {
			-- NOTE: if you disable all this config it if you run debug it will prompt for which of all available dll to run
			{
				-- NOTE: To Debug with autodetecting the the dll
				type = "coreclr",
				name = "Launch .NET MVC App",
				request = "launch",
				program = function()
					-- return vim.fn.input("Path to DLL: ", vim.fn.getcwd() .. "\\bin\\Debug\\net8.0\\", "file")
					return dotnet.build_dll_path()
				end,
				cwd = vim.fn.getcwd(),
				stopAtEntry = false,
				env = {
					ASPNETCORE_ENVIRONMENT = "Development",
					ASPNETCORE_URLS = "http://localhost:5260",
				},
			},
			-- {
			-- 	-- NOTE: To Debug to the running app by selecting the PID (Process)
			-- 	type = "coreclr",
			-- 	name = "Launch .NET MVC App",
			-- 	request = "attach",
			-- 	processId = function()
			-- 		return tonumber(vim.fn.input("Enter process ID: "))
			-- 	end,
			-- },
		}
		dap.adapters["pwa-firefox"] = {
			type = "executable",
			command = "node",
			args = {
				vim.fn.stdpath("data") .. "\\mason\\packages\\firefox-debug-adapter\\dist\\adapter.bundle.js",
			},
		}

		dap.configurations.javascript = {
			{
				type = "pwa-firefox",
				name = "Launch Firefox",
				request = "launch",
				reAttach = true,
				url = "http://localhost:5299",
				webRoot = vim.fn.getcwd() .. "\\wwwroot",
				firefoxExecutable = "C:\\Program Files\\Mozilla Firefox\\firefox.exe",
			},
		}

		dap.configurations.typescript = dap.configurations.javascript
		dap.configurations.typescriptreact = dap.configurations.javascript
		dap.configurations.javascriptreact = dap.configurations.javascript

		-- Dap UI setup
		-- For more information, see |:help nvim-dap-ui|
		dapui.setup({
			-- Set icons to characters that are more likely to work in every terminal.
			--    Feel free to remove or use ones that you like more! :)
			--    Don't feel like these are good choices.
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		-- Change breakpoint icons
		vim.api.nvim_set_hl(0, "DapBreak", { fg = "#e51400" })
		vim.api.nvim_set_hl(0, "DapStop", { fg = "#ffcc00" })
		local breakpoint_icons = vim.g.have_nerd_font
			and {
				Breakpoint = "",
				BreakpointCondition = "",
				BreakpointRejected = "",
				LogPoint = "",
				Stopped = "",
			}
			or {
				Breakpoint = "●",
				BreakpointCondition = "⊜",
				BreakpointRejected = "⊘",
				LogPoint = "◆",
				Stopped = "⭔",
			}
		for type, icon in pairs(breakpoint_icons) do
			local tp = "Dap" .. type
			local hl = (type == "Stopped") and "DapStop" or "DapBreak"
			vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
		end

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- Install golang specific config
		-- require("dap-go").setup({
		-- 	delve = {
		-- 		-- On Windows delve must be run attached or it crashes.
		-- 		-- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
		-- 		detached = vim.fn.has("win32") == 0,
		-- 	},
		-- })
	end,
}
