local cmd = vim.cmd
-- local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'
-- utils.opt('b','expandtab',true)
-- utils.opt('b','shiftwidth',indent)
-- utils.opt('b','smartindent','true')
-- utils.opt('b','tabstop',indent)
-- utils.opt('o','hidden',true)
-- utils.opt('o','ignorecase',true)
-- utils.opt('o','scrolloff',15)
-- utils.opt('o','shiftround',true)
-- utils.opt('o','smartcase',true)
-- utils.opt('o','splitbelow',true)
-- utils.opt('o','splitright',true)
-- utils.opt('o','wildmode','list:longest')
-- utils.opt('o','textwidth',80)
vim.o.tabstop = 2
vim.o.sw = 2
vim.o.sts = 2
vim.o.textwidth = 80
vim.o.scrolloff = 15
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true

vim.api.nvim_set_keymap('n', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = true })
