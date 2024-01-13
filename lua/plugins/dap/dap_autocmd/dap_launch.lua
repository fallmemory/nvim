-- 根据文件类型启用dap
-- 在config.autocmds处调用了
local path = "lang_config.language."
local alltype = require("lang_config.enable_list")
local type = ""
return {
	vim.api.nvim_create_autocmd("FileType", {
		pattern = alltype,
		callback = function()
			type = vim.bo.filetype
			require(path .. type .. ".dap_config")
		end,
	}),
}
