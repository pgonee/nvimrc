setlocal ts=4 sw=4 sts=4
setlocal colorcolumn=120

let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = ['autopep8', 'yapf']
let b:ale_warn_about_trailing_whitespace = 1
let b:ale_python_flake8_executable = '/Users/pgonee/.pyenv/versions/neovim3/bin/flake8'
