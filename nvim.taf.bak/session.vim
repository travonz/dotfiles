
" ------ Session Management -----------------
" Automatically load session if a session file is present in the current directory
" Automatically save session if one is active, if no active session do nothing
" Session has a default name defined by s:sessionfile variable
" -S option is overriden an ineffective

" Type :mks to activate session

let s:sessionfile="Session.vim"

function! SaveSession()
    if (v:this_session != "")
        exe "mksession!" . s:sessionfile
    endif
endfunction

function! LoadSession()
  if (filereadable(s:sessionfile))
    exe 'source ' s:sessionfile
    echo "Session loaded"
  else
    echo "No session loaded."
  endif
endfunction

autocmd VimEnter * nested :call LoadSession()
autocmd VimLeave * nested :call SaveSession()


set sessionoptions-=buffers,folds,tabpages,terminal,winsize
nnoremap <Leader>s :wall<BAR>:call SaveSession()<CR>

