# 泡泡的 neovim 配置

> 其中大量参考了(~~照搬~~) [https://github.com/nshen/learn-neovim-lua](https://github.com/nshen/learn-neovim-lua)

> 配合 [Neovide](https://github.com/neovide/neovide) 使用更佳！

## 安装

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

# Debian/Ubuntupei zhi
sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get update
sudo apt install ripgrep

# Arch
yay -S ripgrep
```

```bash
# 方案二：从 https://github.com/BurntSushi/ripgrep/releases/ 下载
```

- 安装 `fd-find`

```bash
# 方案一：使用 npm

npm install -g fd-find

# Arch
yay -S fd
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

- `./lua/plugins.lua`

> 插件安装文件

<img src="https://img.skygard.cn/截屏2022-10-07 18.02.45.png" style="zoom: 30%"/>

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
>
> `require("lsp.config.common")` 作为默认的 LSP 配置

<img src="https://img.skygard.cn/截屏2022-10-07 16.00.38.png" style="zoom: 50%"/>

- `./lua/plugin-config/dashboard.lua`

> 启动页配置
>
> 配置启动页图标，Banner 和 Footer

## 快捷键

> Mac 上 Alt 使用 Option 键代替
>
> [leader] 默认配置的是 空格 键
>
> Ban 掉了方向键

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

#### 终端相关 (Normal 模式下)

- [leader]t  ——  水平打开终端
- [leader]vt  ——  垂直打开终端

#### 浏览代码 (Normal 模式下)

- Ctrl + <j,k>  ——  上下预览(5 行)
- Shift + [Left, Right]  ——  按单词左右跳转
- Shift + [Up, Down]  ——  快速翻页
- I  ——  行首插入
- A  ——  行尾插入

#### 代码块调整 (Visual 模式下)

- <  ——  缩进代码
- \>  ——  缩进代码
- J  ——  向下移动选择的块
- K  —— 向上移动选择的块

#### bufferline (Tab)相关 (Normal 模式下)

- Ctrl + <h,l>  ——  左右 Tab 切换
- Ctrl + w  ——  关闭当前 Tab
- [leader]bh  ——  关闭左侧 Tab
- [leader]bl  ——  关闭右侧 Tab
- [leader]bc  ——  选择关闭
- [leader]b  ——  选择 Tab (Telescope)

#### 搜索相关 (Normal 模式下)

- Ctrl + f   ——  全文搜索
- Ctrl + p  ——  文件搜索
- [leader]e  ——  搜索环境变量
- 打开搜索框之后
  - Ctrl + <u,d>  ——  上下代码预览
  - Ctrl + <j,k>  ——  插入模式下上下翻动
  - Ctrl + <n,p>  ——  历史记录

#### 补全相关 (Normal 模式下)

- Alt + .   ——  强制打开补全
- Alt + ,   ——  关闭补全
- Ctrl + j   ——  下一个补全
- Ctrl + k  ——  上一个补全

#### 代码跳转，调整相关 (Normal 模式下)

- [leader]rn  ——  匹配更换命名
- [leader]ca  ——  code actions
- gd  ——  跳转到定义处
- gh  ——  显示提示
- gD  ——  查看类型定义

- gi   ——  查看实现
- gr  ——  查看引用
- gp  ——  弹窗查看提示
- gj  ——  下一个提示
- gk  ——  上一个提示
- [leader]f  ——  格式化代码
- Ctrl + d  ——  复制一行
- Ctrl + x  ——  删除一行

