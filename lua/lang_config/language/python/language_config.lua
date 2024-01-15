-- treesitter
-- local treesitter = { "cpp" }
local treesitter = { "python" }

-- 需要安装的lsp
-- local lspinstall = { "clangd" }
local lspinstall = { "pyright" }

-- 需要启动的lspserver
--local lspserver = { "clangd" }
local lspserver = { "pyright" }

-- lspconfig
-- local lspconfig={
--       clangd={空也要写}
-- }
local lspconfig = {
	pyright = {},
}
-------------------------------------------------------------------------------------
-- nonelsinstall
-- local nonelsinstall = {"cpplint"}
local nonelsinstall = { "flake8", "mypy", "pylint", "ruff" }
local nullsetup = {
	code_actions = { "gitsigns" },
	completion = {},
	diagnostics = { "mypy", "pylint", "flake8", "ruff" },
	formatting = {},
	hover = {},
	_test = {},
}
-------------------------------------------------------------------------------------
-- formatterinstall
-- local formatterinstall = { "clang-format" }
local formatterinstall = { "isort", "black" }

--[[
formatter_by_ft使用里的formater文件名
https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters
]]
-- formatter_by_ft
-- local formatter_by_ft = { cpp = { "clang_format" } }
local formatter_by_ft = { python = { "isort", "black" } }

--[[
dap安装名
https://github.com/jay-babu/mason-nvim-dap.nvim/tree/main/lua/mason-nvim-dap/mappings/adapters
]]
-- dapinstall
-- local dapinstall = { "cppdbg" }
local dapinstall = { "python" }

-- dapconfig

-- compile
-- local compile = { cpp = "<esc>:w<cr>:!clang++ % -g -o %:r.exe <cr>" }
local compile = { python = "<esc>:w<cr>:!python % <cr>" }

-- coderun
-- local coderun = {
-- 	cpp = '<esc>:w<cr><cmd>TermExec direction=float cmd="clang++ % -g -o %:r.exe ; %:r.exe" <cr>',
-- }
local coderun = {
	python = '<esc>:w<cr><cmd>TermExec direction=float cmd="python %"<cr>',
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
