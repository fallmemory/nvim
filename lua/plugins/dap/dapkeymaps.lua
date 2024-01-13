local map = vim.keymap.set
local M = {}
local mapset = {
	{
		"n",
		"<S-F5>",
		'<cmd>lua require("dap").close()<cr>'
			.. '<cmd>lua require("dap").terminate()<cr>'
			.. '<cmd>lua require("dap.repl").close()<cr>'
			.. '<cmd>lua require("dapui").close()<cr>'
			.. '<cmd>lua require("dap").clear_breakpoints()<cr>',
		"关闭所有调试窗口并清理断点",
	},
	{ "n", "<F3>", '<cmd>lua require("dap").step_over()<cr>', "不进入子函数继续执行" },
	{ "n", "<F4>", '<cmd>lua require("dap").step_into()<cr>', "进入子函数继续运行" },
	{ "n", "<F7>", '<cmd>lua require("dap").step_out()<cr>', "直接执行完子函数并返回上层函数" },
	{ "n", "<F8>", '<cmd>lua require("dap").run_to_cursor()<cr>', "暂时让其它断点失效" },
	{ "n", "<F9>", '<cmd>lua require("dap").terminate()<cr>', "停止调试" },
	-- { "n", "<F9>", '<cmd>lua require("dapui").float_element("stacks")<cr>', "暂时让其它断点失效" }, -- { "n",
	-- 	"<leader>lp",
	-- 	'<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>',
	-- 	"断点信息",
	-- },
	-- { "n", "<leader>dr", '<cmd>lua require("dap").repl.toggle()<cr>', "切换交互式解释器界面" },
	-- { "n", "<leader>ld", '<cmd>lua require("dap").run_last()<cr>', "Run Last" },
	-- {
	-- 	"n",
	-- 	"<leader>df",
	-- 	'<cmd>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)<cr>',
	-- 	"未知",
	-- },
	-- {
	-- 	"n",
	-- 	"<leader>ds",
	-- 	'<cmd>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)<cr>',
	-- 	"未知",
	-- },
	-- { "n", "<leader>dh", '<cmd>lua require("dap.ui.widgets").hover()<cr>', "未知" },
	-- { "n", "<leader>dp", '<cmd>lua require("dap.ui.widgets").preview()<cr>', "未知" },
	{ "n", "<C-d>", '<cmd>lua require("dapui").toggle()<cr>', "切换dapui" },
}
M.dapMap = function()
	for _, set in pairs(mapset) do
		map(set[1], set[2], set[3], { desc = "(Dap)" .. set[4] })
	end
end
return M
