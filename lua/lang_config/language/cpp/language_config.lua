-- treesitter
local treesitter = { "cpp" }

-- 需要安装的lsp
local lspinstall = {}

--NOTE:需要启动的lspserver
local lspserver = { "clangd" }

-- lspconfig
-- lspconfig={
-- local xxxx={空也要写}
-- }
local lspconfig = {
	clangd = {
		capabilities = { offsetEncoding = { "utf-16", "utf-8" } },
		cmd = {
			"C:/Program Files/mingw64/bin/clangd",
		},
	},
}
-------------------------------------------------------------------------------------
-- nonelsinstall
local nonelsinstall = { "cpplint" }
local nullsetup = {
	code_actions = {},
	completion = {},
	diagnostics = {"cpplint"},
	formatting = {},
	hover = {},
	_test = {},
}
-------------------------------------------------------------------------------------
-- formatterinstall
local formatterinstall = { "clang-format" }

-- formatter_by_ft
local formatter_by_ft = { cpp = { "clang_format" } }

-- dapinstall
local dapinstall = { "cppdbg" }

-- dapconfig

-- compile
local compile = { cpp = "<esc>:w<cr>:!clang++ % -g -o %:r.exe <cr>" }

-- coderun
local coderun = {
	cpp = '<esc>:w<cr><cmd>TermExec direction=float cmd="clang++ % -g -o %:r.exe && %:r.exe" <cr>',
}

local M = {}
M.GET = function(name)
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
	end
end
return M
