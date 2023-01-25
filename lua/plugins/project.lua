local project = require("project_nvim")

vim.g.nvim_tree_respect_buf_cwd = 1

vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
	detection_methods = { "pattern" },
	patterns = {
		".git",
		"_darcs",
		".hg",
		".bzr",
		".svn",
		"pom.xml",
		"build.gradle",
		"Makefile",
		"package.json",
		".sln",
		"go.work",
	},
})

local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("没有找到 telescope")
	return
end
pcall(telescope.load_extension, "projects")
