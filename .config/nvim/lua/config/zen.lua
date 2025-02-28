require("zen-mode").setup {
    window = {
        width = .70,
        backdrop = 0,
    }
}

local function maybe_enable_zen()
    local bufname = vim.api.nvim_buf_get_name(0)
    local is_oil = vim.bo.filetype == "oil"
    local zen_active = require("zen-mode.view").is_open()
    local win_count = #vim.api.nvim_tabpage_list_wins(0)
    local args = vim.fn.argv()
    local should_toggle = true
    should_toggle = true

    if win_count > 1 then
        return
    end

    for _, arg in ipairs(args) do
        if arg:match("leetcode.nvim") then
            should_toggle = false
            break
        end
    end

    if not zen_active and should_toggle and (bufname ~= "" or is_oil) then
        vim.cmd("ZenMode")
    end
end

vim.api.nvim_create_autocmd("BufEnter", { callback = maybe_enable_zen })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "oil",
    callback = maybe_enable_zen,
})
