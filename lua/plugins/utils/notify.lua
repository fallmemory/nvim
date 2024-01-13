return {
	-- 通知管理器
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		vim.notify = require("notify")
		require("notify").setup({
			render = "compact",
			timeout = 2000,
			background_colour = "#000000",
		})
	end,
}
