return {
	-- git差异对比
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>v", "<cmd>DiffviewOpen<cr>", desc = "打开当前文件的修改记录比较" },
		{ "<leader>u", "<cmd>DiffviewClose<cr>", desc = "关闭修改记录比较" },
		{ "<leader>V", "<cmd>DiffviewFileHistory<cr>", desc = "打开git-commite所有文件历史记录" },
	},
}
