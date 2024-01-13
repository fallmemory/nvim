return {
	-- 底下的栏
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-web-devicons" },
	config = function()
		local utils = require("utils")
		local diagnostics_icons = utils.get_icons("diagnostics")
		local icons = utils.get_icons("lualine_icons")
		local git_icons = utils.get_icons("git_status")
		require("lualine").setup({
			options = {
				component_separators = { left = "|", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
				globalstatus = true,
			},
			sections = {
				lualine_a = { { "mode", icon = icons.mode } },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"diff",
						symbols = {
							added = git_icons.added,
							modified = git_icons.modified,
							removed = git_icons.removed,
						},
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
					},
					{
						"diagnostics",
						symbols = {
							error = diagnostics_icons.Error,
							warn = diagnostics_icons.Warn,
							info = diagnostics_icons.Info,
							hint = diagnostics_icons.Hint,
						},
					},
					{
						"filename",
						symbols = {
							modified = icons.modified,
							readonly = icons.readonly,
							unnamed = "[No Name]",
							newfile = "[New]",
						},
					},
					{ "searchcount" },
				},
				lualine_x = {
					{ "selectioncount" },
				},
				lualine_y = {
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
					{ "filesize" },
				},
				lualine_z = {
					{ "progress" },
					{ "location" },
				},
			},
			extensions = { "nvim-dap-ui", "lazy", "mason", "quickfix" },
		})
	end,
}
