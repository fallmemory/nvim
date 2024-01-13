return {
	-- 诊断列表
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>t",
			'<cmd>lua require("trouble").toggle("document_diagnostics")<cr>',
			{ desc = "(Trouble)切换诊断列表" },
			mode = "n",
		},
	},
	config = function()
		local icons = require("utils").get_icons("diagnostics")
		require("trouble").setup({
			action_keys = {
				close = "q",
				cancel = "<esc>",
				refresh = "r",
				jump = "<cr>",
				open_split = {},
				open_vsplit = {},
				open_tab = {},
				jump_close = {},
				toggle_mode = {},
				switch_severity = {},
				toggle_preview = {},
				hover = {},
				preview = {},
				open_code_href = {},
				close_folds = {},
				open_folds = {},
				toggle_fold = {},
				previous = "k",
				next = "j",
				help = "?",
			},
			signs = {
				error = icons.Error,
				warning = icons.Warn,
				hint = icons.Hint,
				information = icons.Info,
				other = require("utils").get_icons("dap_icons").BreakpointCondition,
			},
			use_diagnostic_signs = false,
		})
	end,
}
