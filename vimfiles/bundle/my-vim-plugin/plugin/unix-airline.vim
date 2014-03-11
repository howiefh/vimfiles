if has("unix")
	" plugin - airline
	" 定义符号
	" the separator used on the left side >
	let g:airline_left_sep='►'
	" the separator used on the right side >
	let g:airline_right_sep='◄'
	let g:airline_left_alt_sep = '┦'
	let g:airline_right_alt_sep = '┢'

	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif
	" let g:airline_symbols.linenr = '␊'
	" let g:airline_symbols.linenr = '␤'
	let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.branch = '⎇'
	" let g:airline_symbols.paste = 'ρ'
	let g:airline_symbols.paste = 'Þ'
	let g:airline_symbols.whitespace = 'Ξ'
	let g:airline_symbols.readonly = '✘'

	" enable iminsert detection >
	let g:airline_detect_iminsert=0

	let g:airline#extensions#tabline#enabled = 1
	" configure separators for the tabline only. >
	let g:airline#extensions#tabline#left_sep = '►' "▻
	let g:airline#extensions#tabline#left_alt_sep = ''
	let g:airline#extensions#tabline#right_sep = '◄' "◅
	let g:airline#extensions#tabline#right_alt_sep = ''

	" This will show "⎇ " before the branches. If not set ' Git ' (with a trailing
	" left space) will be displayed.
	" plugin - Git-Branch-Info
	let g:git_branch_status_text = "⎇  "  " ♅ ♄ ♃
endif
