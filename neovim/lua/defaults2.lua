local opt = vim.opt

-- https://github.com/neovim/neovim/issues/6289

opt.hidden = true
opt.joinspaces = false
opt.viewoptions:remove('options')
opt.switchbuf = 'uselast'
opt.sessionoptions:append({ 'unix', 'slash' })
opt.fillchars = { vert = '│', fold = '·' }
opt.inccommand = 'nosplit'
opt.pumblend = 20

vim.cmd [[
:augroup last-position-jump
:    au!
:    au BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ |   exe "normal! zz"
        \ | endif
:augroup END
]]

-- inoremap <C-U> <C-G>u<C-U>
-- nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
vim.api.nvim_set_keymap('n', 'Y', 'y$', {})
-- nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<CR><C-L>
-- inoremap <C-U> <C-G>u<C-U>
-- inoremap <C-W> <C-G>u<C-W>
