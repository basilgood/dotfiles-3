"#####deinの設定#####
if &compatible
    set nocompatible
endif

let g:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = g:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(g:dein_dir)
    let s:toml = g:dein_dir . '/dein.toml'
    let s:lazy_toml = g:dein_dir . '/dein_lazy.toml'

    call dein#begin(expand('~/.vim/dein'), [$MYVIMRC,s:toml])

    " TOMLファイルにpluginを記述
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

" 未インストールを確認
if dein#check_install()
    call dein#install()
endif

" ---------------------------------------------------------------- dein

"#####neocomplete#####
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_close_preview = 0
set completeopt-=preview
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

" key-mapping
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><CR> pumvisible() ? "\<C-y>": "\<CR>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

"#####Unite.vim#####
nnoremap [unite] <Nop>
nmap <Space>f [unite]
nnoremap <silent> [unite]f :Unite<Space>file<CR>
nnoremap <silent> [unite]n :Unite<Space>file/new<CR>

filetype plugin indent on

"#####初期設定#####
syntax on "コードの色分け
" colorscheme solarized " カラースキーム

"#####表示設定#####
set autoindent "新しい行のインデントを現在行と同じにする
set expandtab "タブで挿入する文字をスペースに
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set tabstop=4 "インデントをスペース4つ分に設定
set shiftwidth=4 "自動インデントの幅
set smartindent "オートインデント
set smarttab "新しい行を作った時に高度な自動インデント
set clipboard=unnamed,autoselect "OSのクリッポボードと連携
set matchpairs& matchpairs+=<:> "対応カッコに＜＞を追加
set backspace=eol,indent,start

"#####キーバインド#####
"ここをコピれば、他のキーバインドにも対応出来る
noremap <Space>j <Esc>
noremap <Space>o o<Esc>
noremap <Space>p o<Esc>p
noremap <Space>h ^
noremap <Space>l $

"#####余計なファイル設定#####
set noswapfile "スワップファイルを作らない
set nobackup "バックアップを作成しない
set viminfo= "viminfoを作成しない

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

" -----------------------jedi.vim設定-----
"  pyenvとの連携
" if jedi#init_python()
 "  function! s:jedi_auto_force_py_version() abort
 "  let major_version = pyenv#python#get_internal_major_version()
 "    call jedi#force_py_version(major_version)
 "  endfunction
 "  augroup vim-pyenv-custom-augroup
   "  autocmd! *
 "    autocmd User vim-pyenv-activate-post call s:jedi_auto_force_py_version()
  "   autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
 "  augroup END
" endif
" neocompleteとの連携
" autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
" let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
" if !exists('g:neocomplete#force_omni_input_patterns')
    " let g:neocomplete#force_omni_input_patterns = {}
" endif

" lightline設定
set laststatus=2
set t_Co=2566
