setlocal spell spelllang=en_us
setlocal linebreak
"setlocal indentexpr=
setlocal makeprg=pdflatex\ %
"let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_quickfix=2
"let g:LatexBox_latexmk_options="-c"
"map <leader>l :w<CR>:make<CR>
"map <leader>v :!file=%; file=${file/tex/pdf}; open -a Preview $file <CR><CR>
"map <C-m> <leader>l<leader>v
