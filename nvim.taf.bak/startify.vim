
" Create the following directory first
"mkdir /var/cache/startify-sessions
"chmod 777 /var/cache/startify-sessions
"let g:startify_session_dir = '/var/cache/startify-sessions/$USER'
let g:startify_session_dir = '~/.cache/nvim/startify-sessions'


let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]

let g:startify_session_persistence = 1
