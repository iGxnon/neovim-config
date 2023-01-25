-- 启用 git 下载
require("nvim-treesitter.install").prefer_git = true

require("nvim-treesitter.configs").setup({
	-- 添加不同语言
	ensure_installed = {
		"rust",
		"lua",
		"go",
		"proto",
		"javascript",
		"html",
		"dockerfile",
	}, -- one of "all" or a list of languages

	highlight = { enable = true },

	-- 增量选择，Normal 模式下按 [Enter] 选择，按 [Back] 取消
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},

	-- 代码缩进模块，Visual 模式下选中需要缩进的代码，按 = 缩进
	-- gg=G 可以缩进整个文件
	-- PS: 可以使用 <leader>f 使用 LSP 进行全文缩进
	indent = {
		enable = true,
	},

	-- 不同括号颜色区分
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})

-- 开启 Folding 模块，可以折叠代码块
-- zc 折叠  zo 打开
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
