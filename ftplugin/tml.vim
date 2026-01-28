" Filetype plugin for Template Markup Language

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Comment settings (TML has no comments, but set for completeness)
setlocal comments=
setlocal commentstring=

" Match pairs for % jumping
setlocal matchpairs+={:}

" Undo settings when filetype changes
let b:undo_ftplugin = "setlocal comments< commentstring< matchpairs<"
