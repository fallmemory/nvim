return {
	-- 搜索替换
	"nvim-pack/nvim-spectre",
	build = false,
	cmd = "Spectre",
	opts = { open_cmd = "noswapfile vnew" },
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("spectre").open() end, desc = "(Spectre)搜索与替换" },
  },
}
