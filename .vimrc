" PATHの自動更新関数
" | 指定された path が $PATH に存在せず、ディレクトリとして存在している場合
" | のみ $PATH に加える
function! IncludePath(path)
  " define delimiter depends on platform
  if has('win16') || has('win32') || has('win64')
    let delimiter = ";"
  else
    let delimiter = ":"
  endif
  let pathlist = split($PATH, delimiter)
  if isdirectory(a:path) && index(pathlist, a:path) == -1
    let $PATH=a:path.delimiter.$PATH
  endif
endfunction


"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/masakikozuki/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/masakikozuki/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
" jedi-vimを追加
NeoBundle 'davidhalter/jedi-vim'
" markdownの設定
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" pyenv処理用にvim-pyenvを追加
NeoBundleLazy "lambdalisue/vim-pyenv", {
        \ "depends":['davidhalter/jedi-vim'],
        \ "autoload":{
        \   "filetypes":["python", "python3"]
        \   }}

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

"-------------------
"" vim settings
"-------------------
"" Theme
syntax enable
set background=dark
colorscheme molokai 

"" 新しい行のインデントを現在の行と同じにする
set autoindent

" バックアップのディレクトリを指定する
set backupdir=$HOME/.vim/backup

" vi互換をオフにする
set nocompatible

" 不可視文字を表示
set list

" スワップファイル用のディレクトリを指定する
set directory=$HOME/.vim/backup

" タブの代わりに空白文字を指定する
set expandtab

" タブ幅の指定
set tabstop=4

" 行番号を表示する
set number

" 閉じ括弧が入力された時に対応する括弧を強調する
set showmatch

" 新しい行で高度な自動インデント
set smarttab

" C++ 補完
let g:cpp_class_scope_highlight=1
let g:cpp_experimental_simple_template_highlight=1
let g:cpp_experimental_template_highlight=1
let g:cpp_concepts_highlight=1
let c_no_curly_error=1

" To use vim-pyenv with jedi-vim
if jedi#init_python()
        function! s:jedi_auto_force_py_version() abort
                let major_version = pyenv#python#get_internal_version()
                call jedi#force_py_version(major_version)
        endfunction
        augroup vim-pyenv-custom-augroup
                autocmd! *
                autocmd User vim-pyenv-activate-post call s:jedi_auto_force_py_version()
                autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
        augroup end
endif

" vim-goの設定
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>i <Plug>(go-info)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go :highlight goErr cterm=bold ctermfg=214
au FileType go :match goErr /\<err\>/

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 1

let g:neocomplete#sources#dictionary#dictionaries = {
\   'ruby':$HOME . '/dicts/ruby.dict',
\ }

" .mdファイルに対応できるように
au BufRead, BufNewFile *.md set filetype=markdown
