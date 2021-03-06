if exists(':Tabularize')
    nmap <Leader>= :Tabularize /=<CR>
    vmap <Leader>= :Tabularize /=<CR>
    nmap <Leader>a :Tabularize /:\zs<CR>
    vmap <Leader>a :Tabularize /:\zs<CR>
endif

" 表格输入竖线对齐，在vim-table-mode中已经实现
if !exists('g:loaded_table_mode')
    inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
    function! s:align()
        let p = '^\s*|\s.*\s|\s*$'
        if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
            let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
            let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
            Tabularize/|/l1
            normal! 0
            call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
        endif
    endfunction
endif
