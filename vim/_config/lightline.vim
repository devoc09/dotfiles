UsePlugin 'lightline.vim'

let g:lightline = {
            \ 'colorscheme': 'molokai',
            \ 'enable': { 'statusline': 0 },
            \ 'tab': {
                \ 'active' : [ 'filename', 'modified' ],
                \ 'inactive' : [ 'filename', 'modified' ]
                \},
                \ 'tabline' : {
                    \ 'left': [ [ 'tabs' ] ],
                    \ 'right': [ [ 'gitchanged' ], ['gitbranch'], [ 'projectDir' ] ]
                    \ },
                    \ 'component_function': {
                        \ 'gitbranch': 'FugitiveHead',
                        \ 'gitchanged': 'GitChanged',
                        \ 'projectDir': 'GetProjectDir'
                        \},
                        \ 'separator': { 'left': '', 'right': '' },
                        \ 'subseparator': { 'left': '', 'right': '' }
                        \}
                    
function! GetProjectDir() abort
    let path = getcwd()
    if has('win32')
        let pathList = split(path, '\')
    else
        let pathList = split(path, '/')
    endif
    let projectDir = pathList[-1]
    return projectDir
endfunction

function! GitChanged() abort
    if getftype(".git") != "dir"
        return printf('')
    endif
    let l:output = systemlist('git status -s')
    if empty(l:output)
        return printf('')
    else
        return printf('X')
    endif
endfunction
