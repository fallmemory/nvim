local map = vim.keymap.set

-- remap:递归模式
-- noremap:非递归模式
-- silent:取消执行时命令行的信息提示，如 -- 插入--等
local opts = { noremap = true, silent = true } -- 定义为非递归，静默
local term_opts = { silent = true } -- 定义为静默    map("","<space>","<Nop>",opts)

map("n", "<Space>", "<Nop>", opts) -- 取消空格键在n模式下的作用
map("v", "<Space>", "<Nop>", opts) -- 取消空格键在v模式下的作用

map("n", "K", "<Nop>", opts) -- 取消大写K在n模式下的作用
map("v", "K", "<Nop>", opts) -- 取消大写K在v模式下的作用

map("n", "J", "<Nop>", opts) -- 取消大写J在n模式下的作用
map("v", "J", "<Nop>", opts) -- 取消大写J在v模式下的作用

map("n", "<S-K>", "<Nop>", opts) -- 取消J在n模式下的作用
map("v", "<S-K>", "<Nop>", opts) -- 取消J在v模式下的作用

vim.g.mapleader = " " -- 定义空格键为Leader键
vim.g.maplocalleader = " " -- 定义空格键为局部Leader键

-- 普通模式 --
--
-- 窗口切换
map("n", "<leader>w", "<C-w>w", { desc = "切换到下一窗口", noremap = true, silent = true }) -- 移动到下一个窗口
map("n", "<leader>h", "<C-w>h", { desc = "切换到左窗口", noremap = true, silent = true })
map("n", "<leader>j", "<C-w>j", { desc = "切换到下窗口", noremap = true, silent = true })
map("n", "<leader>k", "<C-w>k", { desc = "切换到上窗口", noremap = true, silent = true })
map("n", "<leader>l", "<C-w>l", { desc = "切换到右窗口", noremap = true, silent = true })

-- 调整窗口大小
map("n", "<C-up>", ":resize +2<cr>", { desc = "增加窗口高度", noremap = true, silent = true })
map("n", "<C-Down>", ":resize -2<cr>", { desc = "减少窗口高度", noremap = true, silent = true })
map("n", "<C-Left>", ":vertical resize -2<cr>", { desc = "减少窗口宽度", noremap = true, silent = true })
map("n", "<C-Right>", ":vertical resize +2<cr>", { desc = "增加窗口宽度", noremap = true, silent = true })

-- 无修改情况下快速退出
map("n", "<leader>qqq", ":q<cr>", { desc = "无修改状态下快速退出nvim", noremap = true, silent = true })

-- 切换缓冲区
map("n", "<S-l>", ":BufferLineCycleNext<cr>", { desc = "下一个buffer", noremap = true, silent = true }) -- 下一个缓冲区
map("n", "<S-h>", ":BufferLineCyclePrev<cr>", { desc = "上一个buffer", noremap = true, silent = true }) -- 上一个缓冲区
map("n", "<leader><tab>", ":bnext<cr>", { desc = "下一个buffer", noremap = true, silent = true }) -- 下一个缓冲区
map("n", "<leader>b", ":BufferLinePick<cr>", { desc = "选择buffer", noremap = true, silent = true }) -- 下一个缓冲区

-- 关闭缓冲区
map("n", "<S-c>", ":bd<cr>:bnext<cr>", { desc = "关闭buffer", noremap = true, silent = true }) -- 关闭缓冲区

-- 分割窗口
map("n", "<leader>ss", ":split<cr><C-w>w", { desc = "水平分割窗口", noremap = true, silent = true }) -- 水平分割
map("n", "<leader>sv", ":vsplit<cr><C-w>w", { desc = "垂直分割窗口", noremap = true, silent = true }) -- 垂直分割

-- 修改x删除不保留数据
map("n", "x", '"_x', opts) -- x将会把数据丢进无名寄存器（"_）中，按p不会粘贴出来

-- 修改cw删除不保留数据
map("n", "cw", '"_cw', opts) -- x将会把数据丢进无名寄存器（"_）中，按p不会粘贴出来

-- 修改dw删除单词为后向前删除并进入无名寄存器
map("n", "dw", 'vb"_d', opts)

-- 数字自增/自减
map("n", "+", "<C-a>", { desc = "自增", noremap = true, silent = true })
map("n", "-", "<C-x>", { desc = "自减", noremap = true, silent = true })

-- 全选 --
map("n", "<C-a>", "gg<S-v>G", { desc = "内容全选", noremap = true, silent = true }) -- <S-v>可视模式光标在行首就可以选择整行,只是v的话则不行

-- 在普通模式下快速移动光标在行头、行尾
map("n", "<C-h>", "<home>", { desc = "光标移动到行首", noremap = true, silent = true })
map("n", "<C-l>", "<end>", { desc = "关闭移动到行尾", noremap = true, silent = true })

-- 在普通模式下o键插入行后不切换成插入模式
map("n", "o", "o<ESC>", opts)

-- 取消搜索高亮
map("n", "<leader>nl", ":nohl<cr>", { desc = "取消搜索高亮", noremap = true, silent = true })

-- 插入模式 --
map("i", "jk", "<ESC>", { desc = "jk插入模式", noremap = true, silent = true }) -- 在插入模式下使用jk切换到普通模式

-- 在插入模式下快速移动光标在行头、行尾
map("i", "<C-h>", "<home>", { desc = "光标移动到行首", noremap = true, silent = true })
map("i", "<C-l>", "<end>", { desc = "关闭移动到行尾", noremap = true, silent = true })

-- 按u撤回时，撤回到,.;的位置
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- 可视模式 --
--
-- 可视模式下缩进后依然是可视模式 --
map("v", "<", "<gv", { desc = "缩进", noremap = true, silent = true })
map("v", ">", ">gv", { desc = "前进", noremap = true, silent = true })

-- 可视模式下整块上下移动 --
map("v", "<A-j>", ":m '>+1<CR>gv", { desc = "代码块上移", noremap = true, silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv", { desc = "代码块下移", noremap = true, silent = true })

-- 可视模式下粘贴内容不会复制被替换的内容 --
map("v", "p", '"_dp', opts)

-- 修改可以模式下x删除不保留数据
map("v", "x", '"_x', opts) -- x将会把数据丢进无名寄存器（"_）中，按p不会粘贴出来

-- 在可视模式下快速移动光标在行头、行尾
map("v", "<C-h>", "<home>", { desc = "光标移动到行首", noremap = true, silent = true })
map("v", "<C-l>", "<end>", { desc = "关闭移动到行尾", noremap = true, silent = true })

-- 折叠 --
map("n", "zc", ":foldclose<CR>", { desc = "折叠", noremap = true, silent = true })
map("n", "zo", ":foldopen<CR>", { desc = "展开", noremap = true, silent = true })

-- treesitter增量选择desc标记 --
map("n", "<CR>", "<CR>", { desc = "增量选择", noremap = true, silent = true })
map("n", "<BS>", "<BS>", { desc = "递减选择", noremap = true, silent = true })
