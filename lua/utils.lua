local M = {}

-- 检查给定路径是否存在且是否为目录
function M.is_directory(path)
	local stat = vim.loop.fs_stat(path)
	return stat and stat.type == "directory" or false
end

-- 获取icons
function M.get_icons(name)
	return require("config.icons_config")[name]
end

-- 自动使用mason安装formatter和lint
function M.install_fmtlint()
	local formatter_none_list = require("lang_config.config").get_config("formatter_none_list")
	local mason_registry = require("mason-registry")
	local ensure_installed = function()
		for _, name in pairs(formatter_none_list) do
			if not mason_registry.is_installed(name) then
				local package = mason_registry.get_package(name)
				package:install()
			end
		end
	end
	mason_registry.refresh(vim.schedule_wrap(ensure_installed))
end
-------------------------------------------------------------------
-- 搜索替换 
function M.search_replace()
	local search = tostring(vim.fn.input("输入需要被替换的内容:"))
	vim.api.nvim_command("/" .. search)
	local replace = tostring(vim.fn.input("输入替换后的内容:"))
	if vim.fn.input("是否把所有" .. search .. "替换为" .. replace .. "。(yes)") == "yes" then
		vim.api.nvim_command("%s/" .. search .. "/" .. replace .. "/g")
		vim.api.nvim_command("nohl")
		print("已经把所有" .. search .. "替换为" .. replace .. "。")
	else
		print("已经取消替换")
		vim.api.nvim_command("nohl")
	end
end

-------------------------------------------------------------------
return M
