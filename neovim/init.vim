"
" Options
"

" 2 moving around, searching and patterns
set ic    "ignore case when using a search pattern
set scs   "override 'ignorecase' when pattern has upper case characters

" 5 syntax, highlighting and spelling
"set bg=light   "the background color brightness
set tgc       "use GUI colors for the terminal

" 6 multiple windows
set hid   "don't unload a buffer when no longer shown in a window

" 8 terminal
set title "show info in the window title

" 11 messages and info
set shm+=c  "list of flags to make messages shorter

" 13 editing text
set sm    "when inserting a bracket, briefly jump to its match
set nojs  "use two spaces after '.' when joining a line

" 14 tabs and indenting
set ts=2  "number of spaces a <Tab> in the text stands for
set sw=2  "number of spaces used for each step of (auto)indent
set sts=2 "number of spaces to insert for a <Tab>
set sr    "round to 'shiftwidth' for "<<" and ">>"
set et    "expand <Tab> to spaces in Insert mode

" 18 reading and writing files
set nowb  "write a backup file before overwriting a file

" 19 the swap file
set ut=300  "time in msec after which the swap file will be updated

" 22 running make and jumping to errors
if executable('rg')
	set gp=rg\ --vimgrep
endif

" 25 various
set pyx=3
set scl=yes  "whether to show the signcolumn


"
" vim-polyglot
"
let g:polyglot_disabled = ['sensible']


"
" Plug
"
call plug#begin()
Plug 'lifepillar/vim-solarized8'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


"
" vim-solarized8
"
colorscheme solarized8_flat


"
" vim-fugitive
"
set stl=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P


"
" CoC
"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}\ 


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

:augroup gitconfig
:    au!
:    au FileType gitconfig setlocal noet
:augroup END

:augroup gitconfig
:    au!
:    au BufNewFile,BufRead *.vtl set ft=velocity
:augroup END
