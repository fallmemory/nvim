local langlist = require("lang_config.enable_list")
local M = {}
-------------------------------------------------------------------------
-- 合并有设置键值且键值均不相同的表
local extend_Tbl = function(tablename)
	local list = {}
	for _, langname in pairs(langlist) do
		-- list = vim.tbl_extend(
		list = vim.tbl_deep_extend(
			"force",
			list,
			require("lang_config.language." .. langname .. ".language_config").GET(tablename)
		)
	end
	return list
end

-- 列表去重函数
local delete_Equal_Element = function(tablename)
	if next(tablename) ~= nil then
		local temp = {}
		local re_table = {}
		-- 利用键不可相同把相同的元素覆盖掉
		for _, v in pairs(tablename) do
			temp[v] = true
		end
		-- 把键转回值
		for k, _ in pairs(temp) do
			table.insert(re_table, k)
		end
		return re_table
	else
		return tablename
	end
end

-- 合并只有值的表
local extend_Ovalue = function(tablename)
	local list = {}
	for _, langname in pairs(langlist) do
		list = vim.list_extend(list, require("lang_config.language." .. langname .. ".language_config").GET(tablename))
	end
	list = delete_Equal_Element(list)
	return list
end
-------------------------------------------------------------------------
local extend_Nullsetup = function()
	local nullsetup = {
		code_actions = {},
		completion = {},
		diagnostics = {},
		formatting = {},
		hover = {},
		_test = {},
	}
	for nullsetup_key, value in pairs(nullsetup) do
		for _, langname in pairs(langlist) do
			value = vim.list_extend(
				value,
				require("lang_config.language." .. langname .. ".language_config").GET("nullsetup")[nullsetup_key]
			)
		end
		nullsetup[nullsetup_key] = delete_Equal_Element(value)
	end
	return nullsetup
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
local nonelsinstall = extend_Ovalue("nonelsinstall")
local nullsetup = extend_Nullsetup()
local formatterinstall = extend_Ovalue("formatterinstall")
local formatter_by_ft = extend_Tbl("formatter_by_ft")
local dapinstall = extend_Ovalue("dapinstall")
local compile = extend_Tbl("compile")
local coderun = extend_Tbl("coderun")
local formatter_none_list = vim.list_extend(extend_Ovalue("formatterinstall"), nonelsinstall)
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
	elseif name == "nonelsinstall" then
		return nonelsinstall
	elseif name == "nullsetup" then
		return nullsetup
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
	elseif name == "formatter_none_list" then
		return formatter_none_list
	end
end
return M
