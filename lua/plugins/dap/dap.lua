return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	keys = {
		{
			"<F5>",
			function()
				require("telescope").extensions.dap.configurations({})
			end,
			{ desc = "(Dap)开始调试" },
			mode = "n",
		},
		{
			"<F6>",
			function()
				require("dap").toggle_breakpoint()
			end,
			{ desc = "(Dap)切换断点" },
			mode = "n",
		},
	},
	config = function()
		require("plugins.dap.dapicons").set_dapicons()
		require("plugins.dap.dapkeymaps").dapMap()
		require("mason-nvim-dap").setup({
			-- 自动安装dap
			ensure_installed = require("lang_config.config").get_config("dapinstall"),
			-- automatic_installation = false,
		})

		require("nvim-dap-virtual-text").setup({
			enabled = true,
			enable_commands = true,
			highlight_changed_variables = true,
			highlight_new_as_changed = false,
			show_stop_reason = true,
			commented = false,
			only_first_definition = true,
			all_references = false,
			filter_references_pattern = "<module",
			virt_text_pos = "eol",
			all_frames = false,
			virt_lines = false,
			virt_text_win_col = nil,
		})

		require("dapui").setup()
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
