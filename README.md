# vim-IDE-menu
vim IDE action menu on popup

# Dependency
|Features|Dependency|
|:----|:-------|
|Format|[coc.nvim](https://github.com/neoclide/coc.nvim)|
|Rename|[coc.nvim](https://github.com/neoclide/coc.nvim)|
|Snippet|[UltiSnips](https://github.com/SirVer/ultisnips)|
|Run|[vim-quickrun](https://github.com/thinca/vim-quickrun)|
|Debug|[vimspector](https://github.com/puremourning/vimspector)|

# Usage
`<Leader>v` to open menu in popup window.

and keymap vimspector features like `eclipse`.
```vim
nnoremap <F3> :VimspectorWatch 
nnoremap <F4> <Plug>VimspectorRestart
nnoremap <F5> <Plug>VimspectorStepInto
nnoremap <F6> <Plug>VimspectorStepOver
nnoremap <F7> <Plug>VimspectorStepOut
nnoremap <F8> <Plug>VimspectorContinue
nnoremap <F9> <Plug>VimspectorToggleBreakpoint
nnoremap <F10> :VimspectorReset<CR>
```

you have to prepare `.vimspector.json` on project file.

like (this plugin read current budder `&filetype` and call profile.)
```json
{
    "adapters": {},
    "configurations": {
        "python": {
            "adapter": "debugpy",
            "configuration": {
                "name": "Python: Current File",
                "type": "python",
                "request": "launch",
                "cwd": "${cwd}",
                "program": "${file}",
                "args": [],
                "stopOnEntry": true,
                "externalConsole": false,
                "debugOptions": []
            },
            "breakpoints": {
                "exception": {
                    "raised": "N",
                    "uncaught": "Y"
                }
            }
        },
        "go": {
            "adapter": "delve",
            "configuration": {
                "name": "Go: Current File",
                "type": "go",
                "request": "launch",
                "cwd": "${cwd}",
                "program": "${file}",
                "args": [],
                "stopOnEntry": true,
                "externalConsole": false,
                "debugOptions": []
            },
            "breakpoints": {
                "exception": {
                    "raised": "N",
                    "uncaught": "Y"
                }
            }
        }
    }
}
```