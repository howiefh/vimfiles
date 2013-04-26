" vim: sw=4:ts=4:ft=vim:foldmethod=expr:tw=75:foldcolumn=2
" ManShow: based on thegoodluck
" Vim color file
" Maintainer:	Leonid Shvechikov (aka tGL) <shvechikov@gmail.com>
" Vesion:       0.7
" Last Change:	星期一 14 二月 2011 06:58:56 下午 中国标准时间

" tGL - the Good Luck
" My personal light colorscheme for gvim.
" I prefere to decrease screen brightness at my worktime to the value,
" when the white color not tire my eyes.

set background=light
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "ManShow"

" Vim >= 7.0 specific colors
" if version >= 700
" 	hi CursorLine            guibg=#e8f2ff
hi CursorColumn          guibg=#a8f2ff
" hi MatchParen            guibg=#ffff00 gui=bold
hi MatchParen            guibg=Yellow	guifg=Cyan	gui=bold
" 	hi Pmenu    guifg=Black  guibg=#ddeeff
" 	hi PmenuSel guifg=White  guibg=#4088d0
" endif

" General colors
" hi Cursor     guifg=White    guibg=Black
hi lCursor    guifg=White    guibg=Black
hi Normal     guifg=Black    guibg=Grey99
hi NonText    guifg=gray40   guibg=gray95
hi SpecialKey guifg=#ff00ff
hi Title      guifg=Black                  gui=bold
hi Visual     guibg=#bbddff

" Syntax highlighting
hi Comment    guifg=#0066cc
hi Constant   guifg=#aa0000
hi Number     guifg=#aa0000
hi String     guifg=#008000
hi Identifier guifg=#0033cc
hi Operator   guifg=#0066cc                gui=bold
hi Function   guifg=#aa0000
hi PreProc    guifg=#aa0000
hi Special    guifg=#cc6600
hi Statement  guifg=#008040                gui=bold
hi Type       guifg=#0066cc                gui=bold
hi Directory  guifg=#0066cc                gui=bold

hi DiffAdd                   guibg=#ccffcc
hi DiffChange                guibg=#ffffcc
hi DiffDelete guifg=#6699cc  guibg=#bbeeff gui=bold
hi DiffText                  guibg=#ffcccc gui=bold

hi Folded     guifg=gray30   guibg=gray95
hi SignColumn	guifg=Blue	guibg=White
hi LineNr		guibg=#A095C4	guifg=White		ctermfg=White       ctermbg=DarkBlue    term=underline
hi FoldColumn 		guibg=#FDF5E6	guifg=#8ae234	ctermfg=White       ctermbg=DarkBlue    term=standout
hi Search			guibg=White	guifg=#00B2BF	ctermfg=DarkRed     ctermbg=Brown       term=bold       gui=reverse
hi IncSearch	term=reverse	cterm=reverse	gui=reverse
hi vimOper	guifg=Purple
hi vimHiAttrib	guifg=#00B2BF
hi vimOption	guifg=#0F99FF

if version >= 700
	set cursorline
	hi CursorLine		term=underline	cterm=underline	guibg=Grey90	" #FAEFE8	" LightYellow
	" 这三行与下面的配置有冲突
	" highlight CurrentLine guibg=Grey90	" guifg=White
	" au! Cursorhold * exe 'match CurrentLine /\%' . line('.') . 'l.*/'
	" set ut=75
	" To highlight the current line, and have the highlighting stay where it is when the cursor is moved
	nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
	" To highlight the current virtual column (column after tabs are expanded), and have the highlighting stay where it is when the cursor is moved
	nnoremap <silent> <Leader>c :execute 'match Search /\%'.virtcol('.').'v/'<CR>
endif

" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

hi perlMatch			guifg=#0F99FF   	ctermfg=Brown       ctermbg=Black
hi perlSubstitutionGQQ	guifg=#FF99AA   	ctermfg=Brown       ctermbg=Black
hi perlSpecialMatch		guifg=#FF9900   	ctermfg=Brown       ctermbg=Black
hi perlSpecialString	guifg=#FF9911   	ctermfg=Brown       ctermbg=Black
hi perlVarPlain			guifg=SteelBlue
hi perlVarPlain2			guifg=YellowGreen
hi perlMatchStartEnd	gui=bold	guifg=Green
hi perlStringStartEnd	guifg=BLue
hi perlSubname			gui=bold	guifg=Cyan2
hi perlString		guifg=Purple
hi perlNumber		guifg=#EB7153

"" Statusline
hi StatuslineBufNr		cterm=none   	ctermfg=black 	ctermbg=cyan   	gui=none	guibg=#9B30FF	guifg=#ffffff
hi StatuslineLastBufferNr		cterm=none   	ctermfg=black 	ctermbg=cyan   	gui=none	guibg=LightMagenta	guifg=DarkBlue
hi StatuslineFlag		cterm=none   	ctermfg=black 	ctermbg=cyan   	gui=none	guibg=Red		guifg=#ffffff
hi StatuslinePath		cterm=none   	ctermfg=white 	ctermbg=green  	gui=none	guibg=#C82E31	guifg=Black
hi StatuslineFileName	cterm=none   	ctermfg=white 	ctermbg=blue   	gui=none	guibg=#D59B00	guifg=Black
hi StatuslineFileEnc	cterm=none   	ctermfg=white 	ctermbg=yellow 	gui=none	guibg=#DCD800	guifg=Blue
hi StatuslineFileFormat	cterm=bold   	ctermbg=white 	ctermfg=black  	gui=none	guibg=Green	guifg=#F9F400
hi StatuslineFileBomb	cterm=bold   	ctermbg=white 	ctermfg=black  	gui=none	guibg=Green3	guifg=White
hi StatuslineFileType	cterm=bold   	ctermbg=white 	ctermfg=black  	gui=none	guibg=#50A625	guifg=Black
hi StatuslineTermEnc	cterm=none   	ctermbg=white 	ctermfg=yellow 	gui=none	guibg=Green4	guifg=Black
hi SpellLang			cterm=none   	ctermbg=white 	ctermfg=yellow 	gui=none	guibg=#008489	guifg=White
hi StatuslineFoldInfo	cterm=none   	ctermbg=white 	ctermfg=yellow 	gui=none	guibg=steelblue1	guifg=Black

hi TextMode				cterm=none   	ctermbg=white 	ctermfg=yellow 	gui=none	guibg=Cyan		guifg=White
hi StatuslineRealSyn	cterm=none   	ctermbg=white 	ctermfg=yellow 	gui=none	guibg=#00B2BF	guifg=Black
hi StatuslineSyn		cterm=none   	ctermbg=white 	ctermfg=yellow 	gui=none	guibg=#00AE72	guifg=White
" hi TlistGetTagname		cterm=none   	ctermbg=white 	ctermfg=yellow 	gui=none	guibg=#E33539	guifg=White
" hi UpTime				cterm=none   	ctermbg=white 	ctermfg=yellow 	gui=none	guibg=steelblue	guifg=White
hi GetTagname			cterm=none   	ctermbg=white 	ctermfg=yellow 	gui=none	guibg=#E33539	guifg=White

hi FileTime				term=reverse	cterm=reverse	gui=none	guibg=LightYellow	guifg=LightBlue
hi StatusLine			term=reverse,bold	cterm=reverse,bold	ctermbg=white	ctermfg=yellow	gui=none	guibg=Grey90	guifg=White	" guibg=#99D1D3	guifg=Black	"#729eb0
hi MvpInfo		cterm=none   	ctermbg=white 	ctermfg=yellow 	gui=none	guibg=#A020F0	guifg=White

" hi ShowUtf8Sequence		cterm=none   	ctermbg=white 	ctermfg=yellow 	gui=none	guibg=#EEEEEE   guifg=#729eb0
hi StatuslineChar		cterm=none   	ctermbg=white 	ctermfg=yellow 	gui=none	guibg=#52096C	guifg=#F9F400
hi StatuslineCapsBuddy	cterm=none		ctermfg=white	ctermbg=green	gui=none	guibg=#8ae234	guifg=Blue
hi StatuslinePosition	cterm=none		ctermfg=white	ctermbg=magenta	gui=none	guibg=#511F90	guifg=LightCyan
hi StatuslinePercent	cterm=reverse	ctermfg=white	ctermbg=red		gui=none	guibg=#8a2be2	guifg=Black
hi StatuslineTime		cterm=none   	ctermfg=black 	ctermbg=cyan   	gui=none	guibg=#FEF889	guifg=#000000
hi StatuslineSomething	cterm=reverse	ctermfg=white 	ctermbg=darkred	gui=none	guibg=#C2C2C2	guifg=Black
hi StatusLineNC			term=reverse	cterm=reverse	gui=none	guibg=#555555	guifg=#70a0a0

"" Cursor
highlight	Cursor	guifg=White		guibg=Green		ctermfg=White	ctermbg=Blue
highlight	iCursor	guifg=White		guibg=red
if has('multi_byte_ime')
	highlight	CursorIM	guifg=Purple	guibg=Red
endif
set guicursor=n-v-c:block-Cursor
set guicursor+=i-ci:ver15-iCursor-blinkwait700-blinkon400-blinkoff250
set guicursor+=n-v-c:blinkon600-blinkoff450
" set guicursor+=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,n-v-c:blinkon0,i-ci:ver30-blinkwait300-blinkon600-blinkoff300

"" Highlight All Math Operator
hi PreProc          guifg=#ff80ff                ctermfg=171
" hi Constant         guifg=#ffa0a0                ctermfg=217
hi Function	        guifg=#C777EF     gui=NONE  ctermfg=177 ctermbg=17 cterm=none
hi StdFunction      guifg=#C777EF     gui=bold  ctermfg=177 ctermbg=17 cterm=bold
hi UserLabel2	    guifg=#c96129     gui=bold  ctermfg=166 ctermbg=17 cterm=bold
hi StdName	        guifg=#5276e6     gui=bold  ctermfg=69  ctermbg=17 cterm=bold
hi MicroController  guifg=#d00000     gui=bold  ctermfg=160 ctermbg=17 cterm=bold
hi AnsiFuncPtr	    guifg=#ff0000     gui=NONE  ctermfg=196 ctermbg=17 cterm=none
hi PreCondit        guifg=#a06129     gui=NONE  ctermfg=130 ctermbg=17 cterm=none
hi Operator         guifg=Yellow      gui=NONE  ctermfg=226 ctermbg=17 cterm=none
hi OperatorBold	    guifg=Yellow      gui=bold  ctermfg=226 ctermbg=17 cterm=bold
hi BlockBraces	    guifg=Yellow      gui=bold  ctermfg=226 ctermbg=17 cterm=bold
hi cMathOperator            guifg=#3EFFE2   ctermfg=14
hi cPointerOperator         guifg=#3EFFE2   ctermfg=14
hi cLogicalOperator         guifg=#3EFFE2   ctermfg=14
hi cLogicalOperator         guifg=#3EFFE2   ctermfg=14
hi cBinaryOperator          guifg=#F0088C   gui=NONE	ctermfg=161	ctermbg=17
hi cBinaryOperatorError     guifg=white     guibg=#b2377a	ctermfg=231	ctermbg=169	cterm=none
hi cSemicolon				guifg=#FFA70F   ctermfg=202		ctermbg=17	cterm=none
hi cThis					guifg=#00FF00   ctermfg=15
hi ccString					guifg=#5BBD2B   ctermfg=15
hi cccout					guifg=#79378B	ctermfg=16
hi ccendl					guifg=#C57CAC	ctermfg=17
hi cAsk						guifg=#FF0000	ctermfg=18
hi TabIndent				guifg=Grey40	ctermfg=18

" Highlight Class and Function names
hi cCustomFunc	gui=bold	guifg=Green
hi cCustomClass	gui=bold	guifg=#F57CAC
hi cCustomScope	gui=bold	guifg=#00F5FF

hi qfLineNr	guibg=Yellow	guifg=Black
"vim:ts=4:tw=4:foldmethod=expr
