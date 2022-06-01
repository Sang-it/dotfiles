lua require("theenix")

nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>f :lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader>p :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>l :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap <leader>b :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>h :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>gc :lua require('telescope.builtin').git_branches()<CR>
