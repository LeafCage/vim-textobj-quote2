if exists('s:save_cpo')| finish| endif
let s:save_cpo = &cpo| set cpo&vim
scriptencoding utf-8
"=============================================================================
let s:PAT = {
  \ '"': '\%(\%(^\|[^\\]\)\\\)\@<!"',
  \ '''': '''\@<!''\ze\%([^'']\|$\)\|\%(''\@<!''\{2}\)\zs''',
  \ }

function! textobj#quote2#select(mode) "{{{
  let pos = getpos('.')[1:2]
  let quotes = s:get_outerquotes(pos[1]-1, a:mode==#'i')
  if quotes != []
    call s:select([pos[0], quotes[0]], [pos[0], quotes[1]])
  end
endfunction
"}}}
function! s:get_outerquotes(col_minus, is_inner) "{{{
  let line = getline('.')
  let i = match(line, s:PAT['"']. '\|''')
  while i != -1
    let j = match(line, s:PAT[line[i]], i+1)
    if a:col_minus >= i && a:col_minus <= j
      return a:is_inner ? [i+2, j] : [i+1, j+1]
    end
    let i = match(line, s:PAT['"']. '\|''', j+1)
  endwhile
  return []
endfunction
"}}}
function! s:select(left, right) "{{{
  norm! v
  call cursor(a:left)
  norm! o
  call cursor(a:right)
  if &selection ==# 'exclusive'
    norm! l
  endif
endfunction
"}}}

"=============================================================================
"END "{{{1
let &cpo = s:save_cpo| unlet s:save_cpo
