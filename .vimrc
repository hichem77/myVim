set nocompatible             			 " be iMproved, required

so ~/.vim/plugins.vim              
syntax enable

set backspace=indent,eol,start                  "Make backspace behave like every other editor.
let mapleader = ','                            	"The default is \, but comma is better.
set nonumber                                    "Let's activate lin numbers.
set noerrorbells visualbell t_vb=
set autowriteall                                "Automatically write the file when switching buffers
set complete=.,w,b,u  				"Set our desired autocompletion
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4


"------------------Visuals-----------------"
colorscheme xoria256
set t_Co=256
set guifont=Inconsolata-dz\ 11
set guioptions-=e
set linespace=12

set guioptions-=l                                "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R

"We'll fake a custom left padding for each window
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg

"Get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg

"------------------Search-----------------"
set hlsearch
set incsearch



"------------------Split Management-----------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>



"------------------Mappings-----------------"

"Make it easy to edit the vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/<cr>
"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle.
nmap <<A-&> :NERDTreeToggle<cr>

nmap<c-R> :CtrlPBufTag<cr>
nmap<c-e> :CtrlPMRUFiles<cr>

"------------------Laravel-Specific-----------------"
nmap <Leader>lr :e routes/web.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :e app/<cr>
nmap <Leader><Leader>v :e resources/views/<cr>



"------------------Plugins-------------------"
"/
"/ Ctrlp
"/
let  g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'


"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0



"/
"/pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>


"/
"/ Ultisnips
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"------------------Auto-Commands-----------------"

"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>


"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-line-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\ -f2-" }


" Notes and Tips
" - Press 'zz' to instantly center the line where the cursor is located.
