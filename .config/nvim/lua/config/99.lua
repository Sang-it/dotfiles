local _99 = require("99")

_99.setup({
	model = "anthropic/claude-opus-4-6",
	md_files = {
		"AGENTS.md",
	},
	completion = {
		source = "cmp",
	},
	-- logger = {
	-- print_on_error = true,
	-- level = _99.DEBUG,
	-- type = "print",
	-- },
})
