setlocal spell spelllang=en_us
setlocal linebreak
setlocal indentexpr=
setlocal makeprg=pdflatex\ %
map <leader>l :w<CR>:make<CR>
map <leader>v :!file=%; file=${file/tex/pdf}; open -a Preview $file <CR><CR>
map <C-m> <leader>l<leader>v
