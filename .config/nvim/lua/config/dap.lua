local dap = require("dap")
local ui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

-- Dap Virtual Text
dap_virtual_text.setup()

dap.adapters = {
	codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = vim.fn.expand("$MASON/packages/codelldb/codelldb"),
			args = { "--port", "${port}" },
		},
	},
}

-- Configurations
dap.configurations.c = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

dap.configurations.rust = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

-- Dap UI

ui.setup({
	layouts = {
		{
			elements = {
				{ id = "breakpoints", size = 0.20 },
				{ id = "stacks", size = 0.20 },
				{ id = "scopes", size = 0.30 },
				{ id = "watches", size = 0.30 },
			},
			position = "left",
			size = 50,
		},
		{
			elements = {
				{ id = "console", size = 1.0 },
			},
			position = "bottom",
			size = 10,
		},
	},
})

vim.fn.sign_define("DapBreakpoint", { text = "⭕" })

dap.listeners.before.attach.dapui_config = function()
	ui.open()
end
dap.listeners.before.launch.dapui_config = function()
	ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	ui.close()
end

vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>do", dap.step_over)
vim.keymap.set("n", "<leader>du", dap.step_out)
vim.keymap.set("n", "<leader>dr", dap.repl.open)
vim.keymap.set("n", "<leader>dl", dap.run_last)
vim.keymap.set("n", "<leader>dq", function()
	dap.terminate()
	ui.close()
	dap_virtual_text.toggle()
end)
vim.keymap.set("n", "<leader>db", dap.list_breakpoints)
vim.keymap.set("n", "<leader>de", function()
	dap.set_exception_breakpoints({ "all" })
end)
