-- vim.g.colorscheme = "rose-pine"
vim.g.colorscheme = "warlock"
vim.cmd("colorscheme " .. vim.g.colorscheme)
vim.opt.shada = ""

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

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
vim.opt.wrap = true
vim.opt.whichwrap = "<,>,h,l"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.scroll = 8
-- vim.opt.showmode = false
vim.opt.signcolumn = "number"
vim.opt.background = "dark"
vim.opt.cmdheight = 1
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
vim.keymap.set("n", "<leader>grum", ":Git rebase upstream/main<CR>")
vim.keymap.set("n", "<leader>grom", ":Git rebase origin/main<CR>")
vim.keymap.set("n", "<leader>g", ":Git<CR>")

-- vim.keymap.set("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>_", ":vertical resize +5<CR>")
vim.keymap.set("n", "<leader>-", ":vertical resize -5<CR>")
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>h", ":Conform<CR>")
vim.keymap.set("n", "<leader>u", ":q!<CR>")

-- vim.keymap.set("n", "<leader>d", ":!date<CR>")
vim.keymap.set("n", "<leader>o", "q:")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-h>", "<C-W><C-H>")
vim.keymap.set("n", "<C-l>", "<C-W><C-L>")
vim.keymap.set("n", "<C-j>", "<C-W><C-J>")
vim.keymap.set("n", "<C-k>", "<C-W><C-K>")

vim.keymap.set({ "n", "v" }, "-", "$")
vim.keymap.set({ "n", "v" }, "_", "^")

vim.keymap.set("n", "<leader>e", ":Oil<CR>", { silent = true })
vim.keymap.set("n", "<leader>.r", function()
	require("telescope.builtin").find_files()
end)
vim.keymap.set("n", "<leader>.c", function()
	require("telescope.builtin").live_grep()
end)
vim.keymap.set("n", "<leader>z", ":Goyo<CR>")

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
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local ok, fortune = pcall(require, "fortune")
		if not ok then
			return
		end

		local lines = fortune.get_fortune()
		if type(lines) == "table" then
			local message = table.concat(lines, " ")
			local words = {}
			for word in message:gmatch("%S+") do
				table.insert(words, word)
			end
			local cleaned = table.concat(words, " ")
			vim.schedule(function()
				vim.api.nvim_echo({ { cleaned, "None" } }, false, {})
			end)
		end
	end,
})
