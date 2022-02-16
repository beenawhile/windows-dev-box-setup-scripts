"         
" ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
" ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
" ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
" ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
" 
"         @beenawhile
"
" Plugins
call plug#begin('~/.vim/plugged')

" NerdeTree Plugins
Plug 'preservim/nerdtree' " NerdTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " NerdTree highlight
Plug 'Xuyuanp/nerdtree-git-plugin' " NerdTree git plugin
Plug 'ryanoasis/vim-devicons' " Developer Icons

" File and folder management
Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'ap/vim-css-color' " CSS Color Previesw
Plug 'vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' " Status bar themes
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language Support
Plug 'neoclide/coc.nvim'  " Auto Completion

" Flutter & Dart
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'

" Theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Tmux
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

let mapleader = ' '

:set encoding=UTF-8

:set number
:set relativenumber
:set ai " auto indent
:set si " smart indent
:set tabstop=2 " 2 blank for tab
:set shiftwidth=2 " 2 blank for shift
:set smarttab
:set title " show title
:set showmatch " show match parenthesis
:set wmnu " show list for auto complete
:set nowrap " disable auto line-change
:set ignorecase
:set hlsearch
:set expandtab " always uses spaces instead of tab characters
:set background=dark
:set fileencodings=utf-8,euc-kr
:set bs=indent,eol,start " enable backspace
:set history=1000
:set ruler
:set nobackup
:set mouse=a " enable mouse
:set splitright
:set splitbelow
:set noswapfile " make no swapfile
:set nobackup

" Make it obvious where 120 characters are
set textwidth=120
set colorcolumn=+1
set colorcolumn=120
highlight ColorColumn guibg=#181818

" Colors {{{
if (has("termguicolors"))
  set termguicolors " enable true colors support
endif
let g:dracula_colorterm = 0
let g:dracula_italic = 1
colorscheme dracula


" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

inoremap jk <ESC>
inoremap kj <ESC>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')


:set completeopt-=preview " For No Previews


let g:NERDTreeIgnore = ['^node_modules$']


nnoremap <leader>fe :CocCommand flutter.emulators <CR>
nnoremap <leader>fd :below new output:///flutter-dev <CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Snippets Shortcuts
imap <tab> <Plug>(coc-snippets-expand)
let g:UltiSnipsExpandTrigger = '<Nop>'
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)


" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-json', 
  \ 'coc-pairs',
  \ 'coc-yaml',
  \ 'coc-flutter',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ ]

" Dart settings
let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']
let g:lsc_auto_map = v:true " lsp settings
let g:dart_style_guide = 2 " enable dart style guide syntax 2 space indentation
let dart_html_in_string=v:true " enable HTML syntax highlight

" Dart formatter
nnoremap <leader>df :DartFmt<cr>

let g:NERDTreeGitStatusWithFlags = 1

