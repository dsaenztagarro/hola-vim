" --------------------------------
" Add our plugin to the path
" --------------------------------
python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))

" --------------------------------
"  Function(s)
" --------------------------------
function! UpdateSatisCmd()
python << EOF
from vim_hola import update_satis_cmd

vim.command("return \"%s\"" % update_satis_cmd())
EOF
endfunction

function! RunCommandTest(command)
  if exists('$TMUX')
    if exists(':VimuxRunCommand')
      call VimuxRunCommand(a:command)
    else
      echo 'Missing vim plugin Vimux'
    endif
  else
    echo 'Required running inside TMUX session'
  endif
endfunction

function! UpdateSatis()
  let cmd = UpdateSatisCmd()
  call RunCommandTest(cmd)
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! HolaUpdateSatis call UpdateSatis()
