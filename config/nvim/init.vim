
" ============================================================================ "
" ===                          GLOBAL OPTIONS                              === "
" ============================================================================ "

set autoindent              "Enable autoindent for new lines
set smartindent             "Smart indent using language syntax
set smarttab                "Smart indent and delete at bol
set autoread                "Autoload file changes
set backspace=indent,eol,start "Bksp over indent, eol, start of insert
set clipboard=unnamedplus   "Use system clipboard
set colorcolumn=81          "Visual soft margin
"set cursorline             "Highlight current line
set formatoptions+=r        "Add comment leaders to new comment lines
set formatoptions+=j        "Delete comment leaders when joining lines
set hidden                  "Don't close hidden buffers
set hlsearch                "Hilight search results
set ignorecase              "Case insensitive search
set inccommand=nosplit      "Live preview for :%s/search/replace
set incsearch               "Begin searching immediately
set lazyredraw              "Redraw only when needed
set list listchars=tab:»·,trail:· "Display tabs and trailing spaces
set mouse=a                 "Enable all mouse actions
set noerrorbells            "Silence error bells
set scrolloff=5             "Line offset for cursor when scrolling
set shortmess=atI           "Shorten msgs, hide start msg
set showcmd                 "Display commands during entry
"set spell spelllang=en_us  "Spellchecking
set tabstop=4 shiftwidth=4 softtabstop=4 "Consistent tab widths
set tags=tags               "Use ctags (brew install ctags)
set updatetime=300
set expandtab               "All tabs are spaces
set whichwrap=<,>,h,l       "Wrap cursor on arrows and h,l
set wildmenu                "Visual command autocomplete
set wildignore=*.swp,*.bak,*.pyc,*.class,tags
set wrap linebreak nolist   "Soft wrap without adding lf
"Set vim path, used in: Plug, undo
if has('nvim')
  let vimpath = '$HOME/.config/nvim'
else
  let vimpath = '$HOME/.vim'
endif
let &runtimepath.=','.vimpath
"Keep undo history across sessions
if has('persistent_undo')
  let undopath = expand(vimpath . '/undo')
  call system('mkdir ' . vimpath)
  call system('mkdir ' . undopath)
  let &undodir = undopath
  set undofile
  set undolevels=512
  set undoreload=128
endif

" ============================================================================ "
" ===                                MAPS                                  === "
" ============================================================================ "

" <leader> is <space>
let mapleader = " "
"Command with ; rather than shift+;
noremap ; :
noremap : ;
"Tab controls
"noremap <C-l> :tabnext<CR>
"noremap <C-h> :tabprevious<CR>
"Page up/down, center cursor
noremap <C-j> <C-f>M
noremap <C-k> <C-b>M
"Allow move on wrapped lines
noremap j gj
noremap k gk
nnoremap \ :TagbarToggle<CR>
"return to [n]ormal
inoremap ,n <Esc> 
"[o]ut to normal
inoremap <C-o> <Esc> 
nnoremap <C-s> :w<CR>
nnoremap <C-c> :q<CR>


" === Colemak === "

"Colemak mnei(hjkl) t(i) <C-n>(f) <C-e>(e)
" sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/
noremap m h|        "move Left
noremap n gj|       "move Down
noremap e gk|       "move Up
noremap i l|        "move Right
noremap t i|        "(t)ype           replaces (i)nsert
noremap T I|        "(T)ype at bol    replaces (I)nsert
noremap E e|        "end of word      replaces (e)nd
noremap h n|        "next match       replaces (n)ext
noremap k N|        "previous match   replaces (N) prev
noremap <C-m> m|    "mark             replaces (m)ark
noremap <C-n> <C-f>M| "Page down, center cursor
noremap <C-e> <C-b>M| "Page up, center cursor
map <Leader>m <Plug>(easymotion-linebackward)
map <leader>n <Plug>(easymotion-j)
map <leader>e <Plug>(easymotion-k)
map <Leader>i <Plug>(easymotion-lineforward)
" easymotion 2-char search: s{char}{char}{label}
nmap s <Plug>(easymotion-overwin-f2)
" fix (i)nner and (t)ill, e.g. (c)hange (i)n (w)ord
nnoremap ci ci|
nnoremap di di|
nnoremap vi vi|
nnoremap yi yi|
nnoremap ct ct|
nnoremap dt dt|
nnoremap vt vt|
nnoremap yt yt|

noremap <C-g> :GrammarousCheck
noremap <C-G> :GrammarousReset

" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

call plug#begin(vimpath . '/plug')
"Plug 'vim-airline/vim-airline'          " Airline
"Plug 'vim-airline/vim-airline-themes'   " Airline themes
Plug 'itchyny/lightline.vim'            " Lightline
Plug 'tpope/vim-commentary'             " (un)Comment lines
Plug 'tpope/vim-fugitive'               " Git stuff
Plug 'morhetz/gruvbox'                  " Gruvbox colorscheme
Plug 'doums/darcula'                    " Darcula colorscheme
Plug 'chriskempson/base16-vim'          " Base-16 colorscheme
Plug 'jeffkreeftmeijer/vim-dim'         " Dim colorscheme
Plug 'YorickPeterse/vim-paper'          " Paper colorscheme
Plug 'noahfrederick/vim-noctu'          " Noctu colorscheme
Plug 'easymotion/vim-easymotion'        " Mapped to <space><movement>
Plug 'majutsushi/tagbar'                " Visualize ctags
Plug 'nathanaelkane/vim-indent-guides'  " Alternating light/dark indents
Plug 'chrisbra/Colorizer'               " Show hex code color
Plug 'luochen1990/rainbow'              " Rainbow highlight brackets
Plug 'sheerun/vim-polyglot'             " Multi-langsyntax and indent
Plug 'mhinz/vim-startify'               " Start screen with recent files
Plug 'ryanoasis/vim-devicons'           " Nerd Font icons
Plug 'rhysd/vim-grammarous'             " English :GrammarousCheck
Plug 'vim-pandoc/vim-pandoc'            " Pandoc doc converter integration
Plug 'vim-pandoc/vim-pandoc-syntax'     " Pandoc/.md/LaTeX/etc syntax
Plug 'tpope/vim-obsession'              " Autosave session (for tmux)
"Plug 'rust-lang/rust.vim'               " rust support
"Plug 'udalov/kotlin-vim'                " Kotlin TODO: find coc lang server
if has('nvim')
  "denite tui: pip3 install --user pynvim
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} "py syntax
else
  Plug 'Shougo/denite.nvim'       "Denite
  Plug 'roxma/nvim-yarp'          "Denite
  Plug 'roxma/vim-hug-neovim-rpc' "Denite
endif             "When adding new plugs run :PlugInstall
call plug#end()   "When adding deoplete in (old)vim run :UpdateRemotePlugins


" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" === Airline === "
let g:airline_powerline_fonts = 1
"Warning for over-long lines and mixed indents but not trailing whitespace
let g:airline#extensions#whitespace#checks = ['long', 'mixed-indent-file']
"Show full filetype label instead of just 2 or 3 characters, eg "python"
let g:airline_section_x = '%{&filetype}'
"Display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1





" === Lightline === "
" former scheme: 'seoul256' }
let g:lightline = {
  \   'colorscheme': 'darculaOriginal',
  \   'active': {
  \     'left':[ [ 'mode' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#status',
  \   }
  \ }
let g:lightline.separator = {
  \ 'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
  \ 'left': '', 'right': '' 
  \}
"	default: \ 'left': '', 'right': '' 

let g:lightline.tabline = {
  \ 'left': [ ['tabs'] ],
  \ 'right': [ [] ]
  \ }
"set showtabline=2  " Show tabline
set showtabline=0  " Show tabline
set guioptions-=e  " Don't use GUI tabline


" === Misc === "

" Plug 'tpope/vim-commentary'
noremap <leader>/ :Commentary<cr>
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1
let g:grammarous#default_comments_only_filetypes = {
  \ '*' : 1, 'help' : 0, 'markdown' : 0, 'org' : 0,
  \ }
let g:semshi#simplify_markup = v:false
let g:semshi#error_sign = v:false
let g:semshi#update_delay_factor = 0.0005
let g:rustfmt_autosave = 1 "autorun :RustFmt on save
let g:rainbow_active = 1 "Or 0 to :RainbowToggle later
" Markdown: Inline/fenced code block syntax
let g:markdown_fenced_languages = [
  \'bash=sh',
  \'coffee',
  \'css',
  \'erb=eruby',
  \'html',
  \'javascript',
  \'js=javascript', 
  \'json=javascript',
  \'kotlin',
  \'python',
  \'ruby',
  \'sass',
  \'sh',
  \'xml'
  \]
let g:pandoc#syntax#codeblocks#embeds#langs = [
  \'bash=sh',
  \'coffee',
  \'css',
  \'erb=eruby',
  \'html',
  \'javascript',
  \'js=javascript', 
  \'json=javascript',
  \'kotlin',
  \'python',
  \'ruby',
  \'sass',
  \'sh',
  \'xml'
  \]
let g:startify_custom_header = []
let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \]
nmap <Leader> <Plug>(easymotion-prefix)

" === Denite ==="

call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height
"   prompt                  - Customize denite prompt
"   direction               - Set window direction below current pane
"   winminheight            - Set min height for Denite window
"   highlight_mode_insert   - Set h1-CursorLine in insert mode
"   prompt_highlight        - Set color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ ',
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'DiffAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

" === Coc.nvim === "

" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
" :CocInstall coc-python coc-tsserver coc-json coc-html coc-css coc-cmake coc-git coc-markdownlint coc-svg coc-vimlsp coc-eslint

" <tab> to complete and toggle through completions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Enable extensions
"let g:airline_extensions = ['coc']

" ============================================================================ "
" ===                                COLOR                                 === "
" ============================================================================ "

if (has("termguicolors"))
  set termguicolors
endif
syntax enable
set background=dark
"colorscheme gruvbox
"let g:airline_theme='gruvbox'
"let g:gruvbox_italic=1
colorscheme darcula
"colorscheme noctu
"colorscheme base16-default-dark
"Base-16
"https://browntreelabs.com/base-16-shell-and-why-its-so-awsome/
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
"Color overrides
"[xterm-256color reference](https://jonasjacek.github.io/colors)
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi Normal           guibg=grey11 ctermbg=234
autocmd VimEnter,Colorscheme * :hi ColorColumn      guibg=grey7  ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey15 ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey15 ctermbg=235
autocmd VimEnter,Colorscheme * :hi Comment          gui=italic   cterm=italic
"python syntax https://github.com/numirias/semshi
"Soften semshi py colors:
function! SemshiColors()
  hi semshiBuiltin   ctermfg=209 guifg=#ff875f
  hi semshiImported  ctermfg=209 guifg=#ff875f cterm=none gui=none
  hi semshiSelected  ctermfg=223 guifg=#ebdbb2 ctermbg=237 guibg=#3c3836
  hi semshiParameter ctermfg=214 guifg=#ffaf00
endfunction
"Darcula extras
hi! link GitGutterAdd GitAddStripe
hi! link GitGutterChange GitChangeStripe
hi! link GitGutterDelete GitDeleteStripe
let g:gitgutter_sign_removed = '▶'
hi! link CocErrorSign ErrorSign
hi! link CocWarningSign WarningSign
hi! link CocInfoSign InfoSign
hi! link CocHintSign InfoSign
hi! link CocErrorFloat Pmenu
hi! link CocWarningFloat Pmenu
hi! link CocInfoFloat Pmenu
hi! link CocHintFloat Pmenu
hi! link CocHighlightText IdentifierUnderCaret
hi! link CocHighlightRead IdentifierUnderCaret
hi! link CocHighlightWrite IdentifierUnderCaretWrite
hi! link CocErrorHighlight CodeError
hi! link CocWarningHighlight CodeWarning
hi! link CocInfoHighlight CodeInfo
hi! link CocHintHighlight CodeHint

" ============================================================================ "
" ===                              FUNCTIONS                               === "
" ============================================================================ "

function! SetTabsTwoExpand()
  set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
endfunction
function! SetTabsFourExpand()
  set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
endfunction
function! SetTabsFourNoExpand()
  set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
endfunction
augroup user
  autocmd!
  autocmd FileType python call SemshiColors()
  autocmd FileType python call SetTabsFourExpand()
  autocmd FileType java   call SetTabsFourExpand()
  autocmd FileType kotlin call SetTabsFourExpand()
  autocmd FileType make   call SetTabsFourNoExpand()
  autocmd FileType vim    call SetTabsTwoExpand()
  autocmd FileType html   call SetTabsTwoExpand()
  autocmd FileType css    call SetTabsTwoExpand()
  autocmd FileType json syntax match Comment +\/\/.\+$+
  autocmd VimEnter,BufRead,BufNewFile *.kt set filetype=kotlin "Add type
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup END
"Return to last edit position when opening files
augroup rememberLastPos
  autocmd!
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
augroup END
