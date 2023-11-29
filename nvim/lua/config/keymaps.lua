-- Split window
vim.api.nvim_set_keymap('n', 'ss', ':split<Return><C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sv', ':vsplit<Return>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'st', ':tabnew<Return>', { noremap = true, silent = true })

-- Remap keys
vim.api.nvim_set_keymap('n', '<S-h>', '^', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-l>', '$', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-k>', '{', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-j>', '}', { noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', '<C-w><<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<C-w>><CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', '<C-w>+<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', '<C-w>-<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-o>', '<C-o>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-[>', '<C-\\><C-n>', { noremap = true })
vim.g.mapleader = " "

-- Move windows
vim.api.nvim_set_keymap('n', 'sh', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', 'sk', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', 'sj', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', 'sl', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-i>', '<C-i>', { noremap = true })

-- Switch tabs
vim.api.nvim_set_keymap('n', '<S-Tab>', ':-tabnext<Return>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', ':tabnext<Return>', { noremap = true, silent = true })

-- Set cmdheight
vim.o.cmdheight = 1

-- Use Terminal shortcut
vim.cmd([[
  autocmd TermOpen * startinsert
  function! s:Openterm() abort
    let w = winwidth(win_getid())
    let h = winheight(win_getid()) * 2.1
    if h > w
      exe 'split'
      exe 'term'
    else
      exe 'vsplit'
      exe 'term'
    endif
  endfunction
  nmap <silent> tt :<C-u>silent call <SID>Openterm()<CR>
]])
