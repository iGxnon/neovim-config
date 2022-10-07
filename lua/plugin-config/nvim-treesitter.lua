local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  vim.notify("没有找到 nvim-treesitter")
  return
end

treesitter.setup({
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {
    "json",
    "html",
    "css",
    "vim",
    "lua",
    "javascript",
    "typescript",
    "tsx",
    "rust",
    "go",
    "java",
    "python",
    "fish",
  },
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
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
})

-- 开启 Folding 模块，可以折叠代码块
-- zc 折叠  zo 打开
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
