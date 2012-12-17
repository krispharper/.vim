"Auto complete settings
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu
set pumheight=10
let g:acp_behaviorKeywordLength = 1
let g:acp_ignorecaseOption = 1
