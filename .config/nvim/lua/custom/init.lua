require("custom.impatient")

require("custom.lsp")

require("custom.tree")

require("custom.fidget")

require("custom.symbols")

require("custom.terminal")

require("custom.snippets")

require("custom.autopairs")

require("custom.telescope")

require("custom.treesitter")

function CreateNoremapGlobal(type, opts)
    return function(lhs, rhs)
        vim.api.nvim_set_keymap(type, lhs, rhs, opts)
    end
end

function CreateNoremap(type, opts)
    return function(lhs, rhs, bufnr)
        bufnr = bufnr or 0
        vim.api.nvim_buf_set_keymap(bufnr, type, lhs, rhs, opts)
    end
end

NnoremapGlobal = CreateNoremapGlobal("n", {noremap = true})
NnoremapGlobal(
    "<leader>nc",
    '<cmd>:lua require("tree-navigation.telescope").navigate_to(require("tree-navigation").get_class_nodes())<CR>'
)

Nnoremap = CreateNoremap("n", {noremap = true})
Inoremap = CreateNoremap("i", {noremap = true})

P = function(v)
    print(vim.inspect(v))
    return v
end

if pcall(require, "plenary") then
    RELOAD = require("plenary.reload").reload_module
    R = function(name)
        RELOAD(name)
        return require(name)
    end
end