return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle Debug Panels",
			},
			{
				"<leader>dC",
				function()
					require("dapui").close()
				end,
				desc = "Close Debug Panels",
			},
			{
				"<leader>dO",
				function()
					require("dapui").open()
				end,
				desc = "Open Debug Panels",
			},
		},
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
			-- IMPORTANT: For working with Typescript and Javascript debugging comment the following event.
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<leader>db", "<cmd> DapToggleBreakpoint <CR>", desc = "Add breakpoint at line" },
			{ "<C-F8>",     "<cmd> DapToggleBreakpoint <CR>", desc = "Add breakpoint at line" },
			{ "<F8>",       "<cmd> DapStepOver <CR>",         desc = "Step Over" },
			{ "<F7>",       "<cmd> DapStepInto <CR>",         desc = "Step Into" },
			{ "<S-F8>",     "<cmd> DapStepOut <CR>",          desc = "Step Out" },
			{ "<leader>dr", "<cmd> DapContinue <CR>",         desc = "Run or Continue the debugging" },
			{ "<F9>",       "<cmd> DapContinue <CR>",         desc = "Run or Continue the debugging" },
		},
		config = function(_, _)
			require("johno.plugins.configs.dap")
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
	},
}
