require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.api.nvim_create_user_command("Conform", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = {
				args.line1,
				0,
			},
			["end"] = {
				args.line2,
				end_line:len(),
			},
		}
	end
	require("conform").format({
		lsp_format = "fallback",
		range = range,
	})
	vim.cmd("w", { async = true })
end, { range = true })
