let g:colorscheme = "rose-pine"

let g:afterglow_inherit_background=1

let ayucolor="dark"

let g:gruvbox_invert_selection='0'
let g:gruvbox_contrast_dark = 'hard'
let g:hybrid_transparent_background = 1

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

hi ColorColumn guibg=NONE ctermbg=NONE
hi CursorLineNR guibg=NONE ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

if colorscheme == "hybrid_material"
    hi DiagnosticError guifg=#cc6666
endif

" hi TreesitterContext guibg=NONE ctermbg=NONE

call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:colorscheme])
