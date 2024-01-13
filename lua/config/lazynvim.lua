local Utils=require("utils")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not Utils.is_directory(lazypath) then
    print "正在进行第一次安装"
 vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
  end
vim.opt.rtp:prepend(lazypath)

local opts = {
  spec = {
    { import = "plugins" },
  },
}
require("lazy").setup(opts)  
