return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	-- cmd = "Neotree",
	dependencies = {
		"plenary.nvim",
		"nvim-web-devicons",
		{ "nui.nvim", event = "VeryLazy" },
	},
	keys = {
		{ "<leader>m", "<cmd>Neotree toggle<cr>", desc = "(Ntree)文件树" },
		{
			"<leader>n",
			function()
				local p = vim.fn.expand("%:p")
				if vim.fn.filereadable(p) == 1 then
					vim.cmd("Neotree action=focus source=filesystem position=left reveal_file=" .. p)
				end
			end,
			desc = "(Ntree)文件树跳转到当前编辑目录",
		},
	},
	config = function()
		local utils = require("utils")
		for name, icon in pairs(utils.get_icons("diagnostics")) do
			name = "DiagnosticSign" .. name
			vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
		end
		require("neo-tree").setup({
			default_component_configs = {
				icon = vim.tbl_deep_extend("force", utils.get_icons("tree_icon"), { highlight = "NeoTreeFileIcon" }),
				modified = vim.tbl_deep_extend(
					"force",
					utils.get_icons("tree_modified"),
					{ highlight = "NeoTreeModified" }
				),
				git_status = {
					symbols = utils.get_icons("git_status"),
				},
			},
		})
	end,
}
