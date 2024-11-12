return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-jest",
		},
		opts = function(_, opts)
			table.insert(
				opts.adapters,
				require("neotest-jest")({
					-- Use lerna to run tests, scoped to the specific package, from monorepo root
					jestCommand = function(file)
						local package_path = string.match(file, "(packages/[^/]+)")
						if package_path then
							local package_name = package_path:match("packages/([^/]+)")
							-- Ensure lerna runs from the root while targeting the package
							-- return "npx lerna run test --scope=" .. package_name .. " --"
							-- Use --prefix to point to the package path
							return "npm --prefix " .. package_path .. " run test --"
						end
						return "npm test --"
					end,

					-- Detect jest config file in package or monorepo root
					jestConfigFile = function(file)
						local root = vim.fn.getcwd()
						local package_path = string.match(file, "(packages/[^/]+)")
						if package_path then
							local config_file_js = package_path .. "/jest.config.js"
							local config_file_ts = package_path .. "/jest.config.ts"

							-- Return the existing config file for the package
							if vim.fn.filereadable(config_file_js) == 1 then
								return root .. config_file_js
							elseif vim.fn.filereadable(config_file_ts) == 1 then
								return root .. config_file_ts
							end
						end

						-- Fallback to root configuration
						if vim.fn.filereadable(root .. "/jest.config.js") == 1 then
							return root .. "/jest.config.js"
						elseif vim.fn.filereadable(root .. "/jest.config.ts") == 1 then
							return root .. "/jest.config.ts"
						end

						return nil
					end,

					env = { CI = true },

					-- Always set cwd to the root to ensure lerna.json can be found
					cwd = function()
						return vim.fn.getcwd()
					end,
				})
			)
		end,
	},
}

-- return {
-- 	{
-- 		"nvim-neotest/neotest",
-- 		dependencies = {
-- 			"nvim-neotest/neotest-jest",
-- 		},
-- 		opts = function(_, opts)
-- 			if opts.adapters == nil then
-- 				opts.adapters = {}
-- 			end
-- 			table.insert(
-- 				opts.adapters,
-- 				require("neotest-jest")({
-- 					jestCommand = "npm test --",
-- 					jestConfigFile = "jest.config.js",
-- 					env = { CI = true },
-- 					cwd = function()
-- 						return vim.fn.getcwd()
-- 					end,
-- 					-- ------------------------------------------
-- 					-- the following set up is for monorepo
-- 					-- ------------------------------------------
-- 					-- jestCommand = "npm jest --",
-- 					-- jestConfigFile = function(file)
-- 					-- 	if string.find(file, "/packages/") then
-- 					-- 		return string.match(file, "(.-/[^/]+/)src") .. "jest.config.js"
-- 					-- 	end
-- 					--
-- 					-- 	return vim.fn.getcwd() .. "/jest.config.js"
-- 					-- end,
-- 					-- env = { CI = true },
-- 					-- cwd = function(file)
-- 					-- 	if string.find(file, "/packages/") then
-- 					-- 		return string.match(file, "(.-/[^/]+/)src")
-- 					-- 	end
-- 					-- 	return vim.fn.getcwd()
-- 					-- end,
-- 				})
-- 			)
-- 		end,
-- 	},
-- }
