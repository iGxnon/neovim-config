local telescope = require("telescope")

telescope.setup({
	defaults = {
		-- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
		initial_mode = "insert",
	},
	pickers = {
		find_files = {
			-- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
			-- theme = "",
		},
	},
	extensions = {
		-- 扩展插件配置
	},
})

pcall(telescope.load_extension, "env")
