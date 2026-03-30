local _99 = require("99")

_99.setup({
	model = "claude-opus-4-6",
	provider = _99.Providers.ClaudeCodeProvider,
	completion = {
		-- source = "cmp",
	},
	-- logger = {
	-- print_on_error = true,
	-- level = _99.DEBUG,
	-- type = "print",
	-- },
})
