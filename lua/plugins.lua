-- Auto install packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		pcall(vim.cmd, [[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Auto run :PackerSync when update plugins.lua
pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)

return require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")
		-- 主题
		use("sainnhe/sonokai")
		use("folke/tokyonight.nvim")
		-- 启动页
		use({
			"glepnir/dashboard-nvim",
			requires = { "nvim-tree/nvim-web-devicons" },
		})
		-- 文件树
		use({
			"nvim-tree/nvim-tree.lua", -- 文档树
			requires = {
				"nvim-tree/nvim-web-devicons", -- 文档树图标
			},
		})
		-- LSP
		use({
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		})

		-- 补全
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/vim-vsnip")

		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-cmdline")

		use("rafamadriz/friendly-snippets")

		-- 语法高亮
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use("p00f/nvim-ts-rainbow") -- 彩虹括号！！

		-- ui
		use("tami5/lspsaga.nvim")
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")
		use("ahmedkhalf/project.nvim")

		-- rust
		use({
			"saecki/crates.nvim",
			event = { "BufRead Cargo.toml" },
			requires = { { "nvim-lua/plenary.nvim" } },
			config = function()
				require("crates").setup()
			end,
		})
		use("simrat39/rust-tools.nvim")

		-- Debugging
		use("nvim-lua/plenary.nvim")
		use("mfussenegger/nvim-dap")
		use("theHamsta/nvim-dap-virtual-text")
		use("rcarriga/nvim-dap-ui")

		-- go Debugging
		use("leoluz/nvim-dap-go")

		-- Telescope
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		use("LinArcX/telescope-env.nvim")

		-- Comment
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})

		-- Utils
		use("windwp/nvim-autopairs")

		-- null-ls
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup()
			end,
		})
		use("jay-babu/mason-null-ls.nvim")

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
