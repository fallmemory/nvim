return {
	-- 主题
	require("config.colorscheme.onedark"),
	--------------------UI-----------------------
	-- 启动界面
	require("plugins.ui.alpha"),
	--  上方显示目录栏
	require("plugins.ui.barbecue"),
	-- buffer栏
	require("plugins.ui.bufferline"),
	-- git侧边状态栏
	require("plugins.ui.gitsigns"),
	-- 缩进线
	require("plugins.ui.blankline"),
	-- lualine
	require("plugins.ui.lualine"),
	-- -- 常见动作动画处理
	-- require("plugins.ui.mini-animate"),
	-- 透明主题
	require("plugins.ui.transparent"),
	--------------------utils-----------------------
	-- 模糊搜索器
	require("plugins.utils.telescope"),
	-- jk加速
	require("plugins.utils.jk"),
	-- 自动补全括号
	require("plugins.utils.autopairs"),
	-- 载入之前的文件
	require("plugins.utils.persistence"),
	-- 按键提醒
	require("plugins.utils.which-key"),
	-- 载入文档会光标在关闭前的位置
	require("plugins.utils.lastplace"),
	-- 快速跳转
	require("plugins.utils.flash"),
	-- 通知管理器
	require("plugins.utils.notify"),
	-- 命令行窗口
	require("plugins.utils.noice"),
	-- 高亮相同内容
	require("plugins.utils.illuminate"),
	-- 搜索替换
	require("plugins.utils.spectre"),
	-- 文件树
	require("plugins.utils.neotree"),
	-- TODO高亮
	require("plugins.utils.todo"),
	-- 窗口选择
	require("plugins.utils.win-picker"),
	-- 对比git文件差异
	require("plugins.utils.diffview"),
	-- 诊断列表
	require("plugins.utils.trouble"),
	-- 内置终端
	require("plugins.utils.toggleterm"),
	-- 术语树解析
	require("plugins.utils.treesitter"),
	-- 快速注释
	require("plugins.utils.comment"),
	--------------------coding-----------------------
	-- mason服务器管理器
	require("plugins.coding.mason"),
	-- lsp
	require("plugins.coding.lspconfig"),
	-- cmp
	require("plugins.coding.cmp"),
	--------------------formatter-----------------------
	-- 格式化工具
	require("plugins.formatter.conform"),
	--------------------linter-----------------------
	-- 代码检查工具
	require("plugins.linter.lint"),
	--------------------dap-----------------------
	-- 调试工具
	require("plugins.dap.dap"),
	--------------------nvim-dap-lang-----------------------
	require("plugins.dap.nvim-dap-lang.python"),
	-- require("plugins.dap.nvim-dap-lang.go"),
}
