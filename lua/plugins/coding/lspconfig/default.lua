local on_attach = function(_, buffer)
	require("plugins.coding.lspkeymaps").lspMap(buffer)
end
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local opts = {
	on_attach = on_attach,
	capabilities = capabilities,
}
return opts
