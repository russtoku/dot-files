(module magic.mapping
  {require {core aniseed.core
            nvim aniseed.nvim
            nu aniseed.nvim.util}})

;; Mappings that I like that were in my init.vim:

;; Helper for setting normal mode keymaps instead of nnoremap() and lnnoremap()
;; from magic.util. Example:
;;  (map :<leader>k  "lua vim.lsp.buf.signature_help()" "LSP signature info about symbol")
(defn- map [from to desc]
  (nvim.set_keymap :n from (.. ":" to "<CR>")
                   {:noremap true :silent true :desc desc}))

(defn setup []

  (nvim.set_keymap :n :Q :<Nop> {:noremap true :silent true :desc "Disable Ex mode"})
  ;; Trim trailing whitespace from Olical/dotfiles/stowed/.config/nvim/fnl/dotfiles/module/mapping.fnl
  (map :<leader>st      "%s/\\s\\+$//e"          "Trim trailing whitespace")
  (map :<bs>            "noh"                    "Cancel search highlighting")
  (map :<LocalLeader>tp "TSPlaygroundToggle"     "Show/hide Tree-sitter playground")
  (map :<LocalLeader>tn "TSNodeUnderCursor"      "Show/hide Tree-sitter node under cursor")
  (map :<Leader>t       "NvimTreeToggle<CR>"     "Show/hide file tree navigation")
  (map :<Leader>o       "NvimTreeFindFile<CR>"   "Show buffer in file tree navigation")
  (map :<LocalLeader>bu "resize -5<CR>:wincmd k" "Make Conjure buffer smaller and move to window above")

  ;; Mappings to switch between windows:
  ;;  Instead of <C-W>h use <C-h>, etc.
  (map :<C-j> "wincmd j" "Move to window below")
  (map :<C-k> "wincmd k" "Move to window above")
  (map :<C-h> "wincmd h" "Move to left window")
  (map :<C-l> "wincmd l" "Move to right window")

  ;; Mappings to use with the command line:
  ;;   Check with `:cmap` or `(nvim.get_keymap :c)`
  ;;   Don't use <C-V> in the console because it's normally used to escape control chars.
  ;;
  ;; :cnoremap <C-a> <Home>    " start of line
  (nvim.set_keymap :c :<C-a> "<Home>"    {:noremap true}) ;; start of line
  (nvim.set_keymap :c :<C-e> "<End>"     {:noremap true}) ;; end of line
  (nvim.set_keymap :c :<C-h> "<S-Left>"  {:noremap true}) ;; back one word
  (nvim.set_keymap :c :<C-l> "<S-Right>" {:noremap true}) ;; forward one word
  (nvim.set_keymap :c :<C-b> "<Left>"    {:noremap true}) ;; back one character
  (nvim.set_keymap :c :<C-f> "<Right>"   {:noremap true}) ;; forward one character
  (nvim.set_keymap :c :<C-d> "<Del>"     {:noremap true}) ;; delete character under cursor
  (nvim.set_keymap :c :<C-k> "<Up>"      {:noremap true}) ;; previous command in history
  (nvim.set_keymap :c :<C-j> "<Down>"    {:noremap true}) ;; next command in history

  ;; TODO:
  ;" move lines up and down
  ;nnoremap <C-j> :m .+1<CR>==
  ;nnoremap <C-k> :m .-2<CR>==
  ;inoremap <C-j> <Esc>:m .+1<CR>==gi
  ;inoremap <C-k> <Esc>:m .-2<CR>==gi
  ;vnoremap <C-j> :m '>+1<CR>gv=gv
  ;vnoremap <C-k> :m '<-2<CR>gv=gv

  ;" Fold HTML tags - from stevelosh.com
  ;nnoremap <leader>ft Vaatzf

)
