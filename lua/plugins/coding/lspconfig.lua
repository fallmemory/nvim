return {
	-- lsp语言服务
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- mason服务器管理器
		"mason.nvim",
		-- nvim lua API 的完整签名帮助、文档和补全
		-- 会显示lsp载入状态信息
		{ "folke/neodev.nvim", event = "VeryLazy" },
		-- mason和lspconfig交互插件
		{ "williamboman/mason-lspconfig.nvim", event = "VeryLazy" },
		-- 更友好的lsp界面
		{
			"nvimdev/lspsaga.nvim",
			event = "VeryLazy",
			opts = {},
		},
	},

	config = function()
		local langconfig = require("lang_config.config")
		local ensure_installed = langconfig.get_config("lspinstall")
		local lspconfig = langconfig.get_config("lspconfig")
		local defaultconfig = require("plugins.coding.lspconfig.default")
		local icons = require("utils").get_icons("diagnostics")
		-- diagnostics图标设置
		for name, icon in pairs(icons) do
			name = "DiagnosticSign" .. name
			vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
		end
		-- 关闭错误提醒等虚拟文字
		vim.diagnostic.config({ virtual_text = false })
		require("mason-lspconfig").setup({
			ensure_installed = ensure_installed,
		})
		for servername, serverconfig in pairs(lspconfig) do
			 if servername == "lua_ls" then
			 	require("neodev").setup()
			 end
			require("lspconfig")[servername].setup(vim.tbl_deep_extend("force", defaultconfig, serverconfig))
		end
	end,
}
