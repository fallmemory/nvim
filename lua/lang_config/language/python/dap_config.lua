local debugpy_dap = {}
local debugpy_path = require("mason-registry").get_package("debugpy"):get_install_path()
require("dap-python").setup(debugpy_path .. "/venv/Scripts/python")
return debugpy_dap
