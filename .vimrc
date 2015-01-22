set nocompatible
" Vundle config and bundle definitians
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" My Bundles
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rhubarb'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-haml'
Bundle "tpope/vim-endwise"
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-repeat'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/zencoding-vim'
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'chriskempson/base16-vim'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'kana/vim-smartinput'
Bundle 'kana/vim-textobj-user'
Bundle 'godlygeek/tabular'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'tomtom/tlib_vim'
Bundle 'Raimondi/delimitMate'
Bundle 'kchmck/vim-coffee-script'
Bundle 'claco/jasmine.vim'
Bundle 'benmills/vimux'
Bundle 'pgr0ss/vimux-ruby-test'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'kien/ctrlp.vim'
Bundle 'bkad/CamelCaseMotion'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'rking/ag.vim'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/argtextobj.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'slim-template/vim-slim'
Bundle 'wavded/vim-stylus'
Bundle 'wting/rust.vim'
Bundle 'bling/vim-airline'
"call vundle#end()

" Include user's local vim config
let mapleader = ','

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"eol:¬,
set list listchars=tab:▸\ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Status bar
set laststatus=2

" Set color options
set t_Co=256

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways
" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Peepopen
"if has("gui_macvim")
  "macmenu &File.New\ Tab key=<nop>
  "map <D-t> <Plug>PeepOpen
"end

 "CTags
"map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
"map <C-\> :tnext<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function! s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Procfile,Guardfile,Vagrantfile,Thorfile,config.ru,*.rabl,*.rake} set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

au BufNewFile,BufRead *.hamlc set ft=haml

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" Map F5 to clear ctrlp cache
cmap <F5> :ClearCtrlPCache<CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
set background=light

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" Ignore source map directories
let g:ctrlp_custom_ignore = {
  \ 'dir': 'public/assets/source_maps'
  \ }

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
set showcmd
"hi CursorLine cterm=NONE ctermbg=8 ctermfg=white guibg=8 guifg=white

autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
" Key Mappings {

  "Disable the ESC key (use C-c)
  inoremap <esc> <nop>
  inoremap <C-c> <esc>
  "Disable the backspace key (use C-w C-h)
  inoremap <bs> <nop>
  inoremap <Left> <nop>
  inoremap <Right> <nop>
  inoremap <Up> <nop>
  inoremap <Down> <nop>

  "Easy editing of .vimrc file
  nmap <leader>v :tabedit $MYVIMRC<CR>

  " Easier moving in tabs and windows
  map <C-J> <C-W>j
  map <C-K> <C-W>k
  map <C-L> <C-W>l
  map <C-H> <C-W>h


  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

  " Shortcuts
  " Change Working Directory to that of the current file
  cmap cwd lcd %:p:h
  cmap cd. lcd %:p:h

  " visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv

  "set hidden allows navigation between unsaved buffers without an error
  set hidden

  "stop highlighting with esc or enter"
  nnoremap <CR> :noh<CR><CR>
  nnoremap <ESC> :noh<CR><ESC>


  "Remap Q so it doesn't enter e mode, but triggers macro recording instead"
  nnoremap Q q
" }


  nnoremap <Leader>rh :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>
  nnoremap <Leader>rt :%s/ThrowError(\([^)]*\))/flash[:alert] = \1/g<CR>
  nnoremap <Leader>rw :%s/ThrowWarning(\([^) ]*\))/flash[:warning] = \1/g<CR>
" Language addons {
    " Java {
        autocmd Filetype java set makeprg=javac\ %
        set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
        map <C-7> :make<Return>:copen<Return>
        map <C-8> :cprevious<Return>
        map <C-9> :cnext<Return>
    " }
" }

" Cucumber alignment {
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Remove whitespace from a file
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

autocmd BufWritePre *.* :call Preserve("%s/\\s\\+$//e")
set wig=images/**/*,*.png,*.jpg,*.gif,*.ico

"Test Commands
function! InTestFile()
  return match(expand("%"), '\(\.feature\|_spec\.rb\|_test\.rb\)$') != -1
endfunction

function! DetermineTestRunner()
  let file_path = expand("%")
  if match(file_path, '\.feature$') != -1
    return 'spring cucumber'
  elseif match(file_path, '_spec\.rb$') != -1
    return 'spring rspec'
  else
    return 'ruby -Itest'
  endif
endfunction

function! RunCurrentTest(with_line)
  if InTestFile()
    call RunVimTmuxCommand("clear; " . DetermineTestRunner() . " " . TestFilePath(a:with_line))
  else
    echo "Running last test case..."
    call RunLastVimTmuxCommand()
  endif
endfunction

function! TestFilePath(with_line)
  let name = bufname('%')
  if a:with_line
    let line = ":" . line(".")
  else
    let line = ''
  endif
  return name . line
endfunction

"Maping for vimux
" Run the current file and line
map <Leader>rr :call RunCurrentTest(1)<CR>

" Run the current file
map <Leader>rb :call RunCurrentTest(0)<CR>

" " Prompt for a command to run
map <Leader>rp :call PromptVimTmuxCommand()<CR>

" " Run last command executed by RunVimTmuxCommand
map <Leader>rl :call RunLastVimTmuxCommand()<CR>

" " Inspect runner pane
map <Leader>ri :call InspectVimTmuxRunner()<CR>

" " Close all other tmux panes in current window
map <Leader>rx :call CloseVimTmuxPanes()<CR>

" " Interrupt any command running in the runner pane
map <Leader>rs :call InterruptVimTmuxRunner()<CR>

" Add visual mode dot command
vnoremap . :normal .

"" Eval script
fun! EvalVimScriptRegion(s,e)
  let lines = getline(a:s,a:e)
  let file = tempname()
  cal writefile(lines,file)
  redir @e
  silent exec ':source '.file
  cal delete(file)
  redraw
  redir END
  echo "Region evaluated."

  if strlen(getreg('e')) > 0
    10new
    redraw
    silent file "EvalResult"
    setlocal noswapfile  buftype=nofile bufhidden=wipe
    setlocal nobuflisted nowrap cursorline nonumber fdc=0
    " syntax init
    set filetype="eval"
    syn match ErrorLine +^E\d\+:.*$+
    hi link ErrorLine Error
    silent $put =@e
  endif
endf
augroup VimEval
  au!
  au filetype vim :command! -range Eval  :cal EvalVimScriptRegion(<line1>,<line2>)
  au filetype vim :vnoremap <silent> e   :Eval<CR>
augroup END

