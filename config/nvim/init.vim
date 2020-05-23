"
"Global Settings:
"
set autoindent              "Enable autoindent for new lines
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
set updatetime=300
set expandtab               "All tabs are spaces
"set textwidth=80           "Removed because it adds hard breaks
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
"
"Maps:
"
let mapleader = " "
"Escape to normal mode with jk
"inoremap jk <Esc>
"vnoremap jk <Esc>
"Escape to normal mode with jk
inoremap ., <Esc>
vnoremap ., <Esc>
"Faster command entry
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
"New line without insert mode
noremap <CR> o<Esc>
"
"Colemak mnei(hjkl) t(i) <C-n>(n) <C-e>(e)
" sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/
noremap m h|        "move Left
noremap n gj|       "move Down
noremap e gk|       "move Up
noremap i l|        "move Right
noremap <C-m> m|    "(C-m)ark           replaces (m)ark
noremap h n|    		"(C-n)ext / result  replaces (n)ext
noremap <C-e> e|    "(C-e)nd-of-word    replaces (e)nd
noremap t i|        "insert (t)ext      replaces (i)nsert
inoremap ,n <Esc>|  "return to (n)ormal
vnoremap ,n <Esc>|  "return to (n)ormal
nnoremap ci ci|     "restore (i)nner combinations for Colemak
nnoremap di di|     "restore (i)nner combinations for Colemak
nnoremap vi vi|     "restore (i)nner combinations for Colemak
nnoremap yi yi|     "restore (i)nner combinations for Colemak
nnoremap ct ct|     "restore un(t)ill combinations for Colemak
nnoremap dt dt|     "restore un(t)ill combinations for Colemak
nnoremap vt vt|     "restore un(t)ill combinations for Colemak
nnoremap yt yt|     "restore un(t)ill combinations for Colemak
noremap <C-n> <C-f>M| "Page down, center cursor
noremap <C-e> <C-b>M| "Page up, center cursor
noremap <C-g> :GrammarousCheck
noremap <C-G> :GrammarousReset
" test area (par enth etical) 'single quoted' 1 2 3 4
"
"Plugins:
"
call plug#begin(vimpath . '/plug')
Plug 'vim-airline/vim-airline'          "The one and only
Plug 'vim-airline/vim-airline-themes'   "Currently unused
Plug 'easymotion/vim-easymotion'        "Mapped to <space><movement>
Plug 'nathanaelkane/vim-indent-guides'  "Alternating light/dark indents
Plug 'chrisbra/Colorizer'               "Show hex code color
Plug 'luochen1990/rainbow'              "Rainbow highlight brackets
Plug 'sheerun/vim-polyglot'             "Multi-langsyntax and indent
Plug 'mhinz/vim-startify'               "Start screen with recent files
Plug 'ryanoasis/vim-devicons'           "Nerd Font icons
"Plug 'vim-syntastic/syntastic'          "Syntax checker
Plug 'rust-lang/rust.vim'               "rust support
Plug 'rhysd/vim-grammarous'             "English :GrammarousCheck
Plug 'vim-pandoc/vim-pandoc'            "Pandoc doc converter integration
Plug 'vim-pandoc/vim-pandoc-syntax'     "Pandoc/.md/LaTeX/etc syntax
Plug 'tpope/vim-obsession'              "Autosave session (for tmux)
"Plug 'udalov/kotlin-vim'                "Kotlin stuff
"Plug 'linduxed/colemak.vim'             "unei (like wasd) for hjkl
if has('nvim')
  "denite tui: pip3 install --user pynvim
  "deoplete autocomplete: pip3 install --user jedi neovim
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "Plug 'zchee/deoplete-jedi'      "Py autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} "py syntax
else
  Plug 'Shougo/denite.nvim'       "Denite
  Plug 'roxma/nvim-yarp'          "Denite
  Plug 'roxma/vim-hug-neovim-rpc' "Denite
  "Plug 'Shougo/deoplete.nvim'     "Autocomplete
  "Plug 'zchee/deoplete-jedi'      "Py autocomplete
  Plug 'roxma/nvim-yarp'          "for deoplete on vim
  Plug 'roxma/vim-hug-neovim-rpc' "for deoplete on vim
endif             "When adding new plugs run :PlugInstall
call plug#end()   "When adding deoplete in (old)vim run :UpdateRemotePlugins
"
"Plugin Settings:
"
let g:airline_powerline_fonts = 1
"Warning for over-long lines and mixed indents but not trailing whitespace
let g:airline#extensions#whitespace#checks = ['long', 'mixed-indent-file']
"Show full filetype label instead of just 2 or 3 characters, eg "python"
let g:airline_section_x = '%{&filetype}'
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1
let g:deoplete#enable_at_startup = 1
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
      \'xml']
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
      \'xml']
let g:startify_custom_header = []
let g:startify_lists = [
\ { 'type': 'files',     'header': ['   MRU']            },
\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
\ { 'type': 'sessions',  'header': ['   Sessions']       },
\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
\ { 'type': 'commands',  'header': ['   Commands']       },
\ ]
nmap <Leader> <Plug>(easymotion-prefix)

"
"Denite start
"

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

"
"Denite end
"

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
" :CocInstall coc-python coc-tsserver coc-json coc-html coc-css coc-cmake coc-git coc-markdownlint coc-svg coc-vimlsp
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


"
"Colors:
"
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
let g:airline_theme='gruvbox'
"[xterm-256color reference](https://jonasjacek.github.io/colors/)
"0 and 16 look good
highlight colorcolumn guibg=grey11 ctermbg=235
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey11 ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey11 ctermbg=234
"python syntax https://github.com/numirias/semshi
"http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"Soften semshi py colors:
function! SemshiColors()
  hi semshiBuiltin   ctermfg=209 guifg=#ff875f
  hi semshiImported  ctermfg=209 guifg=#ff875f cterm=none gui=none
  hi semshiSelected  ctermfg=223 guifg=#ebdbb2 ctermbg=237 guibg=#3c3836
  hi semshiParameter ctermfg=214 guifg=#ffaf00
endfunction
"
"Functions:
"
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
