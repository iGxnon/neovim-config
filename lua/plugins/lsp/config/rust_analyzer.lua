return {
	on_setup = function(_)
		-- Initialize the LSP via rust-tools instead
		local rt = require("rust-tools")
		rt.setup({
			server = {
				on_attach = function(client, bufnr)
					local map = require("plugins.lsp.config.default-opt")
					map.on_attach(client, bufnr)
					-- Hover actions
					vim.keymap.set("n", "<leader>ha", rt.hover_actions.hover_actions, { buffer = bufnr })
					-- Code action groups
					-- Use <leader>a instead
					-- vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
				end,
				settings = {
					["rust-analyzer"] = {
						-- enable clippy on save
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			},
			dap = {
				adapter = require("plugins.dap.config.rust").adapter,
			},
		})
	end,
}
