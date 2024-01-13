return {
	-- 载入之前的文件
	"folke/persistence.nvim",
	keys = {
		{ "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], desc = "载入之前的编辑" },
		{ "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], desc = "载入最后的编辑" },
		{ "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], desc = "不保存当前编辑记录" },
	},
	config = function()
		require("persistence").setup()
	end,
}
