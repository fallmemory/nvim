return {
	-- 代码检查工具
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	opts = {
		linters = require("lang_config.config").get_config("linters"),
	},
	config = function(_, opts)
		local lint = require("lint")
		-- 获取依据文件类型启用linters的列表
		lint.linters_by_ft = require("lang_config.config").get_config("lint_by_ft")
		-- 获取在opts.linters里的自定义内容
		for name, linter in pairs(opts.linters) do
			if type(linter) == "table" and type(lint.linters[name]) == "table" then
				lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
			else
				lint.linters[name] = linter
			end
		end
		-- 自动启动
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
		-- 手动启动
		vim.keymap.set("n", "<leader>v", function()
			lint.try_lint()
		end, { desc = "lint-check" })
	end,
}
