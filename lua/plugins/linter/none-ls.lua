return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	config = function()
		local null_ls = require("null-ls")
		local nullsetup_tbl = require("lang_config.config").get_config("nullsetup")
		local list = {}
		for operation, operation_tbl in pairs(nullsetup_tbl) do
			if operation_tbl ~= nil then
				for _, nullservers in pairs(operation_tbl) do
					local server = null_ls.builtins[operation][nullservers]
					table.insert(list, server)
				end
			end
		end

		null_ls.setup({ sources = list })
	end,
}
