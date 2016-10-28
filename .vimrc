"-------------------------------------------------------------------------------
" I. PLUGIN
"
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"-------------------------------------------------------------------------------
let mapleader = "\\"
let maplocalleader = "\\"

"-------------------------------------------------------------------------------
" II. OPTIONS
"-------------------------------------------------------------------------------
" 1 IMPORTANT
set nocompatible
set pastetoggle=<F3>

" 2 MOVING AROUND, SEARCHING AND PATTERNS
set whichwrap+=<,>,[,],s,b
set incsearch
set magic
set noignorecase
set smartcase

" 3 TAGES
" 4 DISPLAYING TEXT
set fillchars=vert:\ ,stl:\ ,stlnc:\
set number

" 5 SYNTAX, HIGHLIGHTING AND SPELLING
syntax on
filetype plugin indent on
set hlsearch
set cursorline

" 6 MULTIPLE WINDOWS
set laststatus=2

" 7 MULTIPLE TAB PAGES
" 8 TERMINAL
" 9 USING THE MOUSE
set mouse=a

" 10 PRINTING
" 11 MESSAGES AND INFO
set showcmd
set showmode
set ruler
set report=0
set confirm
set noerrorbells

" 12 SELECTING TEXT
set selection=exclusive
set selectmode=mouse,key

" 13 EDITING TEXT
set backspace=2
set formatoptions+=t
set completeopt=longest,menu
set showmatch
set matchtime=1

" 14 TABS AND INDENTING
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set noexpandtab
set autoindent
set smartindent
set cindent

" 15 FOLDING
" 16 DIFF MODE
" 17 MAPPING
" 18 READING AND WRITING FILES
set nowritebackup
set nobackup
set autowrite
set autoread

" 19 THE SWAP FILE
set noswapfile

" 20 COMMAND LINE EDITING
set history=500
set wildmenu

" 21 EXECUATING EXTERNAL COMMANDS
" 22 RUNNING MAKE AND JUMPING TO ERRORS
" 23 LANGUAGE SPECIFIC

" 24 MULTI-BYTE CHARACTERS
" 25 VARIOUS
set viminfo+=!

"-------------------------------------------------------------------------------
" III. MAPPING
"-------------------------------------------------------------------------------
nnoremap <leader>rc :vsp $MYVIMRC<cr>
nnoremap <leader>sr :w<esc>:source $MYVIMRC<cr>:noh<cr>

nnoremap <c-j> <c-W>j
nnoremap <c-k> <c-W>k
nnoremap <c-h> <c-W>h
nnoremap <c-l> <c-W>l

inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i
"inoremap " ""<esc>i
"inoremap ' ''<esc>i

inoremap ) <c-r>=ClosePair(')')<cr>
inoremap } <c-r>=ClosePair('}')<cr>
inoremap ] <c-r>=ClosePair(']')<cr>
"inoremap " <c-r>=QuoteDelim('"')<cr>
"inoremap ' <c-r>=QuoteDelim("'")<cr>

inoremap <expr> <bs> DeleteEmptyPair()

vnoremap ( <esc>`>a)<esc>`<i(<esc>
vnoremap ) <esc>`>a)<esc>`<i(<esc>
vnoremap { <esc>`>a}<esc>`<i{<esc>
vnoremap } <esc>`>a}<esc>`<i{<esc>
vnoremap [ <esc>`>a]<esc>`<i[<esc>
vnoremap ] <esc>`>a]<esc>`<i[<esc>
vnoremap < <esc>`>a><esc>`<i<<esc>
vnoremap > <esc>`>a><esc>`<i<<esc>
vnoremap " <esc>`>a"<esc>`<i"<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>

func! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<right>"
	else
		return a:char
	endif
endfunc

func! QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
		return a:char
	elseif line[col - 1] == a:char
		return "\<right>"
	else
		return a:char.a:char."\<left>"
	endif
endfunc

func! DeleteEmptyPair()
	if InAnEmptyPair()
		return "\<left>\<del>\<del>"
	else
		return "\<bs>"
	endif
endfunc

func! InAnEmptyPair()
	let cur = strpart(getline('.'),getpos('.')[2]-2,2)
	for pair in (split(&matchpairs,',') + ['":"',"':'"])
		if cur == join(split(pair,':'),'')
			return 1
		endif
	endfor
	return 0
endfunc

"-------------------------------------------------------------------------------
" IV. AUTOCOMMAND
"-------------------------------------------------------------------------------
autocmd FileType cpp nnoremap <buffer> <space> :e %:t:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>
autocmd FileType cpp nnoremap <buffer> <localleader>sp :sp %:t:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>
autocmd FileType cpp nnoremap <buffer> <localleader>vsp :vsp %:t:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>

autocmd FileType cpp inoremap <buffer> { {}<esc>i<cr><esc>O

autocmd FileType cpp setlocal textwidth=80
autocmd FileType cpp setlocal cc=80

" Set default size
set guifont=Monospace\ Bold\ 18

" Set default color theme
colorscheme monokai
