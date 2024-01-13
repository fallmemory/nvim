local cpp_dap = {}
local dap = require("dap")
dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7.exe",
	options = {
		detached = false,
	},
}

dap.configurations.cpp = {
	{
		name = "Launch file (vscode-cpptools)",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable:", vim.fn.expand("%:p:r") .. ".exe", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
	},
	-- {
	--   name = 'Attach to gdbserver :1234',
	--   type = 'cppdbg',
	--   request = 'launch',
	--   MIMode = 'gdb',
	--   miDebuggerServerAddress = 'localhost:1234',
	--   miDebuggerPath = '/usr/bin/gdb',
	--   cwd = '${workspaceFolder}',
	--   program = function()
	--     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
	--   end,
	-- },
}
-- end
return cpp_dap
