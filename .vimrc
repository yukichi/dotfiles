syntax enable

set number
set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set incsearch
set hlsearch
set nowrap
set showmatch
set whichwrap=h,l
set wrapscan
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

" GUI options
 if has("gui_running")
 colorscheme blue
 endif


nnoremap ;  :
nnoremap :  ;
vnoremap ;  :
vnoremap :  ;

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" カーソル前の削除
"inoremap <silent> <C-h> <C-g>u<C-h>
" カーソル後の文字削除
inoremap <silent> <C-d> <Del>
" カーソルから行末まで削除
inoremap <silent> <C-d>0 <Esc>lc$
" カーソルから行頭までヤンク
inoremap <silent> <C-y>e <Esc>ly0<Insert>
" カーソルから行末までヤンク
inoremap <silent> <C-y>0 <Esc>ly$<Insert>
" カーソルの下の行に空白
inoremap <silent> <C-o> <Esc>o<Insert>
" カーソルの上の行に空白
inoremap <silent> <C-S-O> <Esc>O<Insert>

function! s:search_forward_p()
  return exists('v:searchforward') ? v:searchforward : 1
endfunction


"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
"プラグインインストールディレクトリを指定
endif
" " neobundle自体をneobundleで管理
"" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
"call neobundle#end()

NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'kannokanno/previm'
NeoBundle 'parkr/vim-jekyll'
NeoBundle 'elzr/vim-json'
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
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mattn/jscomplete-vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }



"" Required:
filetype plugin indent on
"" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
"" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
""-------------------------
"" End Neobundle Settings.
""-------------------------
"
au BufRead,BufNewFile *.md set filetype=markdown


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

" Goに関する設定
  " :Fmt などで gofmt の代わりに goimports を使う
  let g:gofmt_command = 'goimports'

  " Go に付属の plugin と gocode を有効にする
  set rtp^=${GOROOT}/misc/vim
  set rtp^=${GOPATH}/src/github.com/nsf/gocode/vim

  " 保存時に :Fmt する
  au BufWritePre *.go Fmt
  au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 filetype=go
  au FileType go compiler go

 "emmet
"autocmd FileType html imap <buffer><expr><tab>
"    \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
"        \ "\<tab>"
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
            \    'lang' : 'ja',
                        \    'indentation' : '  ',
                                    \}
autocmd FileType html,css EmmetInstall

autocmd FileType javascript
  \ :setl omnifunc=jscomplete#CompleteJS

let g:syntastic_mode_map = { 'mode': 'passive',
      \ 'active_filetypes': ['html', 'ruby', 'javascript'],
      \ 'passive_filetypes': [] }

" vimfiler and quicl look
let g:vimfiler_quick_look_command = 'qlmanage -p'
autocmd FileType vimfiler nmap <buffer> V <Plug>(vimfiler_quick_look)

if &term =~ "xterm"
  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>
endif
