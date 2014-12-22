syntax enable

set paste
set number
set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set incsearch
set hlsearch
set nowrap
set showmatch
set whichwrap=h,l
set nowrapscan
set ignorecase
set smartcase
set hidden
set history=2000
set autoindent
set expandtab
set tabstop=4
set shiftwidth=2
set helplang=ja
set guifont=Ricty_Diminished_Regular:h18

colorscheme hybrid


nnoremap ;  :
nnoremap :  ;
vnoremap ;  :
vnoremap :  ;

function! s:search_forward_p()
  return exists('v:searchforward') ? v:searchforward : 1
endfunction


"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim.git/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
"プラグインインストールディレクトリを指定
endif
" " neobundle自体をneobundleで管理
"" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
"call neobundle#end()

NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'
let g:vim_markdown_folding_disabled=1
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-rails'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mattn/emmet-vim'


"" Required:
filetype plugin indent on
"" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
"" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
""-------------------------
"" End Neobundle Settings.
""-------------------------
"
"NeoBundle ‘plasticboy/vim-markdown'
"NeoBundle ‘kannokanno/previm'
"NeoBundle ‘tyru/open-browser.vim'
"
au BufRead,BufNewFile *.md set filetype=markdown


" Vundle setting
"set nocompatible              " be iMproved, required
"filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" markdown plugins
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" File Explore tree view
let g:netrw_liststyle = 3

" Unite.vim
" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
"let g:unite_enable_start_insert=1
call unite#custom#profile('default', 'context', {
      \   'start_insert': 0,
      \   'prompt_direction': 'top',
      \   'split' : 1,
      \})

" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" airline
 let g:airline_enable_branch = 1
  let g:airline_section_b = "%t %M"
  let g:airline_section_c = ''
  let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
  let g:airline_section_x =
        \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
        \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
        \ "%{strlen(&filetype)?&filetype:'no ft'}"
  let g:airline_section_y = '%3p%%'
  let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline_enable_fugitive=1
  set laststatus =2 

  " :Fmt などで gofmt の代わりに goimports を使う
  let g:gofmt_command = 'goimports'

  " Go に付属の plugin と gocode を有効にする
  set rtp^=${GOROOT}/misc/vim
  set rtp^=${GOPATH}/src/github.com/nsf/gocode/vim

  " 保存時に :Fmt する
  au BufWritePre *.go Fmt
  au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 filetype=go
  au FileType go compiler go

" GUI options
 if has("gui_running")
 colorscheme blue
 endif

 "emmet
 let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
  let g:user_emmet_settings = { 'lang' : 'ja' }
