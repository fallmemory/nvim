-- NOTE:treesitter
-- local treesitter = { "cpp" }
local treesitter = { "c" }

-- NOTE:需要安装的lsp
-- local lspinstall = { "clangd" }
local lspinstall = {}

-- NOTE:需要启动的lspserver
--local lspserver = { "clangd" }
local lspserver = { "clangd" }

-- NOTE:lspconfig
-- local lspconfig={
--       clangd={空也要写}
-- }
local lspconfig = {
	clangd = {
		capabilities = { offsetEncoding = { "utf-16", "utf-8" } },
		cmd = {
			"C:/Program Files/mingw64/bin/clangd",
		},
	},
}

--[[
支持的lint
https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
]]

 -- NOTE:lintinstall
 -- local lintinstall = {"cpplint"}
 local lintinstall = { "cpplint" }

 -- NOTE:lint_by_ft
 -- local lint_by_ft = { cpp = { "clangtidy" } }
 local lint_by_ft = { c = { "cpplint" } }

 -- NOTE:linters
 -- local linters = { clangtidy = {} }
 local linters = { cpplint = {} }

-- NOTE:formatterinstall
-- local formatterinstall = { "clang-format" }
local formatterinstall = { "clang-format" }

--[[
formatter_by_ft使用里的formater文件名
https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters
]]
-- NOTE:formatter_by_ft
-- local formatter_by_ft = { cpp = { "clang_format" } }
local formatter_by_ft = { c = { "clang_format" } }

--[[
dap安装名
https://github.com/jay-babu/mason-nvim-dap.nvim/tree/main/lua/mason-nvim-dap/mappings/adapters
]]
-- NOTE:dapinstall
-- local dapinstall = { "cppdbg" }
local dapinstall = { "cppdbg" }

-- NOTE:dapconfig

-- NOTE:compile
-- local compile = { cpp = "<esc>:w<cr>:!clang++ % -g -o %:r.exe <cr>" }
local compile = { c = "<esc>:w<cr>:!gcc % -g -o %:r.exe <cr>" }

-- NOTE:coderun
-- local coderun = {
-- 	cpp = '<esc>:w<cr><cmd>TermExec direction=float cmd="clang++ % -g -o %:r.exe ; %:r.exe" <cr>',
-- }
local coderun = {
	-- c = '<esc>:w<cr><cmd>TermExec direction=float cmd="gcc % -g -o %:r.exe ; %:r.exe" <cr>',
	c = '<esc>:w<cr><cmd>TermExec direction=float cmd="gcc % -g -o %:r.exe && %:r.exe" <cr>',
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
