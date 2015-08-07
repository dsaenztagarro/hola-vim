" The "Vim Hola" plugin improves development workflow for HOLA/HELLO
"
" Author:  dsaenztagarro
" URL:     https://github.com/dsaenztagarro/vim-hola
" Version: 0.1
" ----------------------------------------------------------------------------
"
if exists('g:loaded_vimhola') || &cp
  finish
endif
let g:loaded_vimhola = 1

" --------------------------------
" Add our plugin to the path
" --------------------------------
python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))

" --------------------------------
"  Fabric commands functions
" --------------------------------
function! s:update_satis_cmd()
python << EOF
from vim_hola import update_satis_cmd

vim.command("return \"%s\"" % update_satis_cmd())
EOF
endfunction

function! s:release_xdebug_port_cmd()
python << EOF
from vim_hola import release_xdebug_port_cmd

vim.command("return \"%s\"" % release_xdebug_port_cmd())
EOF
endfunction

function! s:run_command(command)
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

" --------------------------------
"  Commands
" --------------------------------

function! UpdateSatis()
  let cmd = s:update_satis_cmd()
  call s:run_command(cmd)
endfunction

function! ReleaseXdebugPort()
  let cmd = s:release_xdebug_port_cmd()
  call s:run_command(cmd)
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! HolaUpdateSatis call UpdateSatis()
command! ReleaseXdebugPort call ReleaseXdebugPort()
