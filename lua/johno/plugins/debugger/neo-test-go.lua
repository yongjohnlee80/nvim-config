return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			{
				"fredrikaverpil/neotest-golang",
				dependencies = {
					"leoluz/nvim-dap-go",
				},
			},
		},
		opts = function(_, opts)
			table.insert(
				opts.adapters,
				require("neotest-golang")({
					go_test_args = {
						"-tags=test",
					},
					dap_go_opts = {
						delve = {
							build_flags = { "-tags=test" },
						},
					},
					testify_enabled = true,
				})
			)
		end,
	},
}
