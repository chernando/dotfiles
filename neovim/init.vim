"
" Options
"

" 2 moving around, searching and patterns
set ic    "ignore case when using a search pattern
set scs   "override 'ignorecase' when pattern has upper case characters

" 5 syntax, highlighting and spelling
set tgc   "use GUI colors for the terminal

" 13 editing text
set sm    "when inserting a bracket, briefly jump to its match
set nojs  "use two spaces after '.' when joining a line

" 14 tabs and indenting
set ts=2  "number of spaces a <Tab> in the text stands for
set sw=2  "number of spaces used for each step of (auto)indent
set sts=2 "number of spaces to insert for a <Tab>
set sr    "round to 'shiftwidth' for "<<" and ">>"
set et    "expand <Tab> to spaces in Insert mode
set si    "do clever autoindenting


"
" minpac
"
packadd minpac
call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.
call minpac#add('icymind/NeoSolarized')
call minpac#add('w0rp/ale')


" NeoSolarized Plugin
colorscheme NeoSolarized
let g:neosolarized_italic = 1

" Asynchronous Lint Engine Plugin
let g:ale_sign_error = '🚫'
let g:ale_sign_warning = '🚧'

"
" Autocommands
"

:augroup last-position-jump
:    au!
:    au BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ |   exe "normal! zz"
        \ | endif
:augroup END
