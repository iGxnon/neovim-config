local util = require("lspconfig/util")

local opt = {
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}

return {
	on_setup = function(server)
		local opts = vim.tbl_deep_extend("force", require("plugins.lsp.config.default-opt"), opt)
		server.setup(opts)
	end,
}
