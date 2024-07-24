noremap <silent><Plug>(ide-menu) :<C-u>cal idemenu#open()<CR>
nnoremap <Leader>v <Plug>(ide-menu)

nnoremap <F9> <Plug>VimspectorToggleBreakpoint
nnoremap <F5> <Plug>VimspectorContinue
nnoremap <S-F5> :VimspectorReset<CR>
nnoremap <F10> <Plug>VimspectorStepOver
nnoremap <F11> <Plug>VimspectorStepInto
nnoremap <S-F11> <Plug>VimspectorStepOut

nnoremap <F3> :cal execute('VimspectorWatch '.expand('<cword>'))<CR>
nnoremap <Leader>_ <Plug>VimspectorBalloonEval
