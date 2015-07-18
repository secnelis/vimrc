execute pathogen#infect()
set nocompatible
filetype plugin on
map <C-n> :NERDTreeToggle<CR>

syntax enable
set t_Co=16
set background=dark
colorscheme solarized
"colorscheme Tomorrow-Night

set number
set autoindent
set smartindent
set showmatch
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set cursorline

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrnl
set colorcolumn=85

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

au FocusLost * :wa

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

inoremap jj <ESC>

nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

function! Highlight_remove_attr(attr)
        " save selection registers
        new
        silent! put

        " get current highlight configuration
        redir @x
        silent! highlight
        redir END
        " open temp buffer
        new
        " paste in
        silent! put x

        " convert to vim syntax (from Mkcolorscheme.vim,
        "   http://vim.sourceforge.net/scripts/script.php?script_id=85)
        " delete empty,"links" and "cleared" lines
        silent! g/^$\| links \| cleared/d
        " join any lines wrapped by the highlight command output
        silent! %s/\n \+/ /
        " remove the xxx's
        silent! %s/ xxx / /
        " add highlight commands
        silent! %s/^/highlight /
        " protect spaces in some font names
        silent! %s/font=\(.*\)/font='\1'/

        " substitute bold with "NONE"
        execute 'silent! %s/' . a:attr . '\([\w,]*\)/NONE\1/geI'
        " yank entire buffer
        normal ggVG
        " copy
        silent! normal "xy
        " run
        execute @x

        " remove temp buffer
        bwipeout!

        " restore selection registers
        silent! normal ggVGy
        bwipeout!
endfunction
"autocmd BufNewFile,BufRead * call Highlight_remove_attr("bold")

