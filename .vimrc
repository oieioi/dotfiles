" key
let g:python3_host_prog = expand('/Users/koike/.pyenv/shims/python3')

"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=/Users/koike/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/koike/.cache/dein')
  call dein#begin('/Users/koike/.cache/dein')
  call dein#add('/Users/koike/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neoyank.vim')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('haya14busa/vim-migemo')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('maxmellon/vim-jsx-pretty')
  call dein#add('othree/es.next.syntax.vim')
  call dein#add('othree/javascript-libraries-syntax.vim')
  call dein#add('othree/yajs.vim')
  call dein#add('rhysd/ghpr-blame.vim')
  call dein#add('rhysd/migemo-search.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/syntastic')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-surround')
  call dein#add('vim-jp/vimdoc-ja')
  call dein#add('vim-scripts/Align')
  call dein#add('vim-scripts/L9')

  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

nnoremap <Space>h ^
nnoremap <Space>l $
nnoremap <Space>a A
nnoremap <Space>i I
" シンタックス
syntax on
" 行番号
set number
" ファイル名表示
set title
" <Tab>でwhitespae
set tabstop=2
" <Tab>でwhitespace
set smarttab
" インデント
set shiftwidth=2
" tabで半角スペース
set expandtab
" 前の行のインデントを引き継ぐ
set autoindent
" autoindentより賢いインデント
set smartindent
" 大文字小文字区別なし
set ignorecase
" 大文字がある場合は区別する
set smartcase
" 最後まで行ったら最初に
"set wrapscan
" 対応するカッコの強調
set showmatch
" 不可視文字の可視化
set list
set listchars=tab:»-,trail:-,eol:$,extends:»,precedes:«,nbsp:%
" 行末スペース可視
if has("syntax")
  " PODバグ対策
  syn sync fromstart

  function! ActivateInvisibleIndicator()
    syntax match InvisibleJISX0208Space "　" display containedin=ALL
    highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
  endfunction

  augroup invisible
    autocmd! invisible
    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
  augroup END
endif

" 新しいタブをしたに開く
set splitbelow
" 新しいタブを右に開く
set splitright
" 行をまたいでカーソル移動
set whichwrap=b,s,h,l,<,>,[,],~
" コマンド表示
set showcmd
" 表示ライン
set nocursorline
" Insert modeのときカーソルの形状をかえる
let &t_SI.="\e[6 q"
let &t_EI.="\e[2 q"
" カーソル形状がすぐに元に戻らないのでタイムアウト時間を調整
set ttimeoutlen=10
" 挿入モードを抜けた時にカーソルが見えなくなる現象対策(なぜかこれで治る)
inoremap <ESC> <ESC>
" 折り返ししない
"set nowrap
" 検索ハイライト
set hlsearch
" インクリメントサーチ
set incsearch
" CTRL-A で数を増やす時常に十進数にする
set nrformats=
" helpを日本語化する
" https:://github.com/vim-jp/vimdoc-ja/wiki
"set runtimepath+=/Users/koike/Documents/vimdoc-ja-master
"helptags /Users/koike/Documents/vimdoc-ja-master/doc
set helplang=ja,en
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
au BufRead,BufNewFile,BufReadPre *.js.erb   set filetype=javascript
" coffeescriptインデントを設定
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et

set foldmethod=syntax
let ruby_fold=1
set foldlevel=100

" カラースキーマ
colorscheme monokain

" migemo ローマ字->日本語サーチ
if executable('cmigemo')
  cnoremap <expr><CR> migemosearch#replace_search_word()."\<CR>"
endif

" Denite -------------------------------
let g:deite_enable_start_insert=1
call denite#custom#source(
      \ 'file_rec', 'matchers', ['matcher_ignore_globs'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [
      \ 'tmp/',
      \ '.git/',
      \ 'images/',
      \ 'img/',
      \ 'node_modules/'])

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])
call denite#custom#map('insert', "<C-n>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-p>", '<denite:move_to_previous_line>')

nnoremap <silent> ,uy :<C-u>Denite neoyank<CR>
nnoremap <silent> ,ub :<C-u>Denite buffer<CR>
nnoremap <silent> ,uf :<C-u>DeniteBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,uu :<C-u>Denite file_mru buffer<CR>
nnoremap <silent> ,uh :<C-u>Denite `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
" end Denite -------------------------------
