require("mason").setup()
require("mason-lspconfig").setup()

local cmp = require("cmp")

local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	path = "[Path]",
}

vim.diagnostic.config({
	virtual_text = false,
	underline = false,
	severity_sort = true,
	signs = true,
})

local lspkind = require("lspkind")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		-- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
		-- ["<C-a>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = nil,
		["<S-Tab>"] = nil,
	}),
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			vim_item.menu = menu
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	},
	experimental = {
		native_menu = false,
		ghost_text = false,
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			-- Nnoremap("<leader>f", ":lua vim.lsp.buf.format({async = true})<CR>")
			Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
			Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
			Nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
			Nnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
			Nnoremap("<leader>t", ":lua vim.diagnostic.goto_next()<cr>")
			Nnoremap("<leader>T", ":lua vim.diagnostic.goto_prev()<CR>")
			Nnoremap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
			Nnoremap("<leader>rr", ":lua vim.lsp.buf.references()<CR>")
			Nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
			Inoremap("<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
		end,
	}, _config or {})
end

vim.lsp.enable({
	"ts_ls",
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
	"sourcekit",
	"arduino_language_server",
})

vim.lsp.config("ts_ls", config())

vim.lsp.config("clangd", config())

vim.lsp.config("pyright", config())

vim.lsp.config("html", config())

vim.lsp.config("cssls", config())

vim.lsp.config("jdtls", config())

vim.lsp.config("csharp_ls", config())

vim.lsp.config("prismals", config())

vim.lsp.config(
	"elixirls",
	config({
		cmd = { "elixir-ls" },
	})
)

vim.lsp.config(
	"hls",
	config({
		filetypes = { "haskell", "lhaskell", "cabal" },
		settings = {
			haskell = {
				formattingProvider = "fourmolu",
				cabalFormattingProvider = "cabal-fmt",
			},
		},
	})
)

vim.lsp.config(
	"jsonls",
	config({
		settings = {
			json = {
				validate = { enable = true },
			},
		},
	})
)

vim.lsp.config(
	"gopls",
	config({
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
)

vim.lsp.config(
	"rust_analyzer",
	config({
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	})
)

vim.lsp.config(
	"lua_ls",
	config({
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = vim.split(package.path, ";"),
				},
				diagnostics = {
					globals = { "vim", "Nnoremap", "Inoremap" },
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
)

vim.lsp.config("v_analyzer", config())

vim.lsp.config("zls", config())

vim.lsp.config("cmake", config())

vim.lsp.config("dockerls", config())

vim.lsp.config("ruff", config())

vim.lsp.config("ruff", config())

local home = os.getenv("HOME")
vim.lsp.config(
	"arduino_language_server",
	config({
		cmd = {
			vim.fn.expand("$MASON/packages/arduino-language-server/arduino-language-server"),
			"-cli-config",
			home .. "/Library/Arduino15/arduino-cli.yaml",
		},
	})
)

vim.lsp.config(
	"sourcekit",
	config({
		settings = {
			filetypes = { "swift" },
		},
	})
)
