"Temporary build map
nnoremap <F5> :!./deploy -d<CR><CR>

filetype on
filetype plugin on
syntax on

"Show partial commands
set showcmd

"Indent settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set ignorecase
set smartcase

"Relative numbering
set relativenumber
function! NumberToggle()
	if(&relativenumber == 1)
		set number
	else
		set relativenumber
	endif
endfunc

nnoremap <C-n> :call NumberToggle()<CR>

"Colors
colorscheme default
highlight SpellBad term=Reverse ctermbg=Red ctermfg=White

"Allow XML and HTML tag matching
runtime macros/matchit.vim

"Fold settings
set foldmethod=indent
set foldnestmax=2
set foldlevel=1000
nnoremap <space> za
nnoremap zc zM
nnoremap zo zR

"Taglist settings
map T :TlistToggle<CR>

"NERDTree settings
let g:NERDTreeWinPos = "right"
map nt :NERDTree<CR>
let NERDTreeIgnore = ['\.pyc$']

"Buffer switching
:nnoremap <C-b> :buffers<CR>:buffer<Space>

"Easier navigation
nnoremap <C-Down> <C-e>
nnoremap <C-Up> <C-y>
map <C-left> :tabp<CR>
map <C-right> :tabn<CR>
map <C-T> :tabnew %<CR>

"Fix weird inconsistency with Y
map Y y$

"Make K the opposite of J
nmap K i<CR><esc>k$
