vim.g.skip_ts_context_commentstring_module = true

require("nvim-treesitter.configs").setup {
    ensure_installed = "all",
    autopairs = { enable = true },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    highlight = { enable = true, additional_vim_regex_highlighting = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true }
}

require("treesitter-context").setup {
    enable = true,
    max_lines = 0,
    trim_scope = 'outer',
    patterns = {
        default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
        },
        tex = {
            'chapter',
            'section',
            'subsection',
            'subsubsection',
        },
        rust = {
            'impl_item',
            'struct',
            'enum',
        },
        scala = {
            'object_definition',
        },
        vhdl = {
            'process_statement',
            'architecture_body',
            'entity_declaration',
        },
        markdown = {
            'section',
        },
        elixir = {
            'anonymous_function',
            'arguments',
            'block',
            'do_block',
            'list',
            'map',
            'tuple',
            'quoted_content',
        },
        json = {
            'pair',
        },
        yaml = {
            'block_mapping_pair',
        },
    },
    exact_patterns = {
    },

    zindex = 20,
    mode = 'cursor',
    separator = nil,
}
