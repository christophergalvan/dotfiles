"
" Personal preference .vimrc file
" Maintained by Christopher Galvan <cgalvan@gmail.com>
"
" =====================================================
" =====================================================
"
" IMPORTANT
"
" =====================================================
" =====================================================

" use vim settings, rather than vi settings. This must be first because it
" changes other options as a side effect.
set nocompatible

" remove all auto commands for the group
autocmd!

" automatic reloading of .vimrc after changes
autocmd bufwritepost _vimrc source %

" This tells vim to keep a backup copy of a file when overwriting it. But not
" on the VMS system, since it keeps old versions of files already. The backup
" file will have the same name as the original file with "~" added.
if has("vms")
 set nobackup
else
 set backup
endif

" This switches on three very clever mechanisms:
" 1. Filetype detection.
" Whenever you start editing a file, Vim will try to figure out what kind of
" file this is. When you edit "main.c", Vim will see the ".c" extension and
" recornize this as a "C" filetype. When you edit a file that start with
" "#!/bin/sh", Vim will recognize it as a "sh" filetype.
" The filetype detection is sued for syntax highlighting and the other two
" items below.
"
" 2. Using filetype plugin files
" Many different filetypes are edited with different options. For example,
" when you edit a "C" file, it's very useful for set teh 'cindent' option to
" automatically indent the lines. These commonly useful option settings are
" included with Vim in filetype plugins. You can also add you own.
"
" 3. Using indent files
" When editing programs, the indent of a line can often be computed
" automatically. Vim comes with these indent rules for a number of
" filetypes.
filetype off
filetype plugin indent on
syntax on

" This makes Vim break text to avoid lines getting longer than 78 characters.
" But only for files that have been detected to be plain text. There are
" actually two parts here. "autocmd FileType text" is an autocommand. This
" defines that when the file type is set to "text" the following command is
" automatically executed. "setlocal textwidth=78" sets the 'textwidth' option
" to 78, but only locally in one file.
autocmd FileType text setlocal textwidth=183

" remap leader to comma
let mapleader=","

" ================================================
" ================================================
" MOVING AROUND, SEARCHING, PATTERNS AND HELP
" ================================================
" ================================================

" specify which commands wrap to another line
set ww=b,s

" search commands wrap around the end of the buffer
set wrapscan

" show match for partly type search command
set incsearch

" ignore case when using a search pattern
set ignorecase

" override 'ignorecase' when pattern has uppercase characters
set smartcase

" make delete key in Normal mode remove the persistently highlighted matches
nmap <silent> <BS> :nohlsearch<CR>

" keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" jump to start and end of line using the home row keys
noremap H ^
noremap L $

" use arrow keys to navigate after :vimgrep or :helpgrep
nmap <silent> <RIGHT>        :cnext<CR>
nmap <silent> <RIGHT><RIGHT> :cnfile<CR><C-G>
nmap <silent> <LEFT>         :cprev<CR>
nmap <silent> <LEFT><LEFT>   :cpfile<CR><C-G>

" make :help appear in a full-screen tab, instead of a window
    "Only apply to .txt files...
    augroup HelpInTabs
        autocmd!
        autocmd BufEnter *.txt call HelpInNewTab()
    augroup END

    "Only apply to help files...
    function! HelpInNewTab()
        if &buftype == 'help'
            "Convert the help window to a tab..
            execute "normal \<C-W>T"
        endif
    endfunction

" make % match = and ; 
set matchpairs+==:;

" ================================================
" ================================================
" TAGS
" ================================================
" ================================================
"
" ================================================
" ================================================
" DISPLAYING TEXT
" ================================================
" ================================================

" number of screen lines to show around the cursor
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

"
" ================================================
" ================================================
" SYNTAX HIGHLIGHTING AND SPELLING
" ================================================
" ================================================

" highlight the screen line of the cursor
set cursorline

" highlight all matches for the last used search pattern
set hlsearch

" columns to highlight
if exists('+colorcolumn')
	set colorcolumn=185
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>185v.\+', -1)
endif

" toggle search highlights
noremap <space> :set hlsearch! hlsearch?<CR>

" highlight word at cursor without changing position
noremap <Leader>h *<C-O>

" colorscheme
colorscheme darkblue

" ================================================
" ================================================
" MULTIPLE WINDOWS
" ================================================
" ================================================

" easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ================================================
" ================================================
" MULTIPLE TAB PAGES
" ================================================
" ================================================

" ================================================
" ================================================
" TERMINAL
" ================================================
" ================================================

" show info in the window title
set title

" ================================================
" ================================================
" USING THE MOUSE
" ================================================
" ================================================
"
" ================================================
" ================================================
" PRINTING
" ================================================
" ================================================
"
" ================================================
" ================================================
" MESSAGES AND INFO
" ================================================
" ================================================

" show (partial) command keys in the status line
set showcmd

" display the current mode in the status line
set showmode

" show cursor position below each window
set ruler

" ===============================================
" ===============================================
" SELECTING TEXT
" ===============================================
" ===============================================

" select all text in the current buffer
map <Leader>a ggVG

" ===============================================
" ===============================================
" EDITING TEXT
" ===============================================
" ===============================================

"specifices what <BS>, CTRL-W, etc. can do in Insert mode
set bs=indent,eol,start

" when inserting a bracket, briefly jump to its match
set showmatch

" enable persistent undo
if exists("+undofile")
    set udf
    set undodir=~/.vimundo
endif

" remove all the trailing whitespaces
noremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" ===============================================
" ===============================================
" TABS AND INDENTING
" ===============================================
" ===============================================

"number of spaces a <Tab> in the text stands for
set ts=4

"number of spaces used for each step of (auto)indent
set sw=4

" a <Tab> in an indent inserts 'shiftwidth' spaces
set smarttab

" if non-zero, number of spaces to insert for a <Tab>
set sts=4

" expend <Tab> to spaces in Insert mode
set expandtab

" automatically set the indent of a new line
set autoindent

" do clever autoindenting
set smartindent

" copy whitespace for indenting from previous line
set copyindent

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" =============================================
" =============================================
" FOLDING
" =============================================
" =============================================

" set to display all folds open
set foldenable

" =============================================
" =============================================
" DIFF MODE
" =============================================
" =============================================
"
" =============================================
" =============================================
" MAPPING
" =============================================
" =============================================

" use jk as <Esc> alternative
inoremap jk <Esc>

" =============================================
" =============================================
" READING AND WRITING FILES
" =============================================
" =============================================

" change to directory of file in buffer
set autochdir

" =============================================
" =============================================
" THE SWAP FILE
" =============================================
" =============================================
"
" =============================================
" =============================================
" COMMAND LINE EDITING
" =============================================
" =============================================

" how many command lines are remembered
set history=1000

" =============================================
" =============================================
" EXECTUTING EXTERNAL COMMANDS
" =============================================
" =============================================
"
" =============================================
" =============================================
" RUNNING MAKE AND JUMPING TO ERRORS
" =============================================
" =============================================
"
" =============================================
" =============================================
" LANGUAGE SPECIFIC
" =============================================
" =============================================
"
" =============================================
" =============================================
" MULTI-BYTE CHARACTERS
" =============================================
" =============================================

" character encoding used in Vim
set enc=utf-8

" character encoding for the current file
set fenc=utf-8

" ====================================
" ====================================
" VARIOUS
" ====================================
" ====================================

" setup Pathogen to manage plugins
" execute pathogen#infect()
