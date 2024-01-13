-- NOTE:treesitter
-- local treesitter = { "cpp" }
local treesitter = { "go" }

-- NOTE:需要安装的lsp
-- local lspinstall = { "clangd" }
local lspinstall = { "gopls" }

-- NOTE:需要启动的lspserver
--local lspserver = { "clangd" }
local lspserver = { "gopls" }

-- NOTE:lspconfig
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

--[[
支持的lint
https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
]]

-- NOTE:lintinstall
-- local lintinstall = {"cpplint"}
-- local lintinstall = { "name in Mason" }
local lintinstall = {}

-- NOTE:lint_by_ft
-- local lint_by_ft = { cpp = { "clangtidy" } }
-- local lint_by_ft = { type = { "linter name", "name2", "name3" } }
local lint_by_ft = {}

-- NOTE:linters
-- local linters = { clangtidy = {} }
-- local linters = { linter_name1 = {}, linter_name2 = {}, linter_name3 = {} }
local linters = {}

-- NOTE:formatterinstall
-- local formatterinstall = { "isort", "black" }
-- local formatterinstall = { "name in Mason" }
local formatterinstall = {}

--[[
formatter_by_ft使用里的formater文件名
https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters
]]
-- NOTE:formatter_by_ft
-- local formatter_by_ft = { cpp = { "clang_format" } }
local formatter_by_ft = { go = { "gofmt", "goimports-reviser" } }

--[[
dap安装名
https://github.com/jay-babu/mason-nvim-dap.nvim/tree/main/lua/mason-nvim-dap/mappings/adapters
]]
-- NOTE:dapinstall
-- local dapinstall = { "cppdbg" }
local dapinstall = { "delve" }

-- NOTE:dapconfig

-- NOTE:compile
-- local compile = { cpp = "<esc>:w<cr>:!clang++ % -g -o %:r.exe <cr>" }
local compile = { go = "<esc>:w<cr>:!go build % <cr>" }

-- NOTE:coderun
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
