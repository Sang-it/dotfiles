lua require("custom")

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

nnoremap <C-p> :lua require('telescope.builtin').git_files(require('telescope.themes').get_ivy({}))<CR>

nnoremap <Leader>f :lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({}))<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

nnoremap <leader>l :lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy({}))<CR>

nnoremap <leader>b :lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({}))<CR>

nnoremap <leader>h :lua require('telescope.builtin').help_tags(require('telescope.themes').get_ivy({}))<CR>

nnoremap <leader>vrc :lua require('custom.telescope').search_dotfiles({ hidden = true })<CR>

nnoremap <leader>gc :lua require('custom.telescope').git_branches(require('telescope.themes').get_ivy({}))<CR>
