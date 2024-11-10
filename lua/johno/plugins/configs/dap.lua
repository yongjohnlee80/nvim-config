local dap = require("dap")

---------------------------------------------------------
-- C, C++ & Rust DAP setup
-- IMPORTANT: Comment out codelldb configurations when
-- working on a rust project.
-- rustacean.nvim plugin automatically configures the
-- adapter for the debugging.
---------------------------------------------------------
-- INFO: execute codelldb --port 13000 on the background.
-- dap.adapters.codelldb = {
-- 	type = "server",
-- 	host = "127.0.0.1",
-- 	port = 13000,
-- 	executable = {
-- 		command = "codelldb",
-- 		args = { "--port", "${port}" },
-- 	},
-- }

dap.configurations.c = {
	type = "codelldb",
	request = "launch",
	program = function()
		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
	end,
	--program = '${fileDirname}/${fileBasenameNoExtension}',
	cwd = "${workspaceFolder}",
	terminal = "integrated",
}

dap.configurations.cpp = dap.configurations.c

----------------------------------------------------------
-- Typescript
----------------------------------------------------------
-- setup adapters
require("dap-vscode-js").setup({
	debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
	debugger_cmd = { "js-debug-adapter" },
	adapters = { "pwa-node" }, -- , "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

dap.adapters["pwa-node"] = {
	type = "server",
	host = "127.0.0.1",
	port = 8123,
	executable = {
		command = "js-debug-adapter",
	},
}

for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "node",
		},
	}
end

-- custom adapter for running tasks before starting debug
-- local custom_adapter = "pwa-node-custom"
-- dap.adapters[custom_adapter] = function(cb, config)
-- 	if config.preLaunchTask then
-- 		local async = require("plenary.async")
-- 		local notify = require("notify").async
--
-- 		async.run(function()
-- 			---@diagnostic disable-next-line: missing-parameter
-- 			notify("Running [" .. config.preLaunchTask .. "]").events.close()
-- 		end, function()
-- 			vim.fn.system(config.preLaunchTask)
-- 			config.type = "pwa-node"
-- 			dap.run(config)
-- 		end)
-- 	end
-- end
--
-- -- language config
-- for _, language in ipairs({ "typescript", "javascript" }) do
-- 	dap.configurations[language] = {
-- 		{
-- 			name = "Launch",
-- 			type = "pwa-node",
-- 			request = "launch",
-- 			program = "${file}",
-- 			rootPath = "${workspaceFolder}",
-- 			cwd = "${workspaceFolder}",
-- 			sourceMaps = true,
-- 			skipFiles = { "<node_internals>/**" },
-- 			protocol = "inspector",
-- 			console = "integratedTerminal",
-- 		},
-- 		{
-- 			name = "Attach to node process",
-- 			type = "pwa-node",
-- 			request = "attach",
-- 			rootPath = "${workspaceFolder}",
-- 			processId = require("dap.utils").pick_process,
-- 		},
-- 		{
-- 			name = "Debug Main Process (Electron)",
-- 			type = "pwa-node",
-- 			request = "launch",
-- 			program = "${workspaceFolder}/node_modules/.bin/electron",
-- 			args = {
-- 				"${workspaceFolder}/dist/index.js",
-- 			},
-- 			outFiles = {
-- 				"${workspaceFolder}/dist/*.js",
-- 			},
-- 			resolveSourceMapLocations = {
-- 				"${workspaceFolder}/dist/**/*.js",
-- 				"${workspaceFolder}/dist/*.js",
-- 			},
-- 			rootPath = "${workspaceFolder}",
-- 			cwd = "${workspaceFolder}",
-- 			sourceMaps = true,
-- 			skipFiles = { "<node_internals>/**" },
-- 			protocol = "inspector",
-- 			console = "integratedTerminal",
-- 		},
-- 		{
-- 			name = "Compile & Debug Main Process (Electron)",
-- 			type = custom_adapter,
-- 			request = "launch",
-- 			preLaunchTask = "npm run build-ts",
-- 			program = "${workspaceFolder}/node_modules/.bin/electron",
-- 			args = {
-- 				"${workspaceFolder}/dist/index.js",
-- 			},
-- 			outFiles = {
-- 				"${workspaceFolder}/dist/*.js",
-- 			},
-- 			resolveSourceMapLocations = {
-- 				"${workspaceFolder}/dist/**/*.js",
-- 				"${workspaceFolder}/dist/*.js",
-- 			},
-- 			rootPath = "${workspaceFolder}",
-- 			cwd = "${workspaceFolder}",
-- 			sourceMaps = true,
-- 			skipFiles = { "<node_internals>/**" },
-- 			protocol = "inspector",
-- 			console = "integratedTerminal",
-- 		},
-- 	}
-- end
--
