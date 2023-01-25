# 泡泡的 neovim 配置

> 为 `rust` 与 `go` 开发进行专门配置
>
> 支持语法提示，格式化，`debug` 等，支持 `buf` 的 `linter`

> 参考 [https://github.com/nshen/learn-neovim-lua](https://github.com/nshen/learn-neovim-lua)

> 配合 [Neovide](https://github.com/neovide/neovide) 使用更佳！

## 动机

编写 rust 的集成开发环境种类丰富， `Intellij IDEA`，`CLion`，`VSCode` 等，它们都有一个特点

**占用内存太大！**

16G内存的Mac，写 `rust` 时只需要多开一个`Docker Desktop`，就会变得捉襟见肘。如果挂了一个 Parallels Desktop，那内存分分钟就会爆红

在使用 IDEA 和 CLion 时，它们都会随着项目打开慢慢变得卡顿，内存占用也会慢慢变高 (最后大概在 `5-6G` 左右)

所以我将目光投向了 nvim

## 安装

1. 安装 `neovim`，使用到的版本为 `0.8.2`，不要低于 `0.7`
2. 将仓库 clone 到 `~/.config/nvim` 下，`windows` 系统在 `~/.AppData/local/nvim` 
   - 保证 `init.lua` 处在 `~/.config/nvim/init.lua` 的正确路径下

### 常见问题：

1. Packer/Treesitter 下载失败

   - 通常是网络问题，可以考虑给 git 挂个代理

2. 使用某个功能时提示某些可执行文件缺失

   - 尝试使用 `:Mason` ，安装缺失的可执行文件

   - 尝试使用系统中的包管理器安装缺失的可执行文件

     - 例如 `Telescope` 中使用了 `fd`, `ripgrep`，可以使用`brew`安装

   - 尝试在 github 上搜对应的仓库，根据提示安装可执行文件

   - 目前使用到的`Mason`依赖如下，有的会自动安装

     ![image-20230125110949031](https://img.skygard.cn/image-20230125110949031.png)

## 配置文件

> 这里列出了可能需要配置的部分

- `./lua/plugins.lua`

> 插件安装文件

<img src="https://img.skygard.cn/截屏2022-10-07 18.02.45.png" style="zoom: 30%"/>

- `./lua/keymaps.lua`

> 快捷键映射文件

-  `./lua/colorscheme.lua`

> 主题文件
>
> 配置第一行的主题名称即可

- `./lua/plugins/null-ls.lua`

> `null-ls` 配置
>
> 可以添加一些额外的`formatter`, `code_action` 等

- `./lua/plugins/treesitter.lua`

> 配置不同语言的高亮、缩进、增量选择、折叠

<img src="https://img.skygard.cn/截屏2022-10-07 15.52.00.png" style="zoom: 50%"/>

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

- Shift + <h,j,k,l>  ——  窗口间上下左右切换

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

- Ctrl + j   ——  下一个补全
- Ctrl + k  ——  上一个补全

#### 代码跳转，调整相关 (Normal 模式下)

- [leader]rn  ——  匹配更换命名
- [leader]a  ——  code actions
- gd  ——  跳转到定义处
- gh  ——  显示提示
  - [leader]ha  ——  `rust-tools` 中的 hover action

- gD  ——  查看类型定义
- gi   ——  查看实现
- gr  ——  查看引用
- gp  ——  弹窗查看提示
- gj  ——  下一个提示
- gk  ——  上一个提示
- [leader]f  ——  格式化代码
- zc  ——  折叠
- zo  ——  打开折叠

#### Debug 相关

- [leader]dt  —— 打断点
- [leader]dT ——  清理所有断点
- [leader]dc  ——  启动 debugger ｜debug continue
  - 编写 rust 时推荐使用 `:RustDebuggables` 来启动 `debugger`
- [leader]dj  ——  step over
- [leader]dk  ——  step out
- [leader]dh  ——  debug hover
- [leader]dl  ——  step into
- [leader]dw  ——  退出 debug

#### 文件树相关

- 查看 https://github.com/nvim-tree/nvim-tree.lua

# 图图

<img src="https://img.skygard.cn/20221010135257.png" style="zoom:20%"/>

<img src="https://img.skygard.cn/20221010135949.png" style="zoom: 20%"/>

<img src="https://img.skygard.cn/20221010140639.png" style="zoom: 20%"/>

<img src="https://img.skygard.cn/20221010140944.png" style="zoom: 40%"/>

![截屏2023-01-25 11.38.00](https://img.skygard.cn/%E6%88%AA%E5%B1%8F2023-01-25%2011.38.00.png)
