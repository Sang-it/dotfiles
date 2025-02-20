require("zen-mode").setup {
    window = {
        width = .65,
        backdrop = 0,
    }
}

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        require("zen-mode").toggle()
    end
})
