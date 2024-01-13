return {
	-- 高亮相同内容
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	config = function()
		require("illuminate").resume()
		vim.keymap.set(
			"n",
			".",
			"<cmd>lua require('illuminate').goto_next_reference(wrap)<CR>",
			{ desc = "跳转到下一个光标高亮处" }
		)
		vim.keymap.set(
			"n",
			",",
			"<cmd>lua require('illuminate').goto_prev_reference(wrap)<CR>",
			{ desc = "跳转到上一个光标高亮处" }
		)
		vim.keymap.set(
			"n",
			"<leader>/",
			"<cmd>lua require('illuminate').toggle()<CR>",
			{ desc = "打开或关闭光标内容高亮" }
		)
	end,
}
