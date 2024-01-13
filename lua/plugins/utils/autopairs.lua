return {
	-- 自动补充括号
	"windwp/nvim-autopairs",
	event = "VeryLazy",
	config = function()
		require("nvim-autopairs").setup()
	end,
}
