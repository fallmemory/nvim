local M = {}
vim.api.nvim_set_hl(0, "DapStoppedLine", { default = false, link = "Folded" })
local icons = require("utils").get_icons("dap_icons")
local dap_icons = {
	Stopped = { icons.Stopped, "DiagnosticInfo", "DapStoppedLine" },
	Breakpoint = { icons.Breakpoint, "DiagnosticError" },
	BreakpointCondition = { icons.BreakpointCondition, "DiagnosticWarn" },
	BreakpointRejected = { icons.BreakpointRejected, "DiagnosticHint" },
	LogPoint = { icons.LogPoint, "DiagnosticInfo" },
}
M.set_dapicons = function()
	for name, sign in pairs(dap_icons) do
		vim.fn.sign_define(
			"Dap" .. name,
			{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
		)
	end
end
return M
