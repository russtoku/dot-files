(module magic.options
  {require {core aniseed.core
            str aniseed.string
            util magic.util
            nvim aniseed.nvim}})

;; Global editor options
;;   neovim options that I like that were in my init.vim.
;;   See also: practicalli/neovim-config-redux/fnl/config/init.fnl
(defn setup []

  (let [options
        {
         :encoding "utf-8"
         :spelllang "en_us"
         :showcmd true
         ;; :showmode false
         :backspace "indent,eol,start"  ;; Intuitive backspacing.
         ;; set hidden         " Allow buffer switching without saving
         :hidden true
         ;turn on the wild menu, auto complete for commands in command line
         :wildmenu true
         ;; set wildmode=list:longest         " Complete files like a shell.
         :wildmode  "list:longest"  ;; " Complete files like a shell.
         ;; " RT: MacOSX/Linux; added node_modules from Suz Hinton's
         ;; set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
         ;; " Taken from liuchengxu/vim-better-default
         ;; set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip
         ;; set wildignore+=*/tmp/*,*.o,*.obj,*.so     " Unix
         ;; set wildignore+=*\\tmp\\*,*.exe            " Windows
         ;; " End of Taken from liuchengxu/vim-better-default

         ;;:wildignore "*/tmp/*,*.so,*.swp,*.zip"
         ;; RT: We use the following because we aren't using a function that doesn't append values.
         :wildignore "*/tmp/*,*.so,*.o,*.obj,*.swp,*.zip,*/node_modules/*,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip"
         ;; set ignorecase     " Case insensitive search
         :ignorecase true
         ;; set smartcase      " ... but case sensitive when uc present
         :smartcase true
         ;; set ruler                         " Show cursor position.
         ;;? :ruler true
         ;; set incsearch                     " Highlight matches as you type.
         ;; set hlsearch                      " Highlight matches.
         :hlsearch true
         ;; set wrap                          " Turn on line wrapping.
         ;; set scrolloff=3                   " Show 3 lines of context around the cursor.
         :scrolloff 2
         ;; set visualbell                    " No beeping.
         :visualbell true
         ;;? :errorbells false
         ;; set writebackup               " Write a backup file (default)
         ;; set nobackup                  " And after successful save, remove it (default).
         ;; " RT: Recommended value:
         ;; "  Do: mkdir ~/vimswap; chmod 700 ~/vimswap to protect it from others
         ;; set directory=".,~/vimswap//"
         ;; set autoindent                   " autoindent on return/enter
         :autoindent true
         ;; set expandtab                    " Use spaces instead of tabs
         :expandtab true
         ;tab/indent size
         ;; set tabstop=2                    " Global tab width.
         :tabstop 2
         ;; "set softtabstop=2        " Let backspace delete indent
         :softtabstop 2
         ;; set shiftwidth=2                 " And again, related.
         :shiftwidth 2
         ;; set laststatus=2                  " Show the status line all the time
         :laststatus 2
         ;; set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
         ;; " RT: Set to auto read when a file is changed from the outside
         ;; set autoread
         :autoread true
         ;; " RT: one space after joining lines
         ;; set nojoinspaces
         :joinspaces false
         ;; " RT: Open new split panes to right and bottom, which feels more natural
         ;; set splitbelow
         :splitbelow true
         ;; set splitright
         :splitright true
         ;show invisible characters
         :list false
         ;;:listchars (str.join "," ["tab:▶-" "trail:•" "extends:»" "precedes:«" "eol:¬"])
         ;; CR is too big :listchars (str.join "," ["tab:▶-" "trail:•" "extends:»" "precedes:«" "eol:⮐"])
         :listchars (str.join "," ["tab:▶-" "trail:•" "extends:»" "precedes:«" "eol:ꜚ"])

;         ;; " RT: show a colored vertical line for the last column position
;         ;; se colorcolumn=+1
         :colorcolumn "+1"
         ;; :hi ColorColumn is set in init.fnl or colors.fnl

         ;; default: shada=!,'100,<50,s10,h
         ;;  ~/PVT is an encrypted filesystem. r is for removable media.
         :shada "!,'100,<50,s10,h,r/Users/russ/PVT"
         ;settings needed for compe autocompletion
         ;;? :completeopt "menuone,noselect"
         ;;? :signcolumn "number"
         :grepprg "rg --vimgrep $*"
         :grepformat "%f:%l:%c:%m"
         }]
    (each [option value (pairs options)]
      (util.set-global-option option value)))
  ;;--- end of options ---

)
