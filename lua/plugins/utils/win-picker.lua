return {
	-- 窗口选择
	"s1n7ax/nvim-window-picker",
	name = "window-picker",
	keys = {
		{
			"<leader>w",
			function()
				if require("window-picker").pick_window() then
					vim.api.nvim_set_current_win(require("window-picker").pick_window())
				end
			end,
			desc = "选择窗口",
		},
	},
	config = function()
		require("window-picker").setup({
			filter_rules = {
				include_current_win = true,
				bo = {
					filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },
					buftype = { "terminal" },
				},
			},
		})
	end,
}
