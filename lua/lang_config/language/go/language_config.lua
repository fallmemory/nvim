-- treesitter
-- local treesitter = { "cpp" }
local treesitter = { "go" }

-- 需要安装的lsp
-- local lspinstall = { "clangd" }
local lspinstall = { "gopls" }

-- 需要启动的lspserver
--local lspserver = { "clangd" }
local lspserver = { "gopls" }

-- lspconfig
-- local lspconfig={
--       clangd={空也要写}
-- }
local lspconfig = {
	gopls = {
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_pattern = { "go.work", "go.mod", ".git" },
		settings = {
			gopls = {
				-- 自动导包
				completeUnimported = true,
				-- 添加占位符
				usePlaceholders = true,
				analyses = {
					-- 如果有未使用参数或函数将警告
					unusedparams = true,
				},
			},
		},
	},
}
-------------------------------------------------------------------------------------
-- nonelsinstall
-- local nonelsinstall = {"cpplint"}
-- local nonelsinstall = { "name in Mason" }
local nonelsinstall = {}
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
-- local formatterinstall = { "isort", "black" }
-- local formatterinstall = { "name in Mason" }
local formatterinstall = {}

--[[
formatter_by_ft使用里的formater文件名
https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters
]]
-- formatter_by_ft
-- local formatter_by_ft = { cpp = { "clang_format" } }
local formatter_by_ft = { go = { "gofmt", "goimports-reviser" } }

--[[
dap安装名
https://github.com/jay-babu/mason-nvim-dap.nvim/tree/main/lua/mason-nvim-dap/mappings/adapters
]]
-- dapinstall
-- local dapinstall = { "cppdbg" }
local dapinstall = { "delve" }

-- dapconfig

-- compile
-- local compile = { cpp = "<esc>:w<cr>:!clang++ % -g -o %:r.exe <cr>" }
local compile = { go = "<esc>:w<cr>:!go build % <cr>" }

-- coderun
-- local coderun = {
-- 	cpp = '<esc>:w<cr><cmd>TermExec direction=float cmd="clang++ % -g -o %:r.exe ; %:r.exe" <cr>',
-- }
local coderun = {
	go = '<esc>:w<cr><cmd>TermExec direction=float cmd="go run %" <cr>',
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
