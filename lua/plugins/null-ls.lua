local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

require("mason-null-ls").setup({
	automatic_installation = true,
	ensure_installed = { "stylua", "buf", "gitsigns" },
})

null_ls.setup({
	debug = false,
	sources = {
		-- formatting
		formatting.stylua,
		formatting.rustfmt,
		formatting.gofmt,
		formatting.buf,
		-- code_actions
		-- require('gitsigns')
		code_actions.gitsigns,
		-- go install github.com/fatih/gomodifytags@latest
		code_actions.gomodifytags,
		-- diagnostics
		-- https://github.com/bufbuild/buf
		diagnostics.buf,
		-- diagnostics.codespell,
	},
	should_attach = function(bufnr)
		if vim.api.nvim_buf_get_name(bufnr):match("^git://") then
			return false
		end
		-- 由于 on_attach 的callback中没有bufnr，这里用should_attach callback
		-- 绑定快捷键
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end

		-- 绑定快捷键
		require("keymaps").mapLSP(buf_set_keymap)
		return true
	end,
})
