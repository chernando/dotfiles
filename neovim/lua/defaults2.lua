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

