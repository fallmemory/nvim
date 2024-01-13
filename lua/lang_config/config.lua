local langlist = require("lang_config.enable_list")
local M = {}
-------------------------------------------------------------------------
-- 合并有设置键值的表
local extend_Tbl = function(tablename)
	local list = {}
	for _, langname in pairs(langlist) do
		list = vim.tbl_extend(
			"force",
			list,
			require("lang_config.language." .. langname .. ".language_config").GET(tablename)
		)
	end
	return list
end

-- 合并只有值的表
local extend_Ovalue = function(tablename)
	local list = {}
	for _, langname in pairs(langlist) do
		list = vim.list_extend(list, require("lang_config.language." .. langname .. ".language_config").GET(tablename))
	end
	return list
end
-------------------------------------------------------------------------
-- 调用函数合并表
local treesitter = vim.list_extend({
	"luadoc",
	"markdown",
	"markdown_inline",
	"query",
	"vim",
	"vimdoc",
}, langlist)
local lspinstall = extend_Ovalue("lspinstall")
local lspserver = extend_Ovalue("lspserver")
local lspconfig = extend_Tbl("lspconfig")
local lintinstall = extend_Ovalue("lintinstall")
local lint_by_ft = extend_Tbl("lint_by_ft")
local linters = extend_Tbl("linters")
local formatterinstall = extend_Ovalue("formatterinstall")
local formatter_by_ft = extend_Tbl("formatter_by_ft")
local dapinstall = extend_Ovalue("dapinstall")
local compile = extend_Tbl("compile")
local coderun = extend_Tbl("coderun")
local formatter_lint_list = vim.list_extend(extend_Ovalue("formatterinstall"), lintinstall)
----------------------------------------------------------------------------
M.get_config = function(name)
	if name == "treesitter" then
		return treesitter
	elseif name == "lspinstall" then
		return lspinstall
	elseif name == "lspserver" then
		return lspserver
	elseif name == "lspconfig" then
		return lspconfig
	elseif name == "lintinstall" then
		return lintinstall
	elseif name == "lint_by_ft" then
		return lint_by_ft
	elseif name == "linters" then
		return linters
	elseif name == "formatterinstall" then
		return formatterinstall
	elseif name == "formatter_by_ft" then
		return formatter_by_ft
	elseif name == "dapinstall" then
		return dapinstall
	elseif name == "compile" then
		return compile
	elseif name == "coderun" then
		return coderun
	elseif name == "formatter_lint_list" then
		return formatter_lint_list
	end
end
return M
