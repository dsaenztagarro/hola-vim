" --------------------------------
" Add our plugin to the path
" --------------------------------
python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))

" --------------------------------
"  Function(s)
" --------------------------------
function! UpdateSatis()
python << endOfPython

from hola_vim import update_satis

update_satis()

endOfPython
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! HolaUpdateSatis call UpdateSatis()
