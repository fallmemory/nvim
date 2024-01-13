return {
	"folke/todo-comments.nvim",
	dependencies = { "plenary.nvim" },
	keys = {
		{ "T", "<cmd>TodoTelescope<cr>", { desc = "(todo)列表" }, mode = "n" },
	},
	opts = {},
	config = function()
		local icons = require("utils").get_icons("todo_icons")
		require("todo-comments").setup({
			keywords = {
				FIX = {
					icon = icons.FIX, -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = { icon = icons.TODO, color = "info" },
				HACK = { icon = icons.HACK, color = "warning" },
				WARN = { icon = icons.WARN, color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = icons.PERF, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				-- NOTE = { icon = icons.NOTE, color = "hint", alt = { "INFO" } },
				NOTE = { icon = icons.NOTE, color = "info", alt = { "INFO" } },
				TEST = { icon = icons.TEST, color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
		})
	end,
}
