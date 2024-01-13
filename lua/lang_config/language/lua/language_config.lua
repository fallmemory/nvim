-- NOTE:treesitter
local treesitter = { "lua" }

-- NOTE:需要安装的lsp
local lspinstall = { "lua_ls" }

--NOTE:需要启动的lspserver
local lspserver = { "lua_ls" }

-- NOTE:lspconfig
local lspconfig = {
	lua_ls = {
		cmd = {
			"lua-language-server",
			"--locale=zh-cn",
		},
		settings = {
			Lua = {
				hint = {
					enable = true,
					arrayIndex = "Enable",
					setType = true,
				},
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
				diagnostics = {
					enable = true,
					globals = { "Get_icons", "hs", "vim", "it", "describe", "before_each", "after_each" },
					disable = { "lowercase-global" },
				},
			},
		},
	},
}

-- NOTE:lintinstall
local lintinstall = {}

-- NOTE:lint_by_ft
local lint_by_ft = {}

-- NOTE:linters
local linters = {}

-- NOTE:formatterinstall
local formatterinstall = { "stylua" }

-- NOTE:formatter_by_ft
local formatter_by_ft = { lua = { "stylua" } }

-- NOTE:dapinstall
local dapinstall = {}

-- NOTE:dapconfig

-- NOTE:compile
local compile = { lua = "<Nop>" }

-- NOTE:coderun
local coderun = { lua = "<Nop>" }

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
