" key
let g:python3_host_prog = expand('/Users/koike/.pyenv/shims/python3')
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
  syntax on

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

" NeoBundle Scripts-----------------------------
if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/neobundle.vim'))
  " Let NeoBundle manage NeoBundle
  " Required:
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundle 'vim-jp/vimdoc-ja'
  " git
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'flazz/vim-colorschemes'
  NeoBundle 'scrooloose/nerdtree'
  " migemo
  NeoBundle 'haya14busa/vim-migemo'
  NeoBundle 'rhysd/migemo-search.vim'
  NeoBundle 'L9'
  if executable('cmigemo')
    cnoremap <expr><CR> migemosearch#replace_search_word()."\<CR>"
  endif
  " 構文チェック
  NeoBundle 'scrooloose/syntastic'
  " 整形ツール
  NeoBundle 'Align'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/neomru.vim'
  NeoBundle 'Shougo/neoyank.vim'
  let g:unite_enable_start_insert=1
  "let g:unite_source_history_yank_enable =1
  let g:unite_source_file_mru_limit = 200
  nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
  nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
  nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
  nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'rhysd/ghpr-blame.vim'
  NeoBundle 'Shougo/denite.nvim'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'othree/yajs.vim'
  NeoBundle 'maxmellon/vim-jsx-pretty'
  NeoBundle 'othree/javascript-libraries-syntax.vim'
  NeoBundle 'othree/es.next.syntax.vim'
  NeoBundle 'tpope/vim-rails'

  " Required:
call neobundle#end()
" Required:
filetype plugin indent on
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" カラースキーマ (NeoBundleでcolorscheme読んだ後)
colorscheme monokain

" Denite設定開始
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
nnoremap <silent> ,uh :<C-u>Denite
      \ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
call denite#custom#map('insert', "<C-n>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-p>", '<denite:move_to_previous_line>')
