return {
	-- mason服务器管理器
	"williamboman/mason.nvim",
	-- cmd = "Mason",
	build = ":MasonUpdate",
	dependencies = {},
	config = function()
		require("mason").setup({
			ui = {
				icons = require("utils").get_icons("mason_icons"),
			},
		})
		require("utils").install_fmtlint()
	end,
}
