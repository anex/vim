"Fuentes
set guifont="Verdana\ Bold\ 14"

filetype plugin on
filetype  indent on

" General Settings
set autoindent                  " copy indent from current line
"set autoread                    " read open files again when changed outside Vim
"set autowrite                   " write a modified buffer on each :next , ...
"set backup                      " keep a backup file
"set browsedir=current           " which directory to use for the file browser
"set complete+=k                 " scan the files given with the 'dictionary' option
"set hlsearch                    " highlightthe last used search pattern
"set incsearch                   " do incremental searching
"set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
"set mouse=a                     " enable the use of the mouse
"set ruler                       " show the cursor position all the time
"set smartindent                 " smart autoindenting when starting a new line
"highlight MatchParen ctermbg=blue guibg=lightyellow


" comma always followed by a space
"-------------------------------------------------------------------------------
inoremap  ,  ,<Space>

au BufRead,BufNewFile *.tmp setfiletype moinmoin




",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)

"status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

"set tw=79
set tw=0

map ,v :sp ~/.vimrc <CR><C-W>_
map <silent> ,V :source ~/.vimrc <CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

"colorscheme rdark
"colorscheme carvedwood
"colorscheme darkspectrum
"colorscheme rdark
"colorscheme kib_darktango
syntax on
set encoding=utf8

"Pestannas
set showtabline=2

"Tabs to spaces. 
set tabstop=4
set shiftwidth=4
set expandtab

map <F6> <Esc>:syntax off<CR><Esc>:setlocal spell spelllang=es,en<CR>
map <F7> <Esc>:syntax on<CR><Esc>:setlocal nospell<CR>
colorscheme fine_blue

set tabstop=4
set nu

"map <Esc>[Z <s-tab>
"ounmap <Esc>[Z

nmap <C-o> :browse tabedit<cr>
nmap <C-p> :tabprevious<cr>
nmap <C-x> :tabclose<cr>
nmap <C-c><C-c> :!perl -Wc %<cr>

nmap <tab> v>
nmap <s-tab> v<

vmap <tab> >gv
vmap <s-tab> <gv

imap <F2> <C-R>=strftime("%c")<CR>
imap <F2> <C-R>=system("perl -MDateTime -e 'print DateTime->now'")<CR>

set foldmethod=manual

"let perl_fold = 0
"let perl_fold_blocks = 0
"let perl_nofold_packages = 1
let perl_extended_vars = 1
"let perl_include_pod = 1 
let perl_want_scope_in_variables = 1

set equalprg=perltidy

nmap <C-x><C-i> :call InstallCPANModule()<CR>
function! InstallCPANModule()
  let l = getline('.')
  let cw = substitute( expand('<cWORD>') , ";$" , "" , "g" )
  let cw = substitute( cw , "['\"]" , "" , "g" )
  echo "Installing CPAN Module: " . cw . "\n"
  silent exec "!cpanp i " . cw . " >& /dev/null"
  echo "Done\n"
endfunction

au bufnewfile *.pl 0r ~/.vim/skeleton/template.pl
au bufnewfile *.pod 0r ~/.vim/skeleton/template.pod
au bufnewfile *.pm 0r ~/.vim/skeleton/template.pm

map <F8> :ToggleNERDTree<CR>

let loaded_nerd_comments=1

"Template Toolkit
au BufNewFile,BufRead *.tt2 setf tt2
let b:tt2_syn_tags = '\[% %] <!-- -->'


"XML 
let xml_tag_complation_map = "<C-l>"
let xml_tag_syntax_prefixes = 'html\|xml\|xsl\|xsd'
let xml_use_xhtml = 1
