local _99 = require("99")

_99.setup({
	model = "zai-coding-plan/glm-4.7",
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
