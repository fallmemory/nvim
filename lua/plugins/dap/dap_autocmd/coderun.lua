-- 编译快捷键
-- 在config.autocmds处调用了
local coderun = vim.api.nvim_create_augroup("quickrun", { clear = true })
local coderun_list = require("lang_config.config").get_config("coderun")
local type = ""
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
return {
	-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	vim.api.nvim_create_autocmd({ "BufEnter" }, {
		group = coderun,
		callback = function()
			type = vim.bo.filetype

			if coderun_list[type] ~= nil then
				map("n", "<F2>", coderun_list[type], opt)
			else
				map("n", "<F2>", "<Nop>", opt)
			end
		end,
	}),
}
