"http://www.vim.org/scripts/script.php?script_id=2879
let g:statusline_max_path = 20
fun! StatusLineGetPath() "{{{
  let p = expand('%:.:h') "relative to current path, and head path only
  let p = substitute(p,'\','/','g')
  let p = substitute(p, '^\V' . $HOME, '~', '')
  if len(p) > g:statusline_max_path 
    let p = simplify(p)
    let p = pathshorten(p)
  endif
  return p
endfunction "}}}

nmap <Plug>view:switch_status_path_length :let g:statusline_max_path = 200 - g:statusline_max_path<cr>
nmap ,t <Plug>view:switch_status_path_length



set laststatus=2

augroup Statusline
  au! Statusline

  au BufEnter * call <SID>SetFullStatusline()
  au BufWinEnter * call <SID>SetFullStatusline()
  au BufLeave,BufNew,BufRead,BufNewFile * call <SID>SetSimpleStatusline()
augroup END

fun! StatusLineRealSyn()
    let synId = synID(line('.'),col('.'),1)
    let realSynId = synIDtrans(synId)
    if synId == realSynId
        return 'Normal'
    else
        return synIDattr( realSynId, 'name' )
    endif
endfunction

fun! s:SetFullStatusline() "{{{
  setlocal statusline=
  setlocal statusline+=%#StatuslineBufNr#%-1.2n\                   " buffer number
  setlocal statusline+=%h%#StatuslineFlag#%m%r%w                 " flags
  setlocal statusline+=%#StatuslinePath#\ %-0.20{StatusLineGetPath()}%0* " path
  setlocal statusline+=%#StatuslineFileName#\/%t\                       " file name

  setlocal statusline+=%#StatuslineFileEnc#\ %{&fileencoding}\         " file encoding
  setlocal statusline+=%#StatuslineFileType#\ %{strlen(&ft)?&ft:'**'}\ . " filetype
  setlocal statusline+=%#StatuslineFileType#%{&fileformat}\             " file format
  setlocal statusline+=%#StatuslineTermEnc#\ %{&termencoding}\           " encoding
  setlocal statusline+=%#StatuslineChar#\ %-2B\ %0*                 " current char
  setlocal statusline+=%#StatuslineSyn#\ %{synIDattr(synID(line('.'),col('.'),1),'name')}\ %0*           "syntax name
  setlocal statusline+=%#StatuslineRealSyn#\ %{StatusLineRealSyn()}\ %0*           "real syntax name
  setlocal statusline+=%=

  setlocal statusline+=%#StatuslineL#\ %l/%L             "position Line
  setlocal statusline+=%#StatuslineC#\ %-5.(%c-%v%)             "position Column
  setlocal statusline+=%#StatuslinePos#\ %P                             "position percentage
  setlocal statusline+=\ %#StatuslineTime#%{strftime(\"%m-%d\ %H:%M\")} " current time
endfunction "}}}

fun! s:SetSimpleStatusline() "{{{
  setlocal statusline=
  setlocal statusline+=%#StatuslineNC#%-0.20{StatusLineGetPath()}%0* " path
  setlocal statusline+=\/%t\                       " file name
endfunction "}}}
" ================================================================================================
" XPTemplate color setting   设置状态条颜色  需要配合statusline使用
" statusline.vim: http://www.vim.org/scripts/script.php?script_id=3734
" grey2 :  http://www.vim.org/scripts/script.php?script_id=2859
" http://www.vim.org/scripts/script.php?script_id=2611
" ================================================================================================

hi XPTcurrentPH         gui=underline   guibg=#3c3c3c guifg=NONE
hi XPTfollowingPH       gui=underline	guibg=NONE guifg=NONE
hi XPTnextItem          gui=none	guibg=#3e3e68 guifg=#dddddd

hi MatchParen     gui=none guibg=#244c5c guifg=NONE
" }}}

hi StatuslineBufNr     cterm=none    ctermfg=black  ctermbg=cyan    gui=none guibg=#840c0c guifg=#ffffff
hi StatuslineFlag      cterm=none    ctermfg=black  ctermbg=cyan    gui=none guibg=#bc5b4c guifg=#ffffff
hi StatuslinePath      cterm=none    ctermfg=white  ctermbg=green   gui=none guibg=#8d6c47 guifg=black
hi StatuslineFileName  cterm=none    ctermfg=white  ctermbg=blue    gui=none guibg=#d59159 guifg=black
hi StatuslineFileEnc   cterm=none    ctermfg=white  ctermbg=yellow  gui=none guibg=#ffff77 guifg=black
hi StatuslineFileType  cterm=bold    ctermbg=white  ctermfg=black   gui=none guibg=#acff84 guifg=black
hi StatuslineTermEnc   cterm=none    ctermbg=white  ctermfg=yellow  gui=none guibg=#77cf77 guifg=black
hi StatuslineChar      cterm=none    ctermbg=white  ctermfg=yellow  gui=none guibg=#66b06f guifg=black
hi StatuslineSyn       cterm=none    ctermbg=white  ctermfg=yellow  gui=none guibg=#60af9f guifg=black
hi StatuslineRealSyn   cterm=none    ctermbg=white  ctermfg=yellow  gui=none guibg=#5881b7 guifg=black
hi StatusLine          cterm=none    ctermbg=white  ctermfg=yellow  gui=none guibg=#3f4d77 guifg=#729eb0
hi StatuslineL		   cterm=none    ctermfg=black  ctermbg=cyan    gui=none guibg=#333366 guifg=#ffffff
hi StatuslineC		   cterm=none    ctermfg=black  ctermbg=cyan    gui=none guibg=#330066 guifg=#ffffff
hi StatuslinePos	   cterm=none    ctermfg=black  ctermbg=cyan    gui=none guibg=#330033 guifg=#ffffff
hi StatuslineTime      cterm=none    ctermfg=black  ctermbg=cyan    gui=none guibg=#66CC00 guifg=#000000
hi StatuslineSomething cterm=reverse ctermfg=white  ctermbg=darkred gui=none guibg=#c0c0f0 guifg=black
hi StatusLineNC                                                     gui=none guibg=#304050 guifg=#70a0a0 

" ================================================================================================
