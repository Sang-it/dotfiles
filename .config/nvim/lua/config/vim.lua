-- vim.g.colorscheme = "rose-pine"
vim.g.colorscheme = "warlock"
vim.cmd("colorscheme " .. vim.g.colorscheme)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.g.loaded_matchparen = 1
vim.g.loaded_perl_provider = 0
vim.g.mapleader = " "
vim.g.rg_derive_root = true
vim.g.zig_fmt_autosave = 0

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }

vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
-- vim.opt.showmode = false
vim.opt.signcolumn = "number"
vim.opt.background = "dark"
vim.opt.updatetime = 50
vim.opt.clipboard:append("unnamedplus")
vim.opt.shortmess:append("c")
-- vim.opt.wildmode = "longest,list,full"
-- vim.opt.wildmenu = true
vim.opt.wildignore:append({
	"*.pyc",
	"*_build/*",
	"**/coverage/*",
	"**/node_modules/*",
	"**/.git/*",
})

vim.keymap.set("n", "<leader>ga", ":Git fetch --all<CR>")
vim.keymap.set("n", "<leader>grum", ":Git rebase upstream/master<CR>")
vim.keymap.set("n", "<leader>grom", ":Git rebase origin/master<CR>")
vim.keymap.set("n", "<leader>g", ":Git<CR>")

-- vim.keymap.set("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>_", ":vertical resize +5<CR>")
vim.keymap.set("n", "<leader>-", ":vertical resize -5<CR>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>f", ":Conform<CR>")
vim.keymap.set("n", "<leader>q", ":q!<CR>")

-- vim.keymap.set("n", "<leader>d", function()
-- 	local zen_active = require("zen-mode.view").is_open()
-- 	if zen_active then
-- 		require("zen-mode.view").toggle()
-- 	end
-- 	local args = vim.fn.input("Dispatch ")
-- 	local final_command = ":Dispatch " .. args
-- 	vim.api.nvim_command(final_command)
-- end)

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "gh", "<C-W><C-H>")
vim.keymap.set("n", "gl", "<C-W><C-L>")
vim.keymap.set("n", "gj", "<C-W><C-J>")
vim.keymap.set("n", "gk", "<C-W><C-K>")

vim.keymap.set({ "n", "v" }, "-", "$")
vim.keymap.set({ "n", "v" }, "_", "^")

vim.keymap.set("n", "<leader>e", ":Oil<CR>", { silent = true })
vim.keymap.set("n", "<leader>pf", function()
	require("telescope.builtin").find_files()
end)
vim.keymap.set("n", "<leader>pr", function()
	require("telescope.builtin").live_grep()
end)
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>")

vim.diagnostic.config({
	virtual_text = false,
	signs = false,
	underline = false,
})

vim.api.nvim_create_augroup("highlight_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "highlight_yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 40 })
	end,
})

vim.api.nvim_create_augroup("no_trailing_whitespace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = "no_trailing_whitespace",
	pattern = "*",
	command = "%s/\\s\\+$//e",
})

vim.api.nvim_create_augroup("numbertoggle", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	group = "numbertoggle",
	pattern = "*",
	callback = function()
		if vim.wo.nu and vim.fn.mode() ~= "i" then
			vim.wo.rnu = true
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
	group = "numbertoggle",
	pattern = "*",
	callback = function()
		if vim.wo.nu then
			vim.wo.rnu = false
		end
	end,
})
