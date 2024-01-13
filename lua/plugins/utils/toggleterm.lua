return {
	-- 内置终端
	"akinsho/toggleterm.nvim",
	cmd = "TermExec",
	version = "*",
	keys = {
		{
			"<c-p>",
			"<cmd>lua _launch()<CR>",
			desc = "(term)打开终端并切换至当前目录,清屏",
		},
	},
	config = function()
		-- 默认终端模式
		local default_dire = "float"
		require("toggleterm").setup({
			-- 终端大小
			size = 40,
			-- 打开终端快捷键
			open_mapping = [[<c-\>]],
			-- 隐藏终端行号
			hide_numbers = true,
			-- 自动更改终端目录
			autochdir = false,
			-- 终端阴影
			shade_terminals = true,
			-- 淡化终端背景的百分比
			shading_factor = "2",
			-- 终端默认输入模式
			start_in_insert = false,
			-- 插入模式时是否可以打开终端
			insert_mappings = false,
			-- 终端模式时是否可以切换终端开关
			terminal_mappings = true,
			-- 是否记住终端大小
			persist_size = true,
			-- 是否记住终端模式
			persist_mode = false,
			-- 终端位置
			--[[
      垂直        水平          tab     浮动
      "vertical"  "horizontal"  "tab"   "float"
      ]]
			direction = default_dire,
			-- 进程退出时关闭终端窗口
			close_on_exit = false,
			-- 更改内置终端为powershell
			-- shell = "powershell -nologo",
			shell = "pwsh -nologo",
			-- 终端输出自动滚动
			auto_scroll = true,
			-- 只浮动模式(float)时启动设置
			float_opts = {
				-- 悬浮模式尺寸
				width = math.floor(vim.api.nvim_list_uis()[1].width / 1.5),
				height = math.floor(vim.api.nvim_list_uis()[1].height / 1.5),
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
			winbar = {
				-- 显示终端名
				enabled = false,
				name_formatter = function(term) --  term: Terminal
					return term.name
				end,
			},
		})
		--------------------------
		function _G.set_terminal_keymaps()
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "退出内置终端", buffer = 0 })
			vim.keymap.set(
				"t",
				"<leader>l",
				"<Cmd> wincmd l<CR>",
				{ desc = "内置终端右切换", noremap = true, silent = true }
			)
			vim.keymap.set(
				"t",
				"<leader>h",
				"<Cmd> wincmd h<CR>",
				{ desc = "内置终端左切换", noremap = true, silent = true }
			)
			vim.keymap.set(
				"t",
				"<leader>j",
				"<Cmd> wincmd j<CR>",
				{ desc = "内置终端下切换", noremap = true, silent = true }
			)
			vim.keymap.set(
				"t",
				"<leader>k",
				"<Cmd> wincmd k<CR>",
				{ desc = "内置终端上切换", noremap = true, silent = true }
			)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		--------------------------
		local Terminal = require("toggleterm.terminal").Terminal
		local launch = Terminal:new({
			close_on_exit = false,
			hidden = true,
			autochdir = false,
		})

		_launch = function()
			if launch:is_open() then
				launch:close()
				return
			end
			local path = vim.fn.expand("%:p:h")
			launch:open()
			launch:change_dir(tostring(path))
			launch:send("clear")
		end
	end,
}
