return {
	-- buffer栏
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	version = "*",
	dependencies = { "nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				-- bufferline显示序列号
				-- numbers = function(opts)
				-- 	return string.format("%s.", opts.ordinal)
				-- end,
				separator_style = { "thin" },
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
					{ filetype = "aerial", text = "Outline", text_align = "center", saperator = true },
				},
			},
		})
	end,
}
