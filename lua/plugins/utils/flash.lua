return {
	-- 快速跳转
	"folke/flash.nvim",
	opts = {},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "(flash)快速跳转",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "(flash)根据Treesitter选择",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "(flash)Remote Flash",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "(flash)Treesitter Search",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "(flash)Toggle Flash Search",
		},
	},
}
