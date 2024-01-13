return {
	-- 模糊搜索器
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	cmd = "Telescope", -- 当输入Telescope时插件才加载
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = { --  lazy设置keymap的方式，优点是触发按键才加载
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "(Tc)文件名查找文件" }, --  按文件名查找
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "(Tc)文件内容查找文件" }, -- 按文件内容查找，需要安装pacman -S ripgrep
		{ "<leader>fr", "<cmd>Telescope resume<cr>", desc = "(Tc)上一次查找结果" }, -- 按结果查找
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "(Tc)列出所有buffer" }, -- 列出所有buffers
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "(Tc)查找帮助文档" }, -- 查找帮助文档
		{ "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "(Tc)按光标当前内容查找" }, -- 按当光标所在单词查找
		{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "(Tc)列出最近打开过的文件" }, -- 列出最近打开过的文件
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "(Tc)列出keymaps" }, -- 列出最近打开过的文件
	},
	config = function()
		require("telescope").load_extension("fzf")
	end,
}
