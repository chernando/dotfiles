require('plugins')

-- require('defaults2')
local opt = vim.opt

-- 2 moving around, searching and patterns
opt.incsearch = true      -- ignore case when using a search pattern
opt.smartcase = true      -- override 'ignorecase' when pattern has upper case characters

-- 5 syntax, highlighting and spelling
opt.background = 'dark'  -- the background color brightness
opt.termguicolors = true  -- use GUI colors for the terminal

-- 8 terminal
opt.title = true          -- show info in the window title

-- 9 using the mouse
opt.mouse = 'nv'          -- list of flags for using the mouse

-- 13 editing text
opt.showmatch = true      -- when inserting a bracket, briefly jump to its match

-- 14 tabs and indenting
opt.tabstop = 2           -- number of spaces a <Tab> in the text stands for
opt.shiftwidth = 2        -- number of spaces used for each step of (auto)indent
opt.softtabstop = 2       -- number of spaces to insert for a <Tab>
opt.shiftround = true     -- round to 'shiftwidth' for "<<" and ">>"
opt.expandtab = true      -- expand <Tab> to spaces in Insert mode

-- 22 running make and jumping to errors
if vim.fn.executable('rg') == 1 then
	opt.grepprg = 'rg --vimgrep'
end

-- 25 various
opt.pyxversion = 3        -- whether to use Python 2 or 3

vim.cmd('colorscheme solarized8_flat')

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lualine_settings')
require('Comment').setup()
require('gitsigns_settings')
require('telescope_settings')
require('treesitter_settings')
require('lsp_settings')
require('cmp_settings')
