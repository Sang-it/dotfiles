require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "javascript",
        "json",
        "rust",
        "comment",
        "go",
        "css",
        "bash",
        "typescript",
        "c",
        "c_sharp",
        "elixir",
        "vim",
        "prisma",
        "lua",
        "vue",
        "svelte",
        "python",
        "java",
        "dockerfile",
        "cpp",
        "scss",
        "yaml",
        "tsx",
        "php"
    },
    autopairs = {
        enable = true
    },
    highlight = {enable = true, additional_vim_regex_highlighting = true},
    incremental_selection = {enable = true},
    textobjects = {enable = true}
}