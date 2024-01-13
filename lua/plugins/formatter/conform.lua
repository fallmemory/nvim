return {
	-- 格式化工具
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>f",
			'<cmd>lua require("conform").format({'
				-- async是否异步
				.. "async=true,"
				-- 是否在无可用格式化时调用lsp格式化
				.. "lsp_fallback=true,"
				.. "})<cr>",
			{ desc = "(Conform)格式化" },
			mode = "n",
		},
	},
	config = function()
		require("plugins.formatter.conform_keymaps").formatterMap()
		require("conform").setup({
			-- 格式化工具映射到文件类型
			formatters_by_ft = require("lang_config.config").get_config("formatter_by_ft"),
		})
	end,
}
