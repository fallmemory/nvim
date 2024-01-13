-- NOTE:treesitter
-- local treesitter = { "cpp" }
local treesitter = { "type" }

-- NOTE:需要安装的lsp
-- local lspinstall = { "clangd" }
local lspinstall = { "lspserver" }

-- NOTE:需要启动的lspserver
--local lspserver = { "clangd" }
local lspserver = { "lspserver" }

-- NOTE:lspconfig
-- local lspconfig={
--       clangd={空也要写}
-- }
local lspconfig = {
	lspserver = {},
}

--[[
支持的lint
https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
]]

-- NOTE:lintinstall
-- local lintinstall = {"cpplint"}
local lintinstall = { "name in Mason" }

-- NOTE:lint_by_ft
-- local lint_by_ft = { cpp = { "clangtidy" } }
local lint_by_ft = { type = { "linter name", "name2", "name3" } }

-- NOTE:linters
-- local linters = { clangtidy = {} }
local linters = { linter_name1 = {}, linter_name2 = {}, linter_name3 = {} }

-- NOTE:formatterinstall
-- local formatterinstall = { "clang-format" }
local formatterinstall = { "name in Mason" }

--[[
formatter_by_ft使用里的formater文件名
https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters
]]
-- NOTE:formatter_by_ft
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
-- NOTE:dapinstall
-- local dapinstall = { "cppdbg" }
local dapinstall = { "file name in github" }

-- NOTE:dapconfig

-- NOTE:compile
-- local compile = { cpp = "<esc>:w<cr>:!clang++ % -g -o %:r.exe <cr>" }
local compile = { type = "编译命令" }

-- NOTE:coderun
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
