require("mason").setup()

vim.diagnostic.config({
	virtual_text = false,
	underline = false,
	severity_sort = true,
	signs = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end

		local opts = { buffer = args.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "<leader>t", function()
			vim.diagnostic.jump({ count = 1 })
		end, opts)
		vim.keymap.set("n", "<leader>T", function()
			vim.diagnostic.jump({ count = -1 })
		end, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	end,
})

vim.lsp.enable({
	"phpactor",
	"ts_ls",
	"denols",
	"clangd",
	"pyright",
	"html",
	"cssls",
	"jdtls",
	"csharp_ls",
	"prismals",
	"elixirls",
	"hls",
	"jsonls",
	"gopls",
	"rust_analyzer",
	"lua_ls",
	"v_analyzer",
	"zls",
	"cmake",
	"dockerls",
	"ruff",
	-- "sourcekit",
	"elmls",
	"arduino_language_server",
})

vim.lsp.config("ts_ls", {
	---@diagnostic disable-next-line: unused-local
	root_dir = function(bufnr, on_dir)
		local root_path = vim.fs.find("package.json", {
			upward = true,
			type = "file",
			path = vim.fn.getcwd(),
		})[1]

		if root_path then
			on_dir(vim.fn.fnamemodify(root_path, ":h"))
		end
	end,
	single_file_support = true,
})

vim.lsp.config("elixirls", {
	cmd = { "elixir-ls" },
})

vim.lsp.config("hls", {
	filetypes = { "haskell", "lhaskell", "cabal" },
	settings = {
		haskell = {
			formattingProvider = "fourmolu",
			cabalFormattingProvider = "cabal-fmt",
		},
	},
})

vim.lsp.config("jsonls", {
	settings = {
		json = {
			validate = { enable = true },
		},
	},
})

vim.lsp.config("gopls", {
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
			},
		},
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})

vim.lsp.config("denols", {
	---@diagnostic disable-next-line: unused-local
	root_dir = function(bufnr, on_dir)
		local root_path = vim.fs.find("deno.json", {
			upward = true,
			type = "file",
			path = vim.fn.getcwd(),
		})[1]

		if root_path then
			on_dir(vim.fn.fnamemodify(root_path, ":h"))
		end
	end,
})

local home = os.getenv("HOME")
vim.lsp.config("arduino_language_server", {
	cmd = {
		vim.fn.expand("$MASON/packages/arduino-language-server/arduino-language-server"),
		"-cli-config",
		home .. "/Library/Arduino15/arduino-cli.yaml",
	},
})
