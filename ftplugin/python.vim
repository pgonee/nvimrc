setlocal ts=4 sw=4 sts=4
setlocal colorcolumn=80

let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = ['autopep8', 'yapf']
let b:ale_warn_about_trailing_whitespace = 1
let b:ale_python_flake8_executable = '/Users/pgonee/.pyenv/versions/neovim3/bin/flake8'

let g:jedi#goto_assignments_command = '<localleader>a'
let g:jedi#goto_definitions_command = '<localleader>d'
let g:jedi#rename_command = '<localleader>gr'
let g:jedi#usages_command = '<localleader>gu'
let g:jedi#documentation_command = '<localleader>gd'
