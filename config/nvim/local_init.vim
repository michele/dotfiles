let NERDTreeShowHidden=1
"
" example
let g:nv_search_paths = ['~/notes']
" String. Set to '' (the empty string) if you don't want an extension appended by default.
" Don't forget the dot, unless you don't want one.
let g:nv_default_extension = '.md'

nmap <Leader>d <Plug>VimwikiMakeDiaryNote

let g:ycm_server_python_interpreter = '/usr/bin/python2'

nnoremap <silent> <Leader>bd :Bclose<CR>

imap jk <Esc>
imap kj <Esc>

let g:UltiSnipsExpandTrigger = "<nop>"
" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Path to python interpreter for neovim
"let g:python3_host_prog  = '/path/to/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-Tab> pumvisible() ? "\<lt>C-p>" : "\<lt>S-Tab>"

let g:NERDTreeWinSize = 40

let g:airline_powerline_fonts = 1

let g:airline#extensions#tmuxline#enabled = 0

let g:airline_theme = 'zenburn'

" Local changes not from dotfiles
let $LOCALFILE=expand("~/.nvimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
