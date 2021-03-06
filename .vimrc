"-------------------------------
"   Start Neobundle Settings
"-------------------------------
"bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'xsbeats/vim-blade'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" indentline
let g:indentLine_color_term =238
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '' "use ¦, ┆ or |

" VimProc
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \ 'windows' : 'make -f make_mingw32.mak',
      \ 'cygwin' : 'make -f make_cygwin.mak',
      \ 'mac' : 'make -f make_mac.mak',
      \ 'unix' : 'make -f make_unix.mak',
      \ },
      \ }


let g:lightline = {
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \ },
        \ }

function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
  
function! MyReadonly()
   return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction
    
function! MyFilename()
   return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                  \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                  \  &ft == 'unite' ? unite#get_status_string() :
                  \  &ft == 'vimshell' ? vimshell#get_status_string() :
                  \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                  \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
      
function! MyFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
              return fugitive#head()
         endif
     catch
    endtry
              return ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction
  
function! MyMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction') 



" neocomplcache
NeoBundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
" " Define dictionary.
" let g:neocomplcache_dictionary_filetype_lists = {
"     \ 'default' : ''
"         \ }
"         
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" 補完候補が表示されている場合は確定、そうでない場合は改行
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "<CR>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_pop""()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


"set: dictionary= で辞書ファイルを指定
"autocmd BufRead *.php\|*.ctp\|*.tp| :set
"set dictionary=~/.vim/dictionaries/php.dict filetype=php


call neobundle#end()

" Required:
filetype plugin indent on

" markdown
au BufRead,BufNewFile *.md set filetype=markdown

NeoBundleCheck

"--------------------------------------
"   End NeoBundle Settings
"--------------------------------------

"default settings"
set title
set lazyredraw
set ttyfast
set number
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set tabstop=4
set autoindent
set autoread
set expandtab
set shiftwidth=4
set hlsearch
set smartcase
set foldmethod=syntax
set statusline+=%<%F
set nowrap
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set t_Co=256
set background=dark
set softtabstop=4
set showmatch
set matchtime=1
set laststatus=2
set noswapfile
set mouse=a
set imdisable
set incsearch
set list
set listchars=tab:»-
set ic
hi link htmlLink Comment

"" 補完系（デフォ）
set omnifunc=phpcomplete#CompletePHP
