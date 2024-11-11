return {
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
}

-- Go debug attach may require the following packages
-- go: downloading github.com/google/gops v0.3.28
-- go: downloading github.com/shirou/gopsutil/v3 v3.23.7
-- go: downloading github.com/xlab/treeprint v1.2.0
-- go: downloading github.com/tklauser/go-sysconf v0.3.11
-- go: downloading golang.org/x/sys v0.11.0
-- go: downloading github.com/tklauser/numcpus v0.6.0
