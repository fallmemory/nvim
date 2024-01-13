return {
	-- 语法树解析
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = "VeryLazy",
		init = function(plugin)
			-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
			-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
			-- no longer trigger the **nvim-treeitter** module to be loaded in time.
			-- Luckily, the only thins that those plugins need are the custom queries, which we make available
			-- during startup.
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
			},
		},
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		keys = {
			{ "<cr>", desc = "增量选择" },
			{ "<bs>", desc = "减少选择", mode = "x" },
		},
		---@type TSConfig
		---@diagnostic disable-next-line: missing-fields
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = require("lang_config.config").get_config("treesitter"),
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<cr>",
					node_incremental = "<cr>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				-- 光标移动
				move = {
					enable = true,
					goto_next_start = {
						["]f"] = { query = "@function.outer", desc = "下一个函数开头" },
						["]c"] = { query = "@class.outer", desc = "下一个类开头" },
					},
					goto_next_end = {
						["]]f"] = { query = "@function.outer", desc = "下一个函数结尾" },
						["]]c"] = { query = "@class.outer", desc = "下一个函数结尾" },
					},
					goto_previous_start = {
						["[f"] = { query = "@function.outer", desc = "上一个函数开头" },
						["[c"] = { query = "@class.outer", desc = "上一个类开头" },
					},
					goto_previous_end = {
						["[[f"] = { query = "@function.outer", desc = "上一个函数结尾" },
						["[[c"] = { query = "@class.outer", desc = "上一个函数结尾" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = { query = "@parameter.inner", desc = "与后方参数交换位置" },
					},
					swap_previous = {
						["<leader>A"] = { query = "@parameter.inner", desc = "与前方参数交换位置" },
					},
				},
			},
		},
		---@param opts TSConfig
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
