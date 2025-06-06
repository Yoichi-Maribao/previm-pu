" AUTHOR: kanno <akapanna@gmail.com>
" MAINTAINER: previm developers
" License: This file is placed in the public domain.

if exists('g:loaded_previm') && g:loaded_previm
  finish
endif
let g:loaded_previm = 1

let s:save_cpo = &cpo
set cpo&vim

" ファイルタイプ検出の設定
if !exists('g:previm_disable_default_ft_detect')
  augroup PrevimFileType
    autocmd!
    autocmd BufRead,BufNewFile *.pu,*.uml,*.plantuml,*.puml setfiletype plantuml
  augroup END
endif

augroup Previm
  autocmd!
  autocmd FileType *{mkd,markdown,mmd,mermaid,rst,textile,asciidoc,plantuml,html,pu}* call previm#install()
augroup END

let &cpo = s:save_cpo
unlet! s:save_cpo
