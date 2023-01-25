local dap = require("dap")
-- set up for go
require("dap-go").setup()

-- set up for rust (adapter is already set in rust-tools)
-- suggest use :RustDebugger to launch debuggee
dap.configurations.rust = require("plugins.dap.config.rust").configuration
