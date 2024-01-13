-- 编译快捷键
-- 在config.autocmds处调用了
local compile = vim.api.nvim_create_augroup("quickcompile", { clear = true })
local allcompile_list = require("lang_config.config").get_config("compile")
local type = ""
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
return {
	-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	vim.api.nvim_create_autocmd({ "BufEnter" }, {
		group = compile,
		callback = function()
			type = vim.bo.filetype

			if allcompile_list[type] ~= nil then
				map("n", "<F1>", allcompile_list[type], opt)
			else
				map("n", "<F1>", "<Nop>", opt)
			end
		end,
	}),
}
