let s:idemenu = #{
    \ pmenu_default: [],
    \ menuid: 0, mttl: ' IDE MENU (j / k) Enter choose ',
    \ menu: [
        \ '[⚖️  Format]   format CocActionAsync',
        \ '[♻️  ReName]   rename CocActionAsync',
        \ '[🎨 Snippet]  ultisnips edit',
        \ '[⚡️ Run]      quickrun',
        \ '[⚙️  Debug]    vimspector',
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
        exe 'QuickRun'
    elseif a:idx == 5
        cal vimspector#LaunchWithSettings({'configuration': &filetype})
    endif
    exe 'hi PmenuSel '.join(s:idemenu.pmenu_default, ' ')
    retu 0
endf

fu! idemenu#open() abort
    cal s:idemenu.open()
endf

