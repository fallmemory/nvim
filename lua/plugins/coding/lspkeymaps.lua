local opts = { noremap = true, silent = true } -- 定义为非递归，静默
local bfkey = vim.api.nvim_buf_set_keymap
local M = {}
local mapset = {
	{ "n", "gs", "<cmd>lua vim.lsp.buf.declaration()<cr>", "跳转到声明" },
	{ "n", "gd", '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', "跳转到定义" },
	{ "n", "K", "<cmd>Lspsaga hover_doc ++project<cr>", "显示类型信息" },
	-- { "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", "显示类型信息" },
	{ "n", "gi", '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>', "跳转到实现" },
	{ "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "显示帮助文档" },
	{ "n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "跳转到类型定义处" },
	-- { "n", "<space>rn", "<cmd>Lspsaga rename ++project<cr>", "重命名包括所有引用" },
	{ "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename() <cr>", "重命名包括所有引用" },
	{ "n", "<C-r>", '<cmd>lua require("telescope.builtin").lsp_references()<cr>', "列出所有引用" },
	{ "n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<cr>", "打开诊断结果浮窗" },
	{ "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "切换到上一个诊断结果" },
	{ "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", "切换到下一个诊断结果" },
	{ "n", "<space>ca", "<cmd>Lspsaga code_action ++project<cr>", "可用的诊断操作" },
	{ "v", "<space>ca", "<cmd>Lspsaga code_action ++project<cr>", "可用的诊断操作" },
	-- { "n", "<space>f", "<cmd>lua vim.lsp.buf.format({async=true})<cr>", "代码格式化" },
}
M.lspMap = function(bufnr)
	for _, set in pairs(mapset) do
		bfkey(bufnr, set[1], set[2], set[3], vim.tbl_deep_extend("force", opts, { desc = "(lsp)" .. set[4] }))
	end
end
return M
