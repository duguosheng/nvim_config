"  ____   ____ ____  _      __     ___           
" |  _ \ / ___/ ___|( )___  \ \   / (_)_ __ ___  
" | | | | |  _\___ \|// __|  \ \ / /| | '_ ` _ \ 
" | |_| | |_| |___) | \__ \   \ V / | | | | | | |
" |____/ \____|____/  |___/    \_/  |_|_| |_| |_|
" 


" ===
" === 自动下载插件管理器
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====================
" === Editor Setup ===
" ====================

" ===
" === 系统配置
" ===
" 去除vi一致性
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" 普通和可视模式允许使用鼠标
set mouse=nv
" 编码设置
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,latin1
set fileencoding=utf-8
let &t_ut=''
set autochdir


" ===
" === Editor behavior
" ===
"set shell=bash
set number
"set relativenumber
set cursorline
set expandtab
" 自动写入
" set autowrite
set updatetime=2000
" tab键指定4个空格
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
" 在光标到达屏幕顶部和底部总留有5行
set scrolloff=5
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
" set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
exec "nohlsearch"
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
" 再次进入文件仍然可以记住上次的修改
"silent !mkdir -p ~/.config/nvim/tmp/backup
"silent !mkdir -p ~/.config/nvim/tmp/undo
"set backupdir=~/.config/nvim/tmp/backup,.
"set directory=~/.config/nvim/tmp/backup,.
"if has('persistent_undo')
"  set undofile
"  set undodir=~/.config/nvim/tmp/undo,.
"endif

" 不同模式下光标不同
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === 基本映射
" ===
let mapleader="`"
map ; :

" 保存和退出
map Q :q<CR>
map W :w<CR>

" 快速到行首行尾
noremap H 0
noremap L $

noremap J 5j
noremap K 5k

" 快速切换源文件和头文件
noremap <C-a>  :w<CR>:A<CR>
noremap <C-z>  :AV<CR>

" 直接打开配置文件
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
" 更新配置文件
map SM :source $MYVIMRC<CR>

" 打开导航菜单
noremap <LEADER>st :Startify<CR>

" Undo in Insert mode
" inoremap <C-l> <C-u>

" 中文符号统一为英文符号
inoremap × *
inoremap ～ ~
inoremap （ (
inoremap ） )
inoremap ！ !
inoremap · [
inoremap 「 ]
inoremap “ "
inoremap ” "


" 复制到系统剪切版，需要安装xclip
" vnoremap <C-c> :w !xclip -i -sel c<CR><CR>
vnoremap <C-c> "+y
" 从系统剪切版粘贴
" inoremap <C-v> <Esc>:call setreg("\"",system("xclip -o -sel c"))<CR>pa
inoremap <C-v> <Esc>"+pA

" 查找
" 取消高亮
noremap <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz

" 折叠
" map <silent> <LEADER>o za

" ===
" === 分屏下切屏
" ===
" 使用 空格+方向 移动
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

" 取消s功能
noremap s <nop>

" 分屏指令
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
map <C-up> :res +1<CR>
map <C-down> :res -1<CR>
map <C-left> :vertical resize-1<CR>
map <C-right> :vertical resize+1<CR>

" 切换分屏为上下
noremap sn <C-w>t<C-w>K
" 切换分屏为左右
noremap sv <C-w>t<C-w>H

" 旋转屏幕
noremap srn <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H


" ===
" === 标签管理
" ===
" 新建标签
map tn :tabe<CR>
" Move around tabs with tn and ti
map tj :-tabnext<CR>
map tk :+tabnext<CR>
map tt :tabNext<CR>
map tq :tabclose<CR>

" Move the tabs with tmn and tmi
map tmn :-tabmove<CR>
map tmi :+tabmove<CR>


" ===
" === markdown快捷键位
" ===
source ~/.config/nvim/keyofmd.vim


" ===
" === Other useful stuff
" ===

" 打开终端
noremap <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>i

" 寻找下一个<++>
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" 拼写检查
noremap <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

imap <C-c> <Esc>zza
nmap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" 编辑艺术字
noremap <LEADER>fg :r !figlet

" 编写makefile
noremap <LEADER>m :e makefile<CR>
" <F5>编译执行文件
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!rm ./%<"
    "exec "!clang -g % -o %<"
    exec "!make %<"
    exec "! ./%<"
  elseif &filetype == 'cpp'
    exec "!rm ./%<"
    "exec "!clang++ -g % -o %<"
    exec "!make %<"
    exec "! ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitright
    ":vsp
    ":vertical resize-10
    :sp
    :term python3 %
  elseif &filetype == 'html'
    exec "!google-chrome-stable % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  endif
endfunc

" working on it...
map <F8> :call CompileBuildrrr()<CR>
func! CompileBuildrrr()
  exec "w"
  if &filetype == 'markdown'
    exec "echo"
  elseif &filetype == 'c'
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
  endif
endfunc


" ===
" === Vim-Plug管理插件
" ===
call plug#begin('~/.config/nvim/plugged')

" 美化
Plug 'itchyny/lightline.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'lifepillar/vim-colortemplate'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'rbgrouleff/bclose.vim'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 代码片段
Plug 'honza/vim-snippets'

" Auto Save
Plug '907th/vim-auto-save'

" Other visual enhancement
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'

" Git
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'godlygeek/tabular'  " 表格
"Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/a.vim'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'


" 自动切换输入法(普通模式英文，插入模式返回原来的输入法)
Plug 'rlue/vim-barbaric'

" 代码排版
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'

" 模糊查找
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" 语法高亮
Plug 'sheerun/vim-polyglot'

" 彩虹括号
Plug 'luochen1990/rainbow'

" 更改括号
Plug 'tpope/vim-surround'

" 插件命令重复
Plug 'tpope/vim-repeat'
call plug#end()

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
  let has_machine_specific_file = 0
  silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim


" ===
" === Dress up my vim
" ===
" Range:   233 (darkest) ~ 238 (lightest)
" Default: 235
let g:space_vim_dark_background = 235
color space-vim-dark
set termguicolors
hi LineNr ctermbg=NONE guibg=NONE
colorscheme space-vim-dark
hi Comment cterm=italic
" 以下三行使背景透明
"hi Normal     ctermbg=NONE guibg=NONE
"hi LineNr     ctermbg=NONE guibg=NONE
"hi SignColumn ctermbg=NONE guibg=NONE


" ================ Start of Plugin Settings =================


" ===
" === Lightline
" ===
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ 'mode_map': {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'VL',
      \ "\<C-v>": 'VB',
      \ 'c' : 'C',
      \ 's' : 'S',
      \ 'S' : 'SL',
      \ "\<C-s>": 'SB',
      \ 't': 'T',
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v%<',
      \ },
      \ }
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" ===
" === NERDTree
" ===
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" ===
" === coc
" ===
source ~/.config/nvim/coc_config.vim

" ===
" === vim-auto-save
" ===
let g:auto_save = 1 " 在Vim启动时启用自动保存
let g:auto_save_events = ["CursorHold"]   "InsertLeave TextChanged, TextChangedI 在离开插入模式和文本更改时自动保存
let g:auto_save_write_all_buffers = 1  " write all open buffers as if you would use :wa
let g:auto_save_silent = 1  " 不提示保存信息

" ===
" === indentLine
" ===
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_term = 238
let g:indentLine_color_gui = '#333333'
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'google-chrome-stable'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0

" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>

" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableFormat<CR>

" ===
" === FZF
" ===
map <C-p> :FZF<CR>


" Startify
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

"clang-format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}
"autocmd FileType c,cpp,h ClangFormatAutoEnable
"let g:clang_format#auto_format_on_insert_leave=1
let g:clang_format#auto_format=1

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
"llvm, google, chromium, mozilla ,WebKit is supported
let g:clang_format#code_style='chromium'


" 语法高亮
"c/c++
let g:cpp_no_function_highlight = 1
"markdown
let g:vim_markdown_folding_disabled = 1 " 禁用折叠
let g:vim_markdown_conceal = 0 " 禁用隐藏
let g:vim_markdown_auto_insert_bullets = 0 " 禁用自动插入项目符号
let g:vim_markdown_new_list_item_indent = 0 " 返回缩进
let g:vim_markdown_edit_url_in = 'vsplit'
let g:vim_markdown_autowrite = 1 " 跟随连接时自动写入
let g:vim_markdown_fenced_languages = ['csharp=cs', 'C=c', 'C++=cpp', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']

" 彩虹括号
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

" vim-surround
" cs'" 将'改为"
" ds' 删除'
" ysiw( 将一个单词括起来
" yss( 将一行括起来

" vim-reapeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
"===================== End of Plugin Settings =====================

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
  exec "e ~/.config/nvim/_machine_specific.vim"
endif

