local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local cmp = require("cmp")

local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    path = "[Path]"
}

vim.diagnostic.config {
    virtual_text = false,
    signs = false,
    underline = false,
}

local lspkind = require("lspkind")

cmp.setup(
    {
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        },
        mapping = cmp.mapping.preset.insert(
            {
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-a>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<Tab>"] = nil,
                ["<S-Tab>"] = nil
            }
        ),
        formatting = {
            format = function(entry, vim_item)
                vim_item.kind = lspkind.presets.default[vim_item.kind]
                local menu = source_mapping[entry.source.name]
                vim_item.menu = menu
                return vim_item
            end
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
        },
        experimental = {
            native_menu = false,
            ghost_text = false
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        }
    }
)

local function config(_config)
    return vim.tbl_deep_extend(
        "force",
        {
            capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
            on_attach = function()
                Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
                Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
                Nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
                Nnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
                Nnoremap("[d", ":lua vim.diagnostic.goto_next()<cr>")
                Nnoremap("]d", ":lua vim.diagnostic.goto_prev()<CR>")
                Nnoremap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
                Nnoremap("<leader>rr", ":lua vim.lsp.buf.references()<CR>")
                Nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
                Inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
            end
        },
        _config or {}
    )
end

require("lspconfig").ts_ls.setup(config())

-- require("lspconfig").ccls.setup(config())

require("lspconfig").clangd.setup(config())

require("lspconfig").pyright.setup(config())

-- require("lspconfig").pylyzer.setup(config({
--     settings = {
--         python = {
--             inlayHints = false,
--         },
--     },
-- }))

require 'lspconfig'.sourcekit.setup(config())

require("lspconfig").html.setup(config())

require("lspconfig").cssls.setup(config())

require("lspconfig").jdtls.setup(config())

require("lspconfig").csharp_ls.setup(config())

-- require("lspconfig").fsautocomplete.setup(config())

require("lspconfig").elixirls.setup(config({
    cmd = { 'elixir-ls' }
}))

require("lspconfig").prismals.setup(config())

require("lspconfig").ocamllsp.setup(config())

-- require("lspconfig").emmet_ls.setup(config({
--     filetypes = { 'html', 'typescriptreact', 'javascriptreact' }
-- }))

require("lspconfig").hls.setup(config({
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
    settings = {
        haskell = {
            formattingProvider = 'fourmolu',
            cabalFormattingProvider = "cabal-fmt",
        },
    }
}))

require("lspconfig").jsonls.setup(
    config(
        {
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true }
                }
            }
        }
    )
)

require("lspconfig").gopls.setup(
    config(
        {
            cmd = { "gopls", "serve" },
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true
                    },
                    staticcheck = true
                }
            }
        }
    )
)

require("lspconfig").rust_analyzer.setup(
    config({
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                }
            }
        }
    })
)



require("lspconfig").lua_ls.setup(
    config(
        {
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                        path = vim.split(package.path, ";")
                    },
                    diagnostics = {
                        globals = { "vim", "Nnoremap", "Inoremap" }
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                        }
                    }
                }
            }
        }
    )
)

require('lspconfig').v_analyzer.setup(config())

require('lspconfig').zls.setup(config())

require('lspconfig').metals.setup(config())

require('lspconfig').cmake.setup(config())

require("lspconfig").dockerls.setup(config())

require("lspconfig").ruff.setup(config())

-- require("lspconfig").tailwindcss.setup(config())
