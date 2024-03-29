call plug#begin(stdpath('data') . '/plugged')
    Plug 'numToStr/Comment.nvim'
	Plug 'reedes/vim-pencil'
	Plug 'stevearc/vim-arduino'
	Plug 'sonph/onehalf', { 'rtp' : 'vim' }
	Plug 'itchyny/vim-gitbranch'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ap/vim-buftabline'
    Plug 'chaoren/vim-wordmotion'
"	Plug 'kshenoy/vim-signature'
call plug#end()

lua require('Comment').setup()

let g:pyindent_open_paren=shiftwidth()
let g:netrw_banner=0
let g:buftabline_show=1
" indents
set smartindent
set expandtab
set breakindent
set shiftwidth=4
set tabstop=4

" -------- visuals ----------
set relativenumber
set number
set scrolloff=999
set cursorline
set list
set listchars=lead:·,trail:·,tab:>·
" alternatively this is uncommented and we have light theme
colorscheme onehalflight


set mouse=a

" statusline stuff
set statusline=
set statusline+=\ %{gitbranch#name()}\ 
set statusline+=%#LineNr#
set statusline+=%1*\ %<%F\ %m%r%h%w\ 
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ \[%{&fileencoding?&fileencoding:&encoding}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
" end statusline

nnoremap H :bprev<CR>
nnoremap L :bnext<CR>

" do an operator on every line in the file (daG, yaG, =aG)
xnoremap aG ggoG
onoremap aG :normal VaG<cr>

" move lines
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" -------- leader kommandoer -----------
let mapleader=" "

" clipboard
nnoremap <leader>p "+p
nnoremap <leader>y "+y

nnoremap <Enter> :noh<CR>


" schmoovement


" move mellom tabs
" aapne tabs og splits
nnoremap <leader>t :tabnew 
nnoremap <leader>v :vsplit 
" replace alt som ble soekt paa sist
nnoremap <leader>s :%s///g<Left><Left>
" bedre shift yank
map Y y$
" format python
nnoremap <leader>b :!bibtex %<<CR>
" make print(x) into print(f"{x=}")
nnoremap <leader>f 0f(af"{<ESC>$i=}"<ESC>
nnoremap <leader>m :delmarks!<CR>
nnoremap <leader>z :!zathura %<.pdf & <CR><CR>

" go to the position I was when last editing the file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif


set undodir=$XDG_DATA_HOME/nvim/undo_dir
set undofile

" ------------ COC ---------------- "
" random things that need to be set for coc to work maybe
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=number
set signcolumn=yes

" tab completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" part of tab completion
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col-1] =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)

" Use ? to show documentation in preview window.
nnoremap <silent> ? :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" ---------- end COC -------------




" ----------- vimwiki -------------
let g:vimwiki_list = [{ 'path': '~/dnd_wiki/wiki', 'path_html': '~/dnd_wiki/html', 'auto_export': 1, 'auto_toc': 1, 'links_space_char': '_', 'syntax': 'default' }]
hi VimwikiLink ctermfg=blue
let g:vimwiki_global_ext = 0


" get highlight group of cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc



autocmd FileType python command! Main execute "normal! idef main():<CR><CR><BS>if __name__ == '__main__':<CR>main()<ESC>gg$"
autocmd FileType c command! Main execute "normal! i#include <stdlib.h><CR><CR>void main() {<CR>}<ESC>k$"
""""""""""""" Her maa de legges til conditional execution --------------

" build stuff

" ------- python --------
autocmd FileType python map <buffer> <C-b> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <C-b> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" pyright sucks at diagnostics
autocmd FileType python let b:coc_diagnostic_disable=1

" ------- latex ---------
autocmd FileType tex map <buffer> <C-b> :w<CR>:exec '!pdflatex %'<CR>
autocmd FileType tex imap <buffer> <C-b> <esc>:w<CR>:exec '!pdflatex %'<CR>

" --------- C -----------
autocmd FileType c map <buffer> <C-b> :w<CR>:!gcc -g -Wall -Wextra -std=gnu11 % -o %< && ./%<<CR>
autocmd FileType c imap <buffer> <C-b> <esc> :w<CR>:!gcc -g -Wall -Wextra -std=gnu11 % -o %< && ./%<<CR>

" --------- C++ ---------
autocmd FileType cpp map <buffer> <C-b> :w<CR>:!g++ % && ./a.out<CR>
autocmd FileType cpp imap <buffer> <C-b> <esc> :w<CR>:!g++ % -o %< && ./%<<CR>

" -------- Java ---------
autocmd FileType java map <buffer> <C-b> :w<CR>:exec '!javac *.java && java %<'<CR>
autocmd FileType java imap <buffer> <C-b> <esc> :w<CR>:!javac *.java && java %<<CR>

" -------- VHDL ---------
autocmd FileType vhdl set expandtab
autocmd FileType vhdl set shiftwidth=2


" ------ markdown --------
let g:pencil#wrapModeDefault = 'soft'

autocmd FileType markdown call pencil#init()
autocmd FileType markdown map <buffer> <C-b> :w<CR>:exec '!pandoc % -o %<.pdf'<CR>
autocmd FileType tex imap <buffer> <C-b> <esc>:w<CR>:exec '!pandoc % -o %<.pdf'<CR>



" Remote files
autocmd BufRead scp://* set cmdheight=2 " this is to stop stupid confirmation message



autocmd FileType text call pencil#init()

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
