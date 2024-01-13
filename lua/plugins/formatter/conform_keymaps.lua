local map = vim.keymap.set
local M = {}
local mapset = {
	{
		"n",
		"F",
		'<cmd>lua print(vim.inspect(require("conform").list_formatters()))<cr>',
		"(Conform)列出当前可用的formatter",
	},
	-- { "n", "F", "<cmd>lua print(vim.inspect(require(\"conform\").will_fallback_lsp()))<cr>", "当前缓冲区是否会使用lsp格式化" },
	{
		"n",
		"FF",
		'<cmd>lua print(vim.inspect(require("conform").list_all_formatters()))<cr>',
		"(Conform)列出所有已配置的formatter",
	},
}
M.formatterMap = function()
	for _, set in pairs(mapset) do
		map(set[1], set[2], set[3], { desc = "(fmt)" .. set[4] })
	end
end
return M
