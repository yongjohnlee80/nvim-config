return {
	{
		"nvimtools/none-ls.nvim",
		-- event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		ft = { "go", "cpp", "c", "rust", "python", "lua", "js", "ts", "javascript", "typescript" },
		config = function()
			require("johno.plugins.configs.none-ls")
		end,
	},
	-- {
	-- 	"stevearc/conform.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function()
	-- 		local conform = require("conform")
	--
	-- 		conform.setup({
	-- 			formatters_by_ft = {
	-- 				javascript = { "prettier" },
	-- 				typescript = { "prettier" },
	-- 				javascriptreact = { "prettier" },
	-- 				typescriptreact = { "prettier" },
	-- 				css = { "prettier" },
	-- 				html = { "prettier" },
	-- 				json = { "prettier" },
	-- 				yaml = { "prettier" },
	-- 				markdown = { "prettier" },
	-- 				lua = { "stylua" },
	-- 				python = { "isort", "black" },
	-- 			},
	-- 			format_on_save = {
	-- 				lsp_fallback = true,
	-- 				async = false,
	-- 				timeout_ms = 1000,
	-- 			},
	-- 		})
	--
	-- 		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	-- 			conform.format({
	-- 				lsp_fallback = true,
	-- 				async = false,
	-- 				timeout_ms = 1000,
	-- 			})
	-- 		end, { desc = "Format file or range (in visual mode)" })
	-- 	end,
	-- },
}
