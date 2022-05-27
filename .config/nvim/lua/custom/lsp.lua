local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local cmp = require("cmp")

local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]"
}

local lspkind = require("lspkind")

cmp.setup(
    {
        mapping = cmp.mapping.preset.insert(
            {
                ["<C-y>"] = cmp.mapping.confirm({select = true}),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-a>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete()
            }
        ),
        formatting = {
            format = function(entry, vim_item)
                vim_item.kind = lspkind.presets.default[vim_item.kind]
                local menu = source_mapping[entry.source.name]
                if entry.source.name == "cmp_tabnine" then
                    if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                        menu = entry.completion_item.data.detail .. " " .. menu
                    end
                    vim_item.kind = ""
                end
                vim_item.menu = menu
                return vim_item
            end
        },
        sources = {
            {name = "cmp_tabnine"},
            {name = "nvim_lsp"},
            {name = "buffer"}
        }
    }
)

local tabnine = require("cmp_tabnine.config")

tabnine:setup(
    {
        max_lines = 1000,
        max_num_results = 5,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = ".."
    }
)

local function config(_config)
    return vim.tbl_deep_extend(
        "force",
        {
            capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
            on_attach = function()
                Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
                Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
                Nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
                Nnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
                Nnoremap("[d", ":lua vim.lsp.diagnostic.goto_next()<cr>")
                Nnoremap("]d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
                Nnoremap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
                Nnoremap("<leader>rr", ":lua vim.lsp.buf.references()<CR>")
                Nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
                Inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
            end
        },
        _config or {}
    )
end

require("lspconfig").tsserver.setup(config())

require("lspconfig").ccls.setup(config())

require("lspconfig").pyright.setup(config())

require("lspconfig").cssls.setup(config())

require("lspconfig").jsonls.setup(config())

require("lspconfig").vimls.setup(config())

-- require("lspconfig").dockerls.setup(config())

-- require("lspconfig").svelte.setup(config())

-- require("lspconfig").sqlls.setup(config())

-- require("lspconfig").ember.setup(config())

-- require("lspconfig").tailwindcss.setup(config())

-- require("lspconfig").vuels.setup(config())

-- require("lspconfig").angularls.setup(config())

require("lspconfig").bashls.setup(config())

require("lspconfig").graphql.setup(config())

require("lspconfig").jdtls.setup(config())

require("lspconfig").csharp_ls.setup(config())

require("lspconfig").elixirls.setup(config())

require("lspconfig").gopls.setup(
    config(
        {
            cmd = {"gopls", "serve"},
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
    config(
        {
            cmd = {"rustup", "run", "nightly", "rust-analyzer"}
        }
    )
)

require("lspconfig").sumneko_lua.setup(
    config(
        {
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                        path = vim.split(package.path, ";")
                    },
                    diagnostics = {
                        globals = {"vim"}
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

local opts = {
    highlight_hovered_item = true,
    show_guides = true
}

require("symbols-outline").setup(opts)
