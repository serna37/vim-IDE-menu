let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
"noremap <silent><Plug>(ide-menu) :<C-u>cal idemenu#open()<CR>
"nnoremap <Leader>v <Plug>(ide-menu)

"nnoremap <F9> <Plug>VimspectorToggleBreakpoint
"nnoremap <F5> <Plug>VimspectorRestart
"nnoremap <F10> <Plug>VimspectorStepOver
"nnoremap <F11> <Plug>VimspectorStepInto
"nnoremap <S-F11> <Plug>VimspectorStepOut

"nnoremap <F3> :cal execute('VimspectorWatch '.expand('<cword>'))<CR>
"nnoremap <F8> <Plug>VimspectorContinue
"nnoremap <F10> :VimspectorReset<CR>

nnoremap <Leader>_ <Plug>VimspectorBalloonEval
