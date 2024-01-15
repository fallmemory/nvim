-- treesitter
local treesitter = { "lua" }

-- 需要安装的lsp
local lspinstall = { "lua_ls" }

--NOTE:需要启动的lspserver
local lspserver = { "lua_ls" }

-- lspconfig
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
-------------------------------------------------------------------------------------
-- nonelsinstall
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
local formatterinstall = { "stylua" }

-- formatter_by_ft
local formatter_by_ft = { lua = { "stylua" } }

-- dapinstall
local dapinstall = {}

-- dapconfig

-- compile
local compile = { lua = "<Nop>" }

-- coderun
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
