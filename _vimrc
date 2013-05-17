" ************************************************************************************************
"       _     
"      (-'      .-.. .  .  . ..-- 		 
"      _\__$    `-.|\| /_\ |< |-  		 
"    (___)      `-'' ''   '' `'--
"        Version:  1.2.14
"           Date:  2012/03/12
"    Description:   _vimrc for windows .vimrc for linux
"																         .--.--. ..-.  . .  .  .-.
"																	   	 |- |- |\||-.  |-| /_\ | |
"																		 '  '--' ''-'  ' ''   '`-'	
" ************************************************************************************************
" 设置当前系统
if has("win32") || has("win32unix")
    let g:OS#name = "win"
    let g:OS#win = 1
    let g:OS#mac = 0
    let g:OS#unix = 0
elseif has("mac")
    let g:OS#name = "mac"
    let g:OS#mac = 1
    let g:OS#win = 0
    let g:OS#unix = 0
elseif has("unix")
    let g:OS#name = "unix"
    let g:OS#unix = 1
    let g:OS#win = 0
    let g:OS#mac = 0
endif
if has("gui_running")
    let g:OS#gui = 1
else
    let g:OS#gui = 0
endif


" ************************************************************************************************
"  default _vimrc
if g:OS#win
	 " MyDiff {{{
	set diffexpr=MyDiff()
	function MyDiff()
		  let opt = '-a --binary '
		  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
		  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
		  let arg1 = v:fname_in
		  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
		  let arg2 = v:fname_new
		  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
		  let arg3 = v:fname_out
		  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
		  let eq = ''
		  if $VIMRUNTIME =~ ' '
			if &sh =~ '\<cmd'
			  let cmd = '""' . $VIMRUNTIME . '\diff"'
			  let eq = '"'
			else
			  let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
			endif
		  else
			let cmd = $VIMRUNTIME . '\diff'
		  endif
		  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
	endfunction
endif

" }}}

" ****************************************** Settings *************************************** {{{
" ************************************************************************************************
"  基本设置
" ************************************************************************************************

set nocompatible            " 关闭 vi 兼容模式
syntax on                   " 自动语法高亮
"colorscheme torte           "配置颜色方案
set number                  " 显示行号
set cursorline              " 突出显示当前行
set wildmenu				 "Turn on WiLd menu 在末行命令行敲tab键时会在状态栏显示选项
set whichwrap+=h,l			"Bbackspace and cursor keys wrap to 使指定的左右移动光标的键在行首或行尾可以移到前一行或者后一行
set so=7					 "Set 7 lines to the curors - when moving vertical..光标所在的行将总定位在窗口的第7的位置 
"set ruler                   " 打开状态栏标尺
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set nobackup                " 覆盖文件时不备份
set autochdir               " 自动切换当前目录为当前文件所在的目录
filetype plugin indent on   " 开启文件检测 
set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
" set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
set showcmd		    "标尺的右边显示未完成的命令
set matchtime=2             " 短暂跳转到匹配括号的时间
set magic                   " 设置魔术
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set helplang=cn				"设置中文帮助
set smartindent             " 开启新行时使用智能自动缩进
"set autoindent                 "自动缩进
set backspace=indent,eol,start                            " 不设定的话在插入状态无法用退格键和 Delete 键删除回车符
setlocal noswapfile        " 禁用swf交换文件
set viminfo+=n$VIMFILES/Data/.viminfo    "设置viminfo的路径
 "显示长行
set display=lastline                
nmap j gj
nmap k gk
"以上显示长行

" ************************************************************************************************
"  gvim 菜单栏与工具栏隐藏与显示动态切换
"Toggle Menu and Toolbar
" ************************************************************************************************
if g:OS#gui
	set guioptions-=m			 " 隐藏菜单栏
	set guioptions-=T			" 隐藏工具栏
	map <silent> <F2> :if &guioptions =~# 'T' <Bar>
			\set guioptions-=T <Bar>
			\set guioptions-=m <bar>
		\else <Bar>
			\set guioptions+=T <Bar>
			\set guioptions+=m <Bar>
		\endif<cr>
endif

" ************************************************************************************************
" 配色方案
" ************************************************************************************************
if g:OS#gui
	colorscheme torte           "配置颜色方案
else
	colorscheme ManShow           "配置颜色方案
endif

" ************************************************************************************************
" 用用户目录
if g:OS#win
    let $VIMFILES = $VIM.'/vimfiles'
	let $HOME = $VIMFILES
	let $BLOG = "E:/User/Documents/howiefh.github.io"
elseif g:OS#unix
	let $VIM=$HOME 
    let $VIMFILES = $HOME.'/.vim'
	let $BLOG = "/media/WinE/User/Documents/howiefh.github.io"
endif

" 设置字体 以及中文支持
if g:OS#win
    set guifont=宋体:h12:cANSI
endif

if g:OS#win
    " 解决win7下“Press Enter or type command to continue”提示
    silent!
endif 

" 设置启动时窗口最大化  linux下如果要窗口最大化参见：http://uniharmony.blog.163.com/blog/static/4617437620087310345373/
if g:OS#win
    " 启动最大化
    " winsize 1024 768 "把窗口设为 宽：1024 高：768  已废弃
	set lines=28 columns=130
   " au GUIEnter * simalt ~x   "打开窗口后模拟（simalt ~x）alt 空格 x 组合键 （最大化窗口）
    au GUIEnter * winpos 200 140   "打开窗口后 将窗口 定位到 200 140 
 endif

if g:OS#unix
	 " 设置窗口默认大小。
	set columns=100
	set lines=30
endif

" 配置多语言环境
if has("multi_byte")
	if g:OS#win
        " set fileencoding=cp936
        " set fileencodings=ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
		language messages utf-8
	elseif g:OS#unix
"		set fileencoding=cp936
		language messages zh_CN.utf-8
	endif
		set fileencoding=utf-8
		set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
		" 设置宽度不明的文字(如 “”①②→ )为双宽度文本。
		" @see http://blog.sina.com.cn/s/blog_46dac66f010006db.html
        set ambiwidth=double
    endif  
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
 
"设置了ctrl+c  ctrl+v等标准windows操作
source $VIMRUNTIME/mswin.vim
behave mswin
 
"打开文件定位到关闭时的位置
autocmd BufReadPost *
			\ if line("'\"") > 0 && line ("'\"") <= line("$") |
			\ exe "normal g'\"" |
			\ endif |
 
"字典目录
"au FileType txt setlocal dict+=$VIM/vimfiles/Data/dictionary/zh_CN.dic
"au FileType txt setlocal dict+=$VIM/vimfiles/Data/dictionary/eng_small.dic
"au FileType tex setlocal dict+=$VIM/vimfiles/Data/dictionary/latex.dic
au FileType php setlocal dict+=$VIM/vimfiles/Data/dictionary/php_funclist.txt

au FileType html setlocal dict+=$VIM/vimfiles/Data/dictionary/html.dic

" for Java  http://mytc.5d6d.com/thread-5032-1-1.html
" makeprgs.Vim 
" 以下的设置没有效果
"autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"setlocal completefunc=javacomplete#CompleteParamsInfo
"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P> 
"inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>

" ************************************************************************************************
" Python 文件的一般设置，比如不要 tab 等
" ************************************************************************************************
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR>

" ************************************************************************************************
"  切换c、c++、python工作目录
" ************************************************************************************************
if g:OS#win
	let g:python_w = "D:/User/Documents/Program/Python"
	let g:cplus_w="D:/User/Documents/Program/c++"
	let g:c_w="D:/User/Documents/Program/c"
endif
if g:OS#unix
	let g:python_w = "~/文档/Program/Python"
	let g:cplus_w="~/文档/Program/C++"
	let g:c_w="~/文档/Program/C"
endif

function ChangeDir(dir) 
    execute ":cd " . a:dir 
endfunction 

map <Leader>py :call ChangeDir(g:python_w)<CR>:pwd<CR>
map <Leader>cp :call ChangeDir(g:cplus_w)<CR>:pwd<CR>
map <Leader>cw :call ChangeDir(g:c_w)<CR>:pwd<cr>

" }}}
" ***************************************** Mappings **************************************** {{{
" ************************************************************************************************
" map
" ************************************************************************************************
map <S-RETURN> <Esc>o 
" 当前行下新起一行
nnoremap <Esc> :noh<CR><Esc>
"去掉高亮
imap jj <Esc>
"映射esc键为jj
nnoremap <Leader>w :w!<cr>
"映射ww为保存

" Buffers操作快捷方式!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab操作快捷方式!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
map <leader>1 :set filetype=xhtml<CR>
map <leader>2 :set filetype=css<CR>
map <leader>3 :set filetype=javascript<CR>
map <leader>4 :set filetype=php<CR>
map <leader>5 :set filetype=python<CR>

" Fileformats
set fileformats=unix,dos,mac
nmap <leader>fd :se fileformat=dos<CR>
nmap <leader>fu :se fileformat=unix<CR>

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" }}}
" Autohotkey 
au BufNewFile,BufRead *.ahk	 setf autohotkey 

command! -nargs=* Ev edit $MYVIMRC  "定义Vimrc 为编辑vimrc 命令

" 在浏览器预览 
function! ViewInBrowser()
	let file = expand("%:p")
	if g:OS#win
		let Browser = "C:/Program Files/Google/Chrome/Application/chrome.exe"
	elseif g:OS#unix
		let Browser = "chromium-browser"
	endif
	exec ":silent !start ". Browser file
endfunction

" ****************************************** Plugins **************************************** {{{
" ************************************************************************************************
" plugin –vundle.vim管理插件的插件   导致中文帮助无法使用 已经停用此插件改用pathogen.vim
" 发现在Ubuntu中将encoding设置为 utf-8 会使中文帮助无法使用
" https://github.com/gmarik/vundle/
" https://github.com/mutewinter/dot_vim
" https://github.com/kaochenlong/eddie-vim
" ************************************************************************************************
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=$VIMFILES/bundle/vundle
call vundle#rc('$VIMFILES/bundle/')

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/zencoding-vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'majutsushi/tagbar'
Bundle 'Shougo/neocomplcache'
Bundle 'kien/ctrlp.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'howiefh/statusline'
Bundle 'howiefh/c.vim'
Bundle 'howiefh/makeprgs'

" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
Bundle 'matchit.zip'
Bundle 'AutoClose'
Bundle 'bufexplorer.zip'
Bundle 'TxtBrowser'
Bundle 'FencView.vim'
" Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" ************************************************************************************************
" plugin - tagbar.vim 查看函数列表，需要ctags程序  taglist 的同类软件
" http://www.vim.org/scripts/script.php?script_id=3465
" ************************************************************************************************
nmap <silent> <F11> :TagbarToggle<CR>
if g:OS#win
    let g:tagbar_ctags_bin = "D:/PortableApps/Vim/ctags58/ctags.exe"
endif
let g:tagbar_width = 30
" 自动打开
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" tagbar markdown
let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:Heading_L1',
		\ 'i:Heading_L2',
		\ 'k:Heading_L3'
	\ ]
\ }
" Tagbar txt
let g:tagbar_type_txt = {
    \ 'ctagstype': 'txt',
    \ 'kinds' : [
        \'c:content',
		\'t:tables',
		\'f:figures'
    \],
	\ 'sort'    : 0
\}

" ************************************************************************************************
" plugin - bufexplorer.vim Buffers切换
" http://www.vim.org/scripts/script.php?script_id=42 
" \be 全屏方式查看全部打开的文件列表
" \bv 左右方式查看   \bs 上下方式查看
" ************************************************************************************************
"
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
"let g:bufExplorerSortBy=\"mru\"        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.

" ************************************************************************************************
" plugin - NeoComplCache.vim    自动补全插件
"http://www.vim.org/scripts/script.php?script_id=2620
"https://github.com/Shougo/neocomplcache
" ************************************************************************************************
let g:neocomplcache_temporary_dir=$VIMFILES.'/Data/.neocon' 	"产生的临时文件保存的目录.默认值是 '~/.neocon'.
let g:neocomplcache_snippets_dir=$VIMFILES.'/Data/snippets'
" neocomplcache开关.
map <F4> :NeoComplCacheToggle<CR>				
imap <F4> <ESC>:NeoComplCacheToggle<CR>a

" 停用 AutoComplPop.
" let g:acp_enableAtStartup = 0
" 启用 neocomplcache.  1是打开 
let g:neocomplcache_enable_at_startup = 1
" 启用 smartcase. 仅当输入大写字母时，区分大小写 
" let g:neocomplcache_enable_smart_case = 1
" 启用大写字母补全.输入大写字母时, 进行模糊搜索可能性词语  例如，当输入AE时会匹配ArgumentsException。
let g:neocomplcache_enable_camel_case_completion = 1
" 启用下划线补全.进行模糊搜索匹配的词。例如,当输入'p_h'时会匹配'public_html'。默认值是 0
let g:neocomplcache_enable_underbar_completion = 1
" 设定最小语法关键词长度.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" 定义字典.
"let g:neocomplcache_dictionary_filetype_lists = {
"	\ 'default' : '',
"	\ 'vimshell' : $HOME.'/.vimshell_hist',
"	\ 'scheme' : $HOME.'/.gosh_completions'
"		\ }
	
" 定义关键词.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" 插件键映射.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" 类似于SuperTab用法 .
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" 推荐的键映射.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"			"加了这句之后对有的文件按回车不会输入候选项
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" 类似于AutoComplPop用法, 自动选择第一个候选项目 .
let g:neocomplcache_enable_auto_select = 1

" 类似于 Shell 用法(不推荐).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" 启用 omni 补全.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" 启用 heavy omni 补全.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" ************************************************************************************************
" plugin - NERD_commenter.vim   注释代码用的，
" http://www.vim.org/scripts/script.php?script_id=1218 
" https://github.com/scrooloose/nerdcommenter
" [count],cc:光标以下count行逐行添加注释(7,cc)
" [count],cu:光标以下count行逐行取消注释(7,cu)
" [count],cm:光标以下count行尝试添加块注释(7,cm)
" 注：count参数可选，无则默认为选中行或当前行
" ************************************************************************************************
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看

" ************************************************************************************************
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" http://www.vim.org/scripts/script.php?script_id=1658 
" https://github.com/scrooloose/nerdtree
" :NERDTree 打开NERD_tree         :NERDTreeClose    关闭NERD_tree
" o 打开关闭文件或者目录         t 在标签页中打开
" T 在后台标签页中打开           ! 执行此文件
" p 到上层目录                   P 到根目录
" K 到第一个节点                 J 到最后一个节点
" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录             R 递归刷新当前根目录
" ************************************************************************************************
" F3 NERDTree 切换
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>
let NERDTreeBookmarksFile=$VIMFILES.'/Data/.NERDTreeBookmarks'

" ************************************************************************************************
" plugin -auto-pairs.vim
" http://www.vim.org/scripts/script.php?script_id=3599
" https://github.com/jiangmiao/auto-pairs
" 匹配括号、引号,此文件在/autoload 中
" 换为https://github.com/vim-scripts/AutoClose
" ************************************************************************************************
" au FileType c,cpp so $VIMFILES/bundle/autoclose/autoclose.vim

" ************************************************************************************************
" plugin –txtbrower.vim
" http://www.vim.org/scripts/script.php?script_id=2899
" http://guoyoooping.blog.163.com/blog/static/1357051832009112910162389/
" ************************************************************************************************
au BufEnter *.txt setlocal ft=txt

if g:OS#win
"
	"阅读txt            http://guoyoooping.blog.163.com/blog/static/135705183201003172751993/
	let tlist_txt_settings = 'txt;c:content;f:figures;t:tables'
	au BufRead,BufNewFile *.txt setlocal ft=txt nu formatoptions=t2crmB textwidth=152 bg& " 换行 折行
	au BufRead,BufNewFile *.txt colo torte " default 
	au BufRead,BufNewFile *.log setlocal ft=txt nu bg&
	au BufRead,BufNewFile *.log colo torte "default desert
	map <F9> :TGoto<CR> 
	autocmd BufRead,BufNewFile *.html map <F10> :call ViewInBrowser()<CR>           " 用浏览器打开文件
"
	if !exists('Tlist_Ctags_Cmd')
		let Tlist_Ctags_Cmd = g:tagbar_ctags_bin
	endif
endif
" ************************************************************************************************
" plugin –fencview.vim自动识别编码
" http://www.vim.org/scripts/script.php?script_id=1708 
" ************************************************************************************************
let g:fencview_autodetect = 0                         " 0关闭 1开启

" ************************************************************************************************
" plugin –pathogen.vim管理插件的插件
" http://www.vim.org/scripts/script.php?script_id=2332 
" https://github.com/tpope/vim-pathogen
" ************************************************************************************************

" ************************************************************************************************
" plugin – ctrlp.vim 文件搜索
" https://github.com/kien/ctrlp.vim 
" Once CtrlP is open:
" Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
" Press <c-f> and <c-b> to cycle between modes.
" Press <c-d> to switch to filename only search instead of full path.
" Press <c-r> to switch to regexp mode.
" Use <c-j>, <c-k> or the arrow keys to navigate the result list.
" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
" Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
" Use <c-y> to create a new file and its parent directories.
" Use <c-z> to mark/unmark multiple files and <c-o> to open them.
" Run :help ctrlp-mappings or submit ? in CtrlP for more mapping help.

" Submit two or more dots .. to go up the directory tree by one or multiple levels.
" End the input string with a colon : followed by a command to execute it on the opening file(s):
" Use :25 to jump to line 25.
" Use :diffthis when opening multiple files to run :diffthis on the first 4 files.
" ************************************************************************************************
" Set the directory to store the cache files: >
let g:ctrlp_cache_dir = $VIMFILES.'/Data/ctrlpcache'

noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>
command! -nargs=* MRU CtrlPMRU

" Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }


" ************************************************************************************************
" plugin – numbers.vim 在命令模式显示与当前行间隔的行数，用于快速定位
" https://github.com/myusuf3/numbers.vim
" ************************************************************************************************
nnoremap <F6> :NumbersToggle<CR>

" ************************************************************************************************
" plugin – matchit 快速找到标签的开始或结束位置
" https://github.com/vim-scripts/matchit.zip
" ************************************************************************************************
" % g% [% ]% a%

" ************************************************************************************************
" plugin – vim-markdown markdown高亮
" https://github.com/plasticboy/vim-markdown
" ************************************************************************************************
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
let g:vim_markdown_folding_disabled=1
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>p :call ViewInBrowser()<CR>

" ************************************************************************************************
" plugin – ZenCoding.vim 很酷的插件，HTML代码生成
"http://www.vim.org/scripts/script.php?script_id=2981
" 插件最新版：http://github.com/mattn/zencoding-vim
" 常用命令可看：http://nootn.com/blog/Tool/23/
" ************************************************************************************************
let g:user_zen_settings = { 
  \  'lang' : 'zh-cn',
  \  'charset' : 'gbk',
  \  'indentation' : '    ', 
  \  'perl' : { 
  \    'aliases' : { 
  \      'req' : 'require ' 
  \    }, 
  \    'snippets' : { 
  \      'use' : "use strict\nuse warnings\n\n", 
  \      'warn' : "warn \"|\";", 
  \    } 
  \  } 
  \}
 " 'charset' : 'gbk',   设置编码 默认是utf-8
let g:user_zen_leader_key = ','
" let g:user_zen_expandabbr_key = '<c-e>'    "设置为ctrl+e展开
let g:use_zen_complete_tag = 1

" ************************************************************************************************
" plugin - statusline.vim 设置在状态行显示的信息  进行过更改
" http://www.vim.org/scripts/script.php?script_id=2879
" ************************************************************************************************

" ************************************************************************************************
" plugin - makeprgs.vim 
" http://www.vim.org/scripts/script.php?script_id=2031 
" ************************************************************************************************

" ************************************************************************************************
" plugin - taglist.vim 查看函数列表，需要ctags程序
" http://www.vim.org/scripts/script.php?script_id=273 
" http://att.newsmth.net/att.php?s.731.55149.150442.diff
" http://att.newsmth.net/att.php?p.731.55149.1226.vim 
" ************************************************************************************************

" ************************************************************************************************
" plugin –mru.vim打开历史文件
"http://www.vim.org/scripts/script.php?script_id=521
" ************************************************************************************************

" ************************************************************************************************
" plugin - pydiction Python 代码自动完成的脚本
" http://www.vim.org/scripts/script.php?script_id=850
" ************************************************************************************************


" ************************************************************************************************
" plugin - vimwiki
" http://www.vim.org/scripts/script.php?script_id=2226
" ************************************************************************************************

" ************************************************************************************************
" plugin - Calendar.vim 日历插件，可以写自己的心情日记。
" http://www.vim.org/scripts/script.php?script_id=52 
" <leader>cal 在左侧打开     <leader>caL 在下边打开
" ************************************************************************************************

" ************************************************************************************************
" plugin- vimtweak.dll 设置背景透明,窗口最大化,窗口在最前端
" http://www.vim.org/scripts/script.php?script_id=687
" ************************************************************************************************

" ************************************************************************************************
" plugin - Conque Shell 在vim中打开终端
" http://www.vim.org/scripts/script.php?script_id=2771
" ************************************************************************************************

" ************************************************************************************************
" plugin -VimIM.vim 
"http://vim.sourceforge.net/scripts/script.php?script_id=2506
" ************************************************************************************************

" ************************************************************************************************
" plugin - Mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" http://www.vim.org/scripts/script.php?script_id=2666 
" \m mark or unmark the word under (or before) the cursor
" \r manually input a regular expression. 用于搜索.
" \n clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .
" \* 当前MarkWord的下一个     \# 当前MarkWord的上一个
" \/ 所有MarkWords的下一个    \? 所有MarkWords的上一个
" ************************************************************************************************

" ************************************************************************************************
" plugin - DoxygenToolkit.vim 由注释生成文档，并且能够快速生成函数标准注释
"http://www.vim.org/scripts/script.php?script_id=987 
" ************************************************************************************************
" ************************************************************************************************
" plugin – EasyGrep 多文档字符串搜索
" http://www.vim.org/scripts/script.php?script_id=2438
" vv – Grep for the word under the cursor
" va – Like vv, but add to existing list
" vo – Select the files to search in and set grep options
" :Grep SearchString 
" ************************************************************************************************

" ************************************************************************************************
"  plugin – javascript 语法设置 ~/.vim/syntax/javascript.vim
" ************************************************************************************************

" ************************************************************************************************
"  plugin –javascript 常见语法错误检查 plugin/javaScriptLint.vim
"http://www.vim.org/scripts/script.php?script_id=2578
" 按 Ctrl + S + J 就可以检查 Javascript 语法有无问题
" ************************************************************************************************

" ************************************************************************************************
" plugin –DrawIt：Vim画图插件（可在vim中画基本示意图）
" http://www.vim.org/scripts/script.php?script_id=40 
"http://hi.baidu.com/2maollm/blog/item/ff98de179aa61505c93d6da7.html
" ************************************************************************************************
 
" ************************************************************************************************
" plugin - template_loader.vim模板
"http://code.google.com/p/nishizaw23/downloads/list
" ************************************************************************************************

" ************************************************************************************************
" plugin –sketch.vim画图
"  http://www.vim.org/scripts/script.php?script_id=705 
" ************************************************************************************************
"执行:call ToggleSketch()命令开启或关闭画图功能. 建议在.vimrc中把
"    call ToggleSketch() 映射为命令, 方便一些":map <F1> :call
"    ToggleSketch()<CR>"
" 
"鼠标左键用于画自由曲线, Ctrl-鼠标左键可以画粗曲线. 鼠标右键圈一个区域, 然后点击
"左键可以画空心图, Shift-鼠标左键画的的时候拐弯处用"."而不是"+", Ctrl-鼠标左键可
"以画实习图. Alt-鼠标左键可以切换实心画和粗笔画的线条, 可以有的选择为".", ":"和
"#".
"
"command Sketch :call ToggleSketch() "定义新命令Sketch
"
" ************************************************************************************************
" plugin - timestamp.vim 
" http://www.vim.org/scripts/script.php?script_id=923
" ************************************************************************************************
" }}}

" vim:fdm=marker
