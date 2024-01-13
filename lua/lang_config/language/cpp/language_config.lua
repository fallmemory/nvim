-- NOTE:treesitter
local treesitter = { "cpp" }

-- NOTE:需要安装的lsp
local lspinstall = {}

--NOTE:需要启动的lspserver
local lspserver = { "clangd" }

-- NOTE:lspconfig
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

-- NOTE:lintinstall
local lintinstall = {}

-- NOTE:lint_by_ft
local lint_by_ft = { cpp = { "clangtidy" } }

-- NOTE:linters
local linters = { clangtidy = {} }

-- NOTE:formatterinstall
local formatterinstall = { "clang-format" }

-- NOTE:formatter_by_ft
local formatter_by_ft = { cpp = { "clang_format" } }

-- NOTE:dapinstall
local dapinstall = { "cppdbg" }

-- NOTE:dapconfig

-- NOTE:compile
local compile = { cpp = "<esc>:w<cr>:!clang++ % -g -o %:r.exe <cr>" }

-- NOTE:coderun
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
	end
end
return M
