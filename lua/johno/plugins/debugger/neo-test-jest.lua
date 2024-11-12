return {
	{
		-- "nvim-neotest/neotest",
		-- dependencies = {
		-- 	"haydenmeade/neotest-jest",
		-- },
		-- opts = function(_, opts)
		-- 	if opts.adapters == nil then
		-- 		opts.adapters = {}
		-- 	end
		-- 	table.insert(
		-- 		opts.adapters,
		-- 		require("neotest-jest")({
		-- 			jestCommand = "npm jest --",
		-- 			jestConfigFile = function(file)
		-- 				if string.find(file, "/packages/") then
		-- 					return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
		-- 				end
		--
		-- 				return vim.fn.getcwd() .. "/jest.config.ts"
		-- 			end,
		-- 			env = { CI = true },
		-- 			cwd = function(file)
		-- 				if string.find(file, "/packages/") then
		-- 					return string.match(file, "(.-/[^/]+/)src")
		-- 				end
		-- 				return vim.fn.getcwd()
		-- 			end,
		-- 		})
		-- 	)
		-- end,
	},
}
