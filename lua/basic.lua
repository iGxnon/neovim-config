local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 防止包裹折行
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"

-- utf8
opt.encoding = "UTF-8"
opt.fileencoding = "utf-8"

-- jkhl 移动时光标周围保留8行
opt.scrolloff = 8
opt.sidescrolloff = 8

-- 不可见字符用·代替
opt.list = true
opt.listchars = "space:·"

-- 长度参考线
opt.colorcolumn = "80"

-- 当文件被外部程序修改时，自动加载
opt.autoread = true
