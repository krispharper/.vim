setlocal spell spelllang=en_us
setlocal linebreak
setlocal indentexpr=
setlocal makeprg=pdflatex\ %
map \\l :w<CR>:make<CR>
map \\v :!file=%; file=${file/tex/pdf}; open -a Preview $file <CR><CR>
map <C-l> \\l\\v
