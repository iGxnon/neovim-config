require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"sumneko_lua",
		"rust_analyzer",
		"gopls",
	},
})

local servers = {
	sumneko_lua = require("plugins.lsp.config.sumneko_lua"),
	rust_analyzer = require("plugins.lsp.config.rust_analyzer"),
	gopls = require("plugins.lsp.config.gopls"),
}

local unpack = function(name)
	if servers[name] == nil then
		return {
			on_setup = function(server)
				server.setup(require("plugins.lsp.config.default-opt"))
			end,
		}
	end
	return servers[name]
end

require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name)
		local server = require("lspconfig")[server_name]
		local setup_handler = unpack(server_name)
		setup_handler.on_setup(server)
	end,
})
