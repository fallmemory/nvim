return {
	--  LSP 进度信息
	"j-hui/fidget.nvim",
	config = function()
		require("fidget").setup({
			progress = {
				ignore = { "null-ls" },
			},
			notification = {
				window = {
					winblend = 0,
				},
			},
		})
	end,
}
