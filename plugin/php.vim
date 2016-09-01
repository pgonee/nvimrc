function! PhpSyntaxOverride()
    setlocal ts=4 sw=4 sts=4
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END
