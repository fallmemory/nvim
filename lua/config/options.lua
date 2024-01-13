-- 变量 --
vim.opt.expandtab = true -- 将制表符转化成空格
local opt = vim.opt
-- 文件编码 --
opt.encoding = "utf-8"             -- vim工作编码
opt.fileencoding = "utf-8"         -- vim文件编码
opt.fileencodings = "utf-8"        -- vim读取文件时探测的编码
----------------------------------------
-- opt.autochdir = true               -- 自动跳转文件目录
opt.backup = false                 -- 关闭退出备份
opt.swapfile = false               -- 禁止创建交换文件
opt.autoread = true                -- 当vim以外的程序修改了文件时候，vim自动重读文件
opt.updatetime = 300               -- 当无操作时，交换文件刷新时间
opt.timeoutlen = 1000              -- 等待一个组合键完成的时间
opt.writebackup = false            -- 禁止编辑正在被其他应用写入的文件
opt.clipboard = "unnamedplus"      -- 开启系统剪贴板
opt.mouse = "a"                    -- 开启vim鼠标模式
opt.ruler = true                   -- 右下角显示光标位置
opt.showcmd = true                 -- 右下角显示控制命令
opt.showmode = false               -- 右下角显示控制命令
opt.cmdheight = 2                  -- 底部栏高度
opt.relativenumber = true          -- 显示相对行号
opt.number = true                  -- 显示行号
opt.numberwidth = 2                -- 行号宽度
opt.signcolumn = "yes"             -- 显示左侧图标栏
opt.wrap = false                   -- 关闭自动换行
opt.scrolloff = 8                  -- 上下移动光标保留8行
opt.sidescrolloff = 8              -- 左右移动光标保留8列
-- 缩进 --
opt.expandtab = true               -- 将制表符转化成空格
opt.autoindent = true              -- 根据上一行决定新行缩进
opt.cindent = true                 -- C文件自动缩进
opt.smartindent = true             -- 智能缩进
opt.shiftwidth = 2                 -- 缩进空格数
opt.tabstop = 2                    -- tab空格数
opt.ignorecase = true              -- 搜索忽略大小写
opt.smartcase = true               -- 搜索智能大小写
opt.guifont = "FiraCode Nerd Font" -- vim gui字体
--opt.undofile = true                     -- 把撤销记录保留到一个文件，可以持久性撤销
--opt.undodir = vim.fn.expand("~/.config/nvim/.temp/undo") -- linux撤销记录保存路径
--opt.undodir = vim.fn.expand("C:/Users/mio/AppData/Local/nvim-data/undofile") -- windows撤销记录保存路径
opt.whichwrap = "b,s,<,>,[,],h,l"                  -- 允许指定按键越界
opt.showtabline = 2                                -- 显示标签页
opt.splitbelow = true                              -- 强制水平分割在下方
opt.splitright = true                              -- 强制垂直分割在右方
vim.cmd([[set iskeyword+=-]])                      -- 把连字符‘-’连接的单词看作一个单词
opt.wildmenu = true                                -- 命令行自动补全
opt.completeopt = "menu,menuone,noselect,noinsert" -- tab选择补全
opt.pumheight = 10                                 -- 弹出菜单的高度
--opt.spell = true                        -- 拼写检查
--opt.spelllang = {"en_us"}               -- 拼写检查字典
vim.opt.shortmess:append("c") -- 不要给|ins-completion-menu|信息
opt.exrc = true               --允许载入局部配置文件

-- 高亮 --
opt.cursorline = true    -- 所在行下划线(加上termguicolors为高亮显示)
opt.termguicolors = true -- 设置term gui颜色	
opt.hlsearch = true      -- 搜索高亮
opt.incsearch = true     -- 搜索输入时高亮搜索

-- 禁用内置文件管理器（netrwi) --
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
