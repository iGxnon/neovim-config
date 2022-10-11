local packer = require("packer")

packer.startup({
  function(use)

    use 'wbthomason/packer.nvim'

    -- 主题
    use 'sainnhe/sonokai'
    use 'shaunsingh/solarized.nvim'
    -- 插件
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      }
    }
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    use("glepnir/dashboard-nvim")
    use("ahmedkhalf/project.nvim")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("williamboman/nvim-lsp-installer")
    use({ "neovim/nvim-lspconfig" })

    use("hrsh7th/nvim-cmp")
    use("hrsh7th/vim-vsnip")

    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-cmdline")

    use("rafamadriz/friendly-snippets")
    use("simrat39/rust-tools.nvim")
    use("b0o/schemastore.nvim")

    use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    })

    use "LinArcX/telescope-env.nvim"
    use("tami5/lspsaga.nvim")
    use("windwp/nvim-autopairs")
    use("numToStr/Comment.nvim")
    use('mfussenegger/nvim-dap')
    use("theHamsta/nvim-dap-virtual-text")
    use("rcarriga/nvim-dap-ui")
    use('wakatime/vim-wakatime')

  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  }
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
