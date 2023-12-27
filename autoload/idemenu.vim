let s:idemenu = #{
    \ pmenu_default: [],
    \ menuid: 0, mttl: ' IDE MENU  ',
    \ menu: [
        \ '[⚖️  Format]    format CocActionAsync',
        \ '[♻️  ReName]    rename CocActionAsync',
        \ '[🎨 Snippet]   ultisnips edit',
        \ '[🌏 Vista]     outline toggle',
        \ '[🗺️ MiniMap]   minimap toggle',
        \ '[⚡️ Run]       quickrun',
        \ '[⚡️ Run StdIn] quickrun',
        \ '[⚙️  Debug]     vimspector',
    \ ],
    \ }

let g:quickrun_config = {}
let g:quickrun_config.cpp = #{command: 'g++', cmdopt: '--std=c++20'}

fu! s:idemenu.open() abort
    let self.menuid = popup_menu(self.menu, #{title: self.mttl, border: [], borderchars: ['─','│','─','│','╭','╮','╯','╰'],
        \ callback: 's:idemenu_exe'})
    cal setwinvar(self.menuid, '&wincolor', 'String')
    hi DarkRed ctermfg=204
    cal matchadd('DarkRed', '\[.*\]', 16, -1, #{window: self.menuid})
    let self.pmenu_default = execute('hi PmenuSel')[1:]->split(' ')->filter({_,v->stridx(v, '=')!=-1})
    hi PmenuSel ctermbg=232 ctermfg=114
endf

fu! s:idemenu_exe(_, idx) abort
    if a:idx == 1
        cal CocActionAsync('format')
    elseif a:idx == 2
        cal CocActionAsync('rename')
    elseif a:idx == 3
        exe 'UltiSnipsEdit'
    elseif a:idx == 4
        exe 'Vista!!'
    elseif a:idx == 5
        exe 'MinimapToggle'
    elseif a:idx == 6
        sil! exe 'QuickRun -hook/time/enable 1'
    elseif a:idx == 7
        let args = input('stdin>')
        cal system('touch .quickrun.tmp.stdin.txt && echo "'.args.'" > .quickrun.tmp.stdin.txt')
        sil! exe 'QuickRun -hook/time/enable 1 <.quickrun.tmp.stdin.txt'
        cal system('rm .quickrun.tmp.stdin.txt')
    elseif a:idx == 8
        cal system('cp -f ~/.vim/plugged/vim-IDE-menu/.vimspector.json .vimspector.json')
        cal vimspector#Launch()
    endif
    exe 'hi PmenuSel '.join(s:idemenu.pmenu_default, ' ')
    retu 0
endf

fu! idemenu#open() abort
    cal s:idemenu.open()
endf

