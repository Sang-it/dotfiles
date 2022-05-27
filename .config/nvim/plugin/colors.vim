let g:colorscheme = "gruvbox"

fun! ColorMyPencils()
    let g:gruvbox_contrast_dark = 'hard'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    let g:gruvbox_invert_selection='0'
    set background=dark
    if has('nvim')
        call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:colorscheme])
    else
        colorscheme gruvbox
    endif
    highlight ColorColumn ctermbg=none guibg=none
    hi SignColumn guibg=none
    hi Normal ctermbg=NONE guibg=NONE
    hi CursorLineNR guibg=None
    highlight Normal guibg=none
endfun
call ColorMyPencils()
