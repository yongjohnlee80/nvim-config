return {
	{
		"mrcjkb/rustaceanvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
		config = function()
			local mason_registry = require("mason-registry")
			local codelldb = mason_registry.get_package("codelldb")
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb"

			-- Only Linux and OS X are supported; Windows is not supported
			local this_os = vim.uv.os_uname().sysname
			liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")

			local cfg = require("rustaceanvim.config")
			vim.g.rustaceanvim = {
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
}
