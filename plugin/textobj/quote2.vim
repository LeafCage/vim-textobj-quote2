let s:save_cpo = &cpo| set cpo&vim
scriptencoding utf-8
"=============================================================================
onoremap <silent><Plug>(textobj-quote2-i) :<C-u>call textobj#quote2#select('i')<CR>
onoremap <silent><Plug>(textobj-quote2-a) :<C-u>call textobj#quote2#select('a')<CR>
xnoremap <silent><Plug>(textobj-quote2-i) :<C-u>call textobj#quote2#select('i')<CR>
xnoremap <silent><Plug>(textobj-quote2-a) :<C-u>call textobj#quote2#select('a')<CR>

"=============================================================================
"END "{{{1
let &cpo = s:save_cpo| unlet s:save_cpo
