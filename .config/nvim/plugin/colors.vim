let g:colorscheme = "ayu"

fun! ColorMyPencils()
    call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:colorscheme])

    let ayucolor="dark"

    let g:gruvbox_invert_selection='0'
    let g:gruvbox_contrast_dark = 'hard'

    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    highlight ColorColumn ctermbg=NONE guibg=NONE
    hi SignColumn guibg=NONE
    hi Normal ctermbg=NONE guibg=NONE
    hi CursorLineNR guibg=NONE

endfun
call ColorMyPencils()
