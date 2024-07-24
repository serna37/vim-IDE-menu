noremap <silent><Plug>(ide-menu) :<C-u>cal idemenu#open()<CR>
nnoremap <Leader>v <Plug>(ide-menu)

" breakpoint toggle / clear all
nnoremap <F9> <Plug>VimspectorToggleBreakpoint
nnoremap <S-F9> :<C-u>cal vimspector#ClearBreakpoints()<CR>

" debug start / jump to next breakpoint
nnoremap <F5> <Plug>VimspectorContinue
" exit debug mode
nnoremap <S-F5> :VimspectorReset<CR>

" restart debug mode
nnoremap <F4> <Plug>VimspectorRestart

" step over
nnoremap <F10> <Plug>VimspectorStepOver

" step in / step out
nnoremap <F11> <Plug>VimspectorStepInto
nnoremap <S-F11> <Plug>VimspectorStepOut

" watch variable
nnoremap <F3> :cal execute('VimspectorWatch '.expand('<cword>'))<CR>

" hover variable value
nnoremap <Leader>_ <Plug>VimspectorBalloonEval
