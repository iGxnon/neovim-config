# 泡泡的 neovim 配置

> 其中大量参考了 [https://github.com/nshen/learn-neovim-lua](https://github.com/nshen/learn-neovim-lua)

## 文件目录

```text
.
├── README.md
├── init.lua											入口文件
└── lua														配置文件夹
    ├── basic.lua									基础配置文件
    ├── colorscheme.lua						主题配置文件
    ├── keybindings.lua						快捷键绑定配置文件
    ├── lsp												语言服务协议(补全，提示)文件夹
    │   ├── cmp.lua								补全配置文件
    │   ├── config								不同语言LSP配置文件
    │   └── setup.lua							LSP初始化文件
    ├── plugin-config							插件配置文件
    │   ├── bufferline.lua				bufferline(tap)配置文件
    │   ├── dashboard.lua					开始窗口配置文件
    │   ├── lualine.lua						底部窗口配置文件
    │   ├── nvim-tree.lua					文件树配置文件
    │   ├── nvim-treesitter.lua		文件树拓展
    │   └── project.lua						项目页面配置文件
    └── plugins.lua								插件配置文件
```

## 快捷键

> Mac 上 Alt 使用 Option 键代替
>
> <`leader> 默认配置的是 空格 键

#### 分屏相关 (Normal 模式下)

- sv  ——  垂直分屏
- sc  ——  关闭屏
- sh  ——  水平分屏
- so  ——  关闭其他分屏

- Alt + <h,j,k,l>  ——  窗口间上下左右切换

- s,   ——  左右比例控制
- s.   ——  左右比例控制
- sj   ——  上下比例控制
- sk  ——  上下比例控制
- s=  ——  等比例

#### 终端相关

- <`leader>t  ——  水平打开终端
- <`leader>vt  ——  垂直打开终端
