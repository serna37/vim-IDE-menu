# vim-IDE-menu
vim IDE action menu on popup
![demo](./id_menu.png)

Everybody set filer `<leader>f`, go-to-def `<leader>d`or`gd`, show-refs `<leader>r` ...

but too many features in IDE with LSP.

You have to remember a lot of keymap... it's confusing.

So I made a menu including infrequent features, then aggregated a single keymap.

# Dependency
|Features|Dependency|
|:----|:-------|
|Format|[coc.nvim](https://github.com/neoclide/coc.nvim)|
|ReName|[coc.nvim](https://github.com/neoclide/coc.nvim)|
|Snippet|~~[UltiSnips](https://github.com/SirVer/ultisnips)~~ [coc-snippets](https://github.com/neoclide/coc-snippets)|
|Vista|[vista.vim](https://github.com/liuchengxu/vista.vim)|
|MiniMap|[minimap.vim](https://github.com/wfxr/minimap.vim)|
|Run|[vim-quickrun](https://github.com/thinca/vim-quickrun)|
|Debug Set|no Dependency|
|Debug|[vimspector](https://github.com/puremourning/vimspector)|

# Usage
`<Leader>v` to open menu in popup window.

and keymap vimspector features just like `VSCode`.
```vim
noremap <silent><Plug>(ide-menu) :<C-u>cal idemenu#open()<CR>
nnoremap <Leader>v <Plug>(ide-menu)

" breakpoint toggle / clear all
nnoremap <F9> <Plug>VimspectorToggleBreakpoint
nnoremap <S-F9> :<C-u>cal vimspector#ClearBreakpoints()<CR>

" debug start / jump to next breakpoint
nnoremap <F5> <Plug>VimspectorContinue

" exit debug mode
nnoremap <S-F5> :VimspectorReset<CR>

" step over
nnoremap <F10> <Plug>VimspectorStepOver

" step in / step out
nnoremap <F11> <Plug>VimspectorStepInto
nnoremap <S-F11> <Plug>VimspectorStepOut

" watch variable
nnoremap <F3> :cal execute('VimspectorWatch '.expand('<cword>'))<CR>

" hover variable value
nnoremap <Leader>_ <Plug>VimspectorBalloonEval
```
if you want to add other maps, write this on your vimrc.
```vim
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
```

(unnecessary) to preset install debugger
```vim
:VimspectorInstall debugpy delve CodeLLDB
```

`Debug Set`feature will copy profiles for project dir, or you have to prepare `.vimspector.json` on project file.
like (this plugin read current budder `&filetype` and call profile.)
```json
{
    "adapters": {
        "custom-codelldb": {
            "extends": "CodeLLDB",
            "command": [
                "$HOME/.vim/plugged/vimspector/gadgets/macos/CodeLLDB/adapte/codelldb",
                "--port",
                "${unusedLocalPort}"
            ]
        },
        "CodeLLDB - StopOnEntry": {
            "extends": "custom-codelldb",
            "name": "CoHostingLLDB"
        }
    },
    "configurations": {
        "cpp": {
            "adapter": "CodeLLDB",
            "filetypes": [
                "cpp"
            ],
            "default": true,
            "variables": {
                "BUILDME": {
                    "shell": "g++ -g -std=c++20 ${script:${file\\}} -o ${workspaceRoot}/test"
                },
                "arch": {
                    "shell": "uname -m"
                }
            },
            "configuration": {
                "name": "C++: Current File",
                "type": "cpp",
                "request": "launch",
                "program": "${workspaceRoot}/test",
                "stopAtEntry": true,
                "externalConsole": true,
                "console": "integratedTerminal",
                "MIMode": "lldb",
                "MIDebuggerPath": "$HOME/.vim/plugged/vimspector/gadgets/macos/vscode-cpptools/debugAdapters/lldb-mi/bin/lldb-mi",
                "logging": {
                    "engineLogging": true
                },
                "targetArchitecture": "${arch}"
            },
            "breakpoints": {
                "exception": {
                    "raised": "Y",
                    "caught": "Y",
                    "uncaught": "Y",
                    "cpp_throw": "Y",
                    "cpp_catch": "Y"
                }
            }
        },
        "python": {
            "adapter": "debugpy",
            "filetypes": [
                "python"
            ],
            "default": true,
            "configuration": {
                "name": "Python: Current File",
                "type": "python",
                "request": "launch",
                "cwd": "${cwd}",
                "program": "${file}",
                "stopOnEntry": true,
                "externalConsole": false,
                "console": "integratedTerminal"
            },
            "breakpoints": {
                "exception": {
                    "raised": "Y",
                    "caught": "Y",
                    "uncaught": "Y"
                }
            }
        },
        "go": {
            "adapter": "delve",
            "filetypes": [
                "go"
            ],
            "default": true,
            "configuration": {
                "name": "Go: Current File",
                "type": "go",
                "request": "launch",
                "cwd": "${cwd}",
                "program": "${file}",
                "stopOnEntry": true,
                "externalConsole": false,
                "console": "integratedTerminal"
            },
            "breakpoints": {
                "exception": {
                    "raised": "Y",
                    "caught": "Y",
                    "uncaught": "Y"
                }
            }
        }
    }
}
```
