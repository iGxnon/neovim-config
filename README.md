# 泡泡的 neovim 配置

> 其中大量参考了(~~照搬~~) [https://github.com/nshen/learn-neovim-lua](https://github.com/nshen/learn-neovim-lua)

## 安装

> 以 `apt-get` 包管理器为例

> 将仓库拷贝到 `~/.config/nvim/` 下，配置完毕后在随便打开一个文件输入  `:PackerSync` 同步依赖

### 安装插件管理器 `Packer`

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### 安装 `telescope` 的依赖

- 安装 `repgrep`

```bash
# 方案一：apt-get

sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get update
sudo apt install ripgrep
```

```bash
# 方案二：从 https://github.com/BurntSushi/ripgrep/releases/ 下载
```

- 安装 `fd-find`

```bash
# 方案一：使用 npm

npm install -g fd-find
```

```bash
# 方案二：从 https://github.com/sharkdp/fd/releases/ 中下载
```

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
    │   ├── config								不同语言LSP配置文件夹
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

## 配置文件

> 这里列出了可能需要配置的部分

- `./lua/keybindings.lua`

> 快捷键映射文件

-  `./lua/colorscheme.lua`

> 主题文件
>
> 配置第一行的主题名称即可

- `./lua/plugin-config/nvim-treesitter.lua`

> 配置不同语言的高亮、缩进、增量选择、折叠

<img src="https://img.skygard.cn/截屏2022-10-07 15.52.00.png" style="zoom: 50%"/>

- `./lua/lsp/setup.lua`

> 配置语言服务器协议及其初始化文件

<img src="https://img.skygard.cn/截屏2022-10-07 16.00.38.png" style="zoom: 50%"/>

- `./lua/plugin-config/dashboard.lua`

> 启动页配置
>
> 配置启动页图标，Banner 和 Footer



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
