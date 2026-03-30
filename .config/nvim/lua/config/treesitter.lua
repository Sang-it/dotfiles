vim.g.skip_ts_context_commentstring_module = true

require("nvim-treesitter").setup()

vim.treesitter.language.register("markdown", "mdx")
