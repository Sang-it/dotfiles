require("zen-mode").setup({
	window = {
		width = 0.6,
	},
	plugin = {
		options = {
			enabled = true,
			laststatus = 3,
		},
	},
})

--local function maybe_enable_zen()
--	local bufname = vim.api.nvim_buf_get_name(0)
--	local is_oil = vim.bo.filetype == "oil"
--	local zen_active = require("zen-mode.view").is_open()
--	local win_count = #vim.api.nvim_tabpage_list_wins(0)
--	local args = vim.fn.argv()

--	if win_count > 1 then
--		return
--	end

--	---@diagnostic disable-next-line: param-type-mismatch
--	if vim.tbl_contains(args, "leetcode.nvim") then
--		return
--	end

--	if not zen_active and (bufname ~= "" or is_oil) then
--		vim.cmd("ZenMode")
--	end
--end

-- vim.api.nvim_create_autocmd("BufEnter", { callback = maybe_enable_zen })
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "oil",
-- 	callback = maybe_enable_zen,
-- })
