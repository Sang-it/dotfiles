require("leetcode").setup({
    lang = "python"
})

vim.keymap.set("n", "<leader>co", ":Leet console<CR>")
vim.keymap.set("n", "<leader><CR>", ":Leet submit<CR>")
vim.keymap.set("n", "<leader>t", ":Leet test<CR>")

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local args = vim.fn.argv()
        local should_toggle = true

        for _, arg in ipairs(args) do
            if arg:match("leetcode%.nvim") then
                should_toggle = false
                break
            end
        end

        if should_toggle then
            require("zen-mode").toggle()
        end
    end
})
