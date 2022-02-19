local cmd = vim.cmd
cmd([[
set termguicolors
colorscheme dracula
set background=dark
let g:dracula_colorterm = 0
let g:dracula_italic = 1
"" some color scehemes do not have LSP diagnostics highlighting or are changed
"" by the color scehems. Then, add this line
autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() 
]])
