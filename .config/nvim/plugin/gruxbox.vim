let g:colorscheme = "gruvbox"

call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:colorscheme])

let g:afterglow_inherit_background=1

let ayucolor="dark"

let g:gruvbox_invert_selection='0'
let g:gruvbox_contrast_dark = 'hard'

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

hi ColorColumn guibg=NONE ctermbg=NONE
hi CursorLineNR guibg=NONE ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

hi TabLine      guifg=#333 guibg=#222 gui=NONE ctermfg=254 ctermbg=238 cterm=NONE
hi TabLineSel   guifg=#666 guibg=#222 gui=BOLD ctermfg=231 ctermbg=235 cterm=BOLD
hi TabLineFill  guifg=#999 guibg=#222 gui=NONE ctermfg=254 ctermbg=238 cterm=NONE
