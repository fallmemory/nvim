-- treesitter
-- local treesitter = { "cpp" }
local treesitter = { "type" }

-- 需要安装的lsp
-- local lspinstall = { "clangd" }
local lspinstall = { "lspserver" }

-- 需要启动的lspserver
--local lspserver = { "clangd" }
local lspserver = { "lspserver" }

-- lspconfig
-- local lspconfig={
--       clangd={空也要写}
-- }
local lspconfig = {
	lspserver = {},
}
-------------------------------------------------------------------------------------
-- nonelsinstall
-- local nonelsinstall = {"cpplint"}
local nonelsinstall = { "name in Mason" }
local nullsetup = {
	code_actions = {},
	completion = {},
	diagnostics = {},
	formatting = {},
	hover = {},
	_test = {},
}
-------------------------------------------------------------------------------------
-- formatterinstall
-- local formatterinstall = { "clang-format" }
local formatterinstall = { "name in Mason" }

--[[
formatter_by_ft使用里的formater文件名
https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters
]]
-- formatter_by_ft
-- local formatter_by_ft = { cpp = { "clang_format" } }
--[[
	-- 开启单个
	c = { "clang_format" },
	-- 连续启用多个
	python = { "isort", "black" },
	-- 使用子列表，只运行第一个可用的
	javascript = { { "prettierd", "prettier" } },
]]
local formatter_by_ft = { type = { "file name in github" } }

--[[
dap安装名
https://github.com/jay-babu/mason-nvim-dap.nvim/tree/main/lua/mason-nvim-dap/mappings/adapters
]]
-- dapinstall
-- local dapinstall = { "cppdbg" }
local dapinstall = { "file name in github" }

-- dapconfig

-- compile
-- local compile = { cpp = "<esc>:w<cr>:!clang++ % -g -o %:r.exe <cr>" }
local compile = { type = "编译命令" }

-- coderun
-- local coderun = {
-- 	cpp = '<esc>:w<cr><cmd>TermExec direction=float cmd="clang++ % -g -o %:r.exe ; %:r.exe" <cr>',
-- }
local coderun = {
	type = "编译运行",
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
