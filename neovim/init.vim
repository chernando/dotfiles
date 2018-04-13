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
set ts=4  "number of spaces a <Tab> in the text stands for
set sw=4  "number of spaces used for each step of (auto)indent
set sts=4 "number of spaces to insert for a <Tab>
set sr    "round to 'shiftwidth' for "<<" and ">>"
set et    "expand <Tab> to spaces in Insert mode
set si    "do clever autoindenting


"dein Script-----------------------------
" Required:
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('icymind/NeoSolarized')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Script-------------------------

" NeoSolarized Plugin
colorscheme NeoSolarized
let g:neosolarized_italic = 1
