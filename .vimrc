" Modeline and Notes {
" vim: set filetype=vim foldmarker={,} foldlevel=0 foldmethod=marker nospell:
"
"                    __ _ _____              _
"         ___ _ __  / _/ |___ /      __   __(_)_ __ ___
"        / __| '_ \| |_| | |_ \ _____\ \ / /| | '_ ` _ \
"        \__ \ |_) |  _| |___) |_____|\ V / | | | | | | |
"        |___/ .__/|_| |_|____/        \_/  |_|_| |_| |_|
"            |_|
"
"   This is the personal .vimrc file of Steve Francia.
"   While much of it is beneficial for general use, I would
"   recommend picking out the parts you want and understand.
"
"   You can find me at http://spf13.com
" }

" Environment {
    " Basics {
        set nocompatible        " must be first line
        set background=dark     " Assume a dark background
		if v:version >= 703
			" Mark ideal text width (set by textwidth)
			set colorcolumn=+1
		endif
		set clipboard=unnamed
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if has('win32') || has('win64')
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }
    "
    " Setup Bundle Support {
    " The next two lines ensure that the ~/.vim/bundle/ system works
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
    " }

" }

" Bundles {
    " Deps
        Bundle 'gmarik/vundle'
        Bundle 'MarcWeber/vim-addon-mw-utils'
        Bundle 'tomtom/tlib_vim'
        if executable('ack-grep')
            let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            Bundle 'mileszs/ack.vim'
        elseif executable('ack')
            Bundle 'mileszs/ack.vim'
        endif

    " Use local bundles if available {
        if filereadable(expand("~/.vimrc.bundles.local"))
            source ~/.vimrc.bundles.local
        endif
    " }

    " In your .vimrc.bundles.local file"
    " list only the plugin groups you will use
    if !exists('g:spf13_bundle_groups')
        let g:spf13_bundle_groups=['general', 'programming', 'php', 'ruby', 'python', 'javascript', 'html', 'go', 'misc']
    endif

    " To override all the included bundles, put
    " g:override_spf13_bundles = 1
    " in your .vimrc.bundles.local file"
    if !exists("g:override_spf13_bundles")

    " General
        if count(g:spf13_bundle_groups, 'general')
			Bundle 'ciaranm/detectindent'
            Bundle 'scrooloose/nerdtree'
            Bundle 'tpope/vim-surround'
			Bundle 'tpope/vim-repeat'
			Bundle 'tpope/vim-abolish'
			Bundle 'tpope/vim-unimpaired'
            Bundle 'kien/ctrlp.vim'
            Bundle 'vim-scripts/sessionman.vim'
            "Bundle 'Lokaltog/vim-powerline'
            Bundle 'Lokaltog/vim-easymotion'
            Bundle 'godlygeek/csapprox'
            Bundle 'flazz/vim-colorschemes'
            Bundle 'altercation/vim-colors-solarized'
            Bundle 'myusuf3/numbers.vim'
            Bundle 'vim-scripts/YankRing.vim.git'
			Bundle 'mattn/emmet-vim'
            Bundle 'vim-scripts/jsbeautify.git'
            Bundle 'aaronbieber/quicktask.git'
			Bundle 'sjl/gundo.vim.git'
        endif

    " General Programming
        if count(g:spf13_bundle_groups, 'programming')
            " Pick one of the checksyntax, jslint, or syntastic
            Bundle 'scrooloose/syntastic'
            Bundle 'vim-scripts/UltiSnips.git'

            Bundle 'tpope/vim-fugitive'
			Bundle 'airblade/vim-gitgutter'
            Bundle 'scrooloose/nerdcommenter'
            Bundle 'godlygeek/tabular'
			"if executable('ctags')
                Bundle 'majutsushi/tagbar'
            "endif
            Bundle 'joonty/vdebug.git'
        endif

    " PHP
        if count(g:spf13_bundle_groups, 'php')
			Bundle 'vim-scripts/phpfolding.vim'
			Bundle 'StanAngeloff/php.vim'
			Bundle 'shawncplus/phpcomplete.vim'
            "Bundle 'spf13/PIV'
        endif

    " Python
        if count(g:spf13_bundle_groups, 'python')
            " Pick either python-mode or pyflakes & pydoc
            Bundle 'klen/python-mode'
            "Bundle 'python.vim'
            "Bundle 'python_match.vim'
            "Bundle 'pythoncomplete'
			"Bundle 'davidhalter/jedi-vim'
			"Bundle 'fs111/pydoc.vim'
        endif

    " Javascript
        if count(g:spf13_bundle_groups, 'javascript')
            Bundle 'leshill/vim-json'
            Bundle 'groenewege/vim-less'
            Bundle "pangloss/vim-javascript"
			Bundle 'kchmck/vim-coffee-script'
        endif

    " HTML
        if count(g:spf13_bundle_groups, 'html')
            "Bundle 'amirh/HTML-AutoCloseTag'
            "Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
						Bundle 'hail2u/vim-css3-syntax'
						Bundle 'othree/html5.vim'
        endif

    " Ruby
        if count(g:spf13_bundle_groups, 'ruby')
            Bundle 'tpope/vim-rails'
            let g:rubycomplete_buffer_loading = 1
            "let g:rubycomplete_classes_in_global = 1
            "let g:rubycomplete_rails = 1
        endif

    " Go
        if count(g:spf13_bundle_groups, 'go')
			set rtp+=$GOROOT/misc/vim
			autocmd BufWritePost *.go :silent Fmt
        endif

    " Clojure
        if count(g:spf13_bundle_groups, 'clojure')
            Bundle 'guns/vim-clojure-static'
			Bundle 'tpope/vim-fireplace'
			Bundle 'tpope/vim-classpath'
        endif

    " Misc
        if count(g:spf13_bundle_groups, 'misc')
            Bundle 'tpope/vim-markdown'
            Bundle 'spf13/vim-preview'
            Bundle 'tpope/vim-cucumber'
            Bundle 'Puppet-Syntax-Highlighting'
        endif

    " Twig
        if count(g:spf13_bundle_groups, 'twig')
            Bundle 'beyondwords/vim-twig'
        endif
    endif
" }

" General {
    set background=dark         " Assume a dark background
    if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    endif
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " syntax highlighting
    set mouse=a                 " automatically enable mouse usage
    scriptencoding utf-8
    set enc=utf-8 						" Use UTF-8 as the default buffer encoding
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    " always switch to the current file directory.

    se switchbuf+=useopen         " for things like quickfix use open buffer otherwise open in split

    " set autowrite                  " automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
    set viewoptions=options,folds,cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore         " allow for cursor beyond last character
    set history=1000                " Store a ton of history (default is 20)
    set spell                       " spell checking on
    set hidden                      " allow buffer switching without saving

	au VimEnter * highlight clear SignColumn
	
    " Setting up the directories {
        set backup                      " backups are nice ...
        if has('persistent_undo')
            set undofile                "so is persistent undo ...
            set undolevels=1000         "maximum number of changes that can be undone
            set undoreload=10000        "maximum number lines to save for undo on a buffer reload
        endif
        " Could use * rather than *.*, but I prefer to leave .files unsaved
        au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
        au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)
		au BufWinEnter *.* silent! foldopen "open current fold
    " }
" }

" Vim UI {
    set tabpagemax=15               " only show 15 tabs
    set showmode                    " display the current mode

    "set cursorline                  " highlight current line

    if has('cmdline_info')
        set ruler                   " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
        set showcmd                 " show partial commands in status line and
                                    " selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\    " Filename
        set statusline+=%w%h%m%r " Options
        set statusline+=%{fugitive#statusline()} "  Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " filetype
        set statusline+=\ [%{getcwd()}]          " current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
	set matchtime=1					" 10th of second 
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set winminheight=0              " windows can be 0 line high
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    set wildmenu                    " show list instead of just completing
    set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
    set scrolljump=5                " lines to scroll when cursor leaves screen
    set scrolloff=3                 " minimum lines to keep above and below cursor
    set foldenable                  " auto fold code 
    set list
	set listchars=tab:▸.,trail:¬,extends:#,nbsp:. " Highlight problematic whitespace
    set noerrorbells                " don't beep!
    set visualbell                  " don't beep!
    set t_vb=                       " don't beep! 

" }

" Formatting {
    set nowrap                      " wrap long lines
    set autoindent                  " indent at the same level of the previous line
    set shiftwidth=4                " use indents of 4 spaces
    set noexpandtab                 " tabs are tabs
    set tabstop=4                   " an indentation every four columns
    set softtabstop=4               " let backspace delete indent
    "set matchpairs+=<:>                " match, to be used with %
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    " This is really slow sometimes...
    ""autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

    "Higlight current line only in insert mode
    autocmd InsertLeave * set nocursorline
    autocmd InsertEnter * set cursorline
    highlight CursorLine ctermbg=236 cterm=NONE

    " HTML (tab width 2 chr, no wrapping)
    autocmd FileType html set sw=2
    autocmd FileType html set ts=2
    autocmd FileType html set sts=2
		autocmd FileType html set expandtab
    autocmd FileType html set textwidth=0
    " XHTML (tab width 2 chr, no wrapping)
    autocmd FileType xhtml set sw=2
    autocmd FileType xhtml set ts=2
    autocmd FileType xhtml set sts=2
    autocmd FileType xhtml set textwidth=0
    " CSS (tab width 2 chr, wrap at 79th char)
    autocmd FileType css set sw=2
    autocmd FileType css set ts=2
    autocmd FileType css set sts=2
    autocmd FileType css set textwidth=79
    autocmd FileType css set iskeyword+=-
    " Javascript
    autocmd FileType javascript set sw=2
    autocmd FileType javascript set ts=2
    autocmd FileType javascript set sts=2
    autocmd FileType javascript set textwidth=79
    autocmd FileType javascript set iskeyword+=$
    " PHP
    autocmd FileType php set sw=4
    autocmd FileType php set ts=4
    autocmd FileType php set sts=4
    autocmd FileType php set textwidth=79
    autocmd FileType php set formatoptions+=tcqlro
    autocmd FileType php set iskeyword=@,48-57,_,192-255
    autocmd FileType php noremap <C-L> :w!<CR>:!php %<CR>

    " Clojure
    autocmd FileType clj set sw=2
    autocmd FileType clj set ts=2
    autocmd FileType clj set sts=2
    autocmd FileType clj set textwidth=79
    autocmd FileType clj set formatoptions+=tcqlro

    autocmd FileType python let g:neocomplcache_disable_auto_complete = 0
    autocmd FileType python set sw=4
    autocmd FileType python set ts=4
    autocmd FileType python set sts=4
    autocmd FileType python set textwidth=79
    autocmd FileType python noremap <C-L> :w!<CR>:!python %<CR>

    autocmd FileType qf wincmd J "open quickfix on bottom
    " Maximize the window after entering it, be sure to keep the quickfix window
    " at the specified height.
    autocmd FileType qf set nonu
    autocmd FileType qf set nowrap
    
" }

" Key (re)Mappings {

    "The default leader is '\', but many people prefer ',' as it's in a standard
    "location
    let mapleader = ','

    map <F11> <ESC>:se relativenumber!<CR>:se nu!<CR>
    imap <F11> <ESC>:se relativenumber!<CR>:se nu!<CR>
    map <F12> <ESC>:se paste!<CR>
    imap <F12> <ESC>:se paste!<CR>a
    map <leader>nn <ESC>:NumbersToggle<CR>

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :

    " Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " Stupid shift key fixes
    command -nargs=* -complete=file W w <args>
    command -nargs=* -complete=file Q q <args>
    command -nargs=* -complete=file WQ wq <args>
    command -nargs=* -complete=file Wq wq <args>
    cmap Tabe tabe

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    """ Code folding options
    nmap <leader>0 :set foldlevel=0<CR>
    nmap <leader>1 :set foldlevel=1<CR>
    nmap <leader>2 :set foldlevel=2<CR>
    nmap <leader>3 :set foldlevel=3<CR>
    nmap <leader>4 :set foldlevel=4<CR>
    nmap <leader>5 :set foldlevel=5<CR>
    nmap <leader>6 :set foldlevel=6<CR>
    nmap <leader>7 :set foldlevel=7<CR>
    nmap <leader>8 :set foldlevel=8<CR>
    nmap <leader>9 :set foldlevel=9<CR>

    "clearing highlighted search
    nmap <silent> <leader>/ :nohlsearch<CR>

	" disable help
	map <F1> <Esc>
	imap <F1> <Esc>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

		" visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Fix home and end keybindings for screen, particularly on mac
    " - for some reason this fixes the arrow keys too. huh.
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    " Fix home / end bindings for Terminal on ubuntu
    map OH	g0
    map OF	$
    imap OH	<C-O>g0
    imap OF	<C-O>$


    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=
    " Maximum current viewport
    map <leader>+ <C-w>_

    " Easier horizontal scrolling
    map zl zL
    map zh zH
	
    " Buffer navigation
    map <leader><RIGHT> :bn<cr>	
    map <leader><LEFT> :bp<cr>	

    if count(g:spf13_bundle_groups, 'php')
      "nnoremap <silent> <buffer> <C-]> :PhpSearchContext<cr>
    endif

    " map CTRL-L to piece-wise copying of the line above the current one
    imap <C-L> @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s
" }

" Plugins {

    " PIV {
        let g:DisableAutoPHPFolding = 0
        let g:PIVAutoClose = 0
    " }

    " Misc {
        let g:NERDShutUp=1
        let b:match_ignorecase = 1
    " }

    " OmniComplete {
        if has("autocmd") && exists("+omnifunc")
            autocmd Filetype *
                \if &omnifunc == "" |
                \setlocal omnifunc=syntaxcomplete#Complete |
                \endif
        endif

        hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

        " some convenient mappings
        inoremap <expr> <Esc>      pumvisible() ? "\<C-e>\<Esc>" : "\<Esc>"
		" smartinput maps <CR> so don't use this. Also see neocomplcache
		" override below
        inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

        " automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt=menu,preview,longest
		" This stops annoying resize of splits when preview closes
		set noequalalways 
    " }

    " Ctags {
        set tags=./tags;/,~/.vimtags
    " }

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        "au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        "nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    " }

    " NerdTree {
        map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
    " }

    " Tabularize {
        "if exists(":Tabularize")
          nmap <Leader>a= :Tabularize /=<CR>
          vmap <Leader>a= :Tabularize /=<CR>
          nmap <Leader>a: :Tabularize /:<CR>
          vmap <Leader>a: :Tabularize /:<CR>
          nmap <Leader>a:: :Tabularize /:\zs<CR>
          vmap <Leader>a:: :Tabularize /:\zs<CR>
          nmap <Leader>a, :Tabularize /,<CR>
          vmap <Leader>a, :Tabularize /,<CR>
          nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
          vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

          nmap <Leader>a> :Tabularize /=><CR> 
          vmap <Leader>a> :Tabularize /=><CR>


          " The following function automatically aligns when typing a
          " supported character
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
        "endif
     " }

     " Session List {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
     " }

     " JSON {
        ""nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
     " }

     " PyMode {
        let g:pymode_lint_checker = "pyflakes"
     " }

     " ctrlp {
		let g:ctrlp_root_markers = ['.project','.project_root', '.git']
        let g:ctrlp_working_path_mode = 'rc'
        nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$|tmp$',
            \ 'file': '\.exe$\|\.so$\|\.dll$|\.sql$|\.pdf$' }

        let g:ctrlp_match_window_bottom = 0 " show at top of screen
        let g:ctrlp_match_window_reversed = 0 " show top to bottom
        let g:ctrlp_clear_cache_on_exit = 0 " preserve cache on exit
        let g:ctrlp_dotfiles = 0 			" don't scan dot files

        let g:ctrlp_open_new_file = 'h' 	" open new files created in a split
        let g:ctrlp_open_multiple_files = 'hj'
        let g:ctrlp_map = '<c-t>' 			" I used to use commandT... keep binding for convenience

     "}

     " TagBar {
        nnoremap <silent> <leader>tt :TagbarToggle<CR>

        let g:tagbar_singleclick = 1
     "}

     " ZenCoding {"
		let g:user_emmet_leader_key = '<c-b>'
     " }
     
     " PythonMode {
     " Disable if python support not present
        if !has('python')
           let g:pymode = 1
        endif
     " }

     " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
     "}

     " neocomplcache {
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_underbar_completion = 0
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_enable_auto_delimiter = 1

		let g:neocomplcache_caching_limit_file_size = 5000000

		"let g:neocomplcache_enable_cursor_hold_i = 1	

        " AutoComplPop like behavior.
        let g:neocomplcache_enable_auto_select = 0
		" don't auto complete as type, must manually invoke
		let g:neocomplcache_disable_auto_complete = 1

        " SuperTab like snippets behavior.
        "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

        " Plugin key-mappings.
"        imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"        smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"        inoremap <expr><C-g>     neocomplcache#undo_completion()
"        inoremap <expr><C-l>     neocomplcache#complete_common_string()


        " <CR>: close popup
        " <s-CR>: close popup and save indent.
        "inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : smartinput#trigger_or_fallback('<CR>', '<CR>')
	   " inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        "inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>"
        "" <TAB>: completion.
       " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

        " <C-h>, <BS>: close popup and delete backword char.
     "   inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        ""inoremap <expr><BS> pumvisible() ? neocomplcache#smart_close_popup()."\<C-h>" : smartinput#trigger_or_fallback('<BS>', '<BS>')
		"inoremap <expr><BS> pumvisible() ? neocomplcache#smart_close_popup()."\<C-h>" : '<BS>'
        "inoremap <expr><C-y>  neocomplcache#close_popup()
        "inoremap <expr><C-e>  neocomplcache#cancel_popup()
		
		"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
		"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
		"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
		"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
		"autocmd FileType php setlocal omnifunc=eclim#php#complete#CodeComplete
		autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
		autocmd FileType php set keywordprg=pman

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
        "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
        let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
		let g:neocomplcache_omni_patterns.go = '\h\w*\.'

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif


     " }
	 "
	 
	 " Gundo {
        nnoremap <c-u> :GundoToggle<CR>
     " }


     " Powerline {
        let g:Powerline_symbols = 'fancy'
     " }
		
	 " quicktask {
	 let g:quicktask_autosave = 1
	 " }

	 " vdebug {
	 let g:vdebug_options = {
		\ 'server' : '192.168.56.1',
		\ 'continuous_mode' : 0,
	 	\ 'break_on_open': 0 }
	 " }
	 
	 " syntastic {
	 let loaded_xml_syntax_checker = 1
	 let g:syntastic_error_symbol='✗'
	 let g:syntastic_warning_symbol='⚠'
	 let g:syntastic_javascript_checkers = ['jslint']
	 let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
	 " }

	 " Eclim {
	 let g:EclimPhpHtmlValidate = 0
	 let g:EclimBuffersDefaultAction = 'edit'
	 let g:EclimPhpSearchSingleResult='edit'
	 let g:EclimHtmlValidate = 0
	 let g:EclimXmlValidate = 0 
	 " }
" }

" GUI Settings {
    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " remove the toolbar
        set lines=40                " 40 lines of text instead of 24,
        if has("gui_macvim") 
            set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h15
        elseif has("gui_gtk2")
            set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        else
            set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
        endif
        if has('gui_macvim')
            set transparency=5          " Make the window slightly transparent
        endif
    else
        if &term == 'xterm' || &term == 'screen' || &term == 'screen-256color'
            set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif
" }

"if &term =~ "xterm.*" || &term =~ "screen256.*"
" Toggle pasting when using system clipboard
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
"endif

"colorscheme zoria256
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_visibility = 'low'
colorscheme solarized
let g:Powerline_colorscheme = 'solarized256'

"let g:Powerline_theme = 'solarized256'

 " Functions {

function! InitializeDirectories()
    let separator = "."
    let parent = $HOME
    let prefix = '.vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . prefix . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

" }

" Convenience function to rebuild ctags
" This assumes you are in the correct directory 
func! RebuildTags()
	:!ctags -f tags .
endfunc

func! TabSpaceSettings()
	call inputsave()
	let option = input("Select settings:\n\n1. Hard 4 space tabs (Bazooka)\n2. 2 Space soft tabs (Drupal)\n3. 4 space soft tabs\n\n")
	call inputrestore()
	if option == '1'
		set noexpandtab
		set tabstop=4
		set shiftwidth=4
		set softtabstop=4
	endif
	if option == '2'
		set expandtab
		set tabstop=2
		set shiftwidth=2
		set softtabstop=2
	endif
	if option == '3'
		set expandtab
		set tabstop=4
		set shiftwidth=4
		set softtabstop=4
	endif
endfunc

nmap <leader><tab> :call TabSpaceSettings()<CR>

" { Diff current unsaved file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
" }

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }

" Use local gvimrc if available and gui is running {
    if has('gui_running')
        if filereadable(expand("~/.gvimrc.local"))
            source ~/.gvimrc.local
        endif
    endif
" }
