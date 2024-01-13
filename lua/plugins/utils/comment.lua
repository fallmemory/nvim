return {
	-- 注释插件
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		keys = {
			{ "gc", desc = "添加注释符", mode = { "x", "n" } },
		},
	},

	{
		"echasnovski/mini.comment",
		keys = {
			{ "gc", desc = "添加注释符", mode = { "x", "n" } },
		},
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
	},
}
