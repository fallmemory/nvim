return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "Macchiato", -- latte, frappe, macchiato, mocha
		})
		require("catppuccin").load()
	end,
}
