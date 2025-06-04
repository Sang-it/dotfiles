vim.api.nvim_create_autocmd({ "UIEnter" }, {
	callback = function(_)
		local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
		if client ~= nil and client.name == "Firenvim" then
			vim.o.laststatus = 0
		end
	end,
})

vim.g.firenvim_config = {
	localSettings = {
		[".*"] = {
			cmdline = "none",
			content = "text",
			priority = 0,
			selector = "textarea, input:not([type=checkbox]):not([type=radio]), [contenteditable=true]",
			takeover = "never",
		},
	},
}
