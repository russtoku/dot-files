(module magic.mapping
  {require {core aniseed.core
            nvim aniseed.nvim
            nu aniseed.nvim.util
            util magic.util}})

;; Mappings that I like that were in my init.vim:

(defn setup []
  ;; Trim trailing whitespace.
  ;; from Olical/dotfiles/stowed/.config/nvim/fnl/dotfiles/module/mapping.fnl
  ;; -> n  <Space>bt   * :%s/\s\+$//e<CR>
  (util.lnnoremap :bt "%s/\\s\\+$//e")

  ;; Cancel search highlighting
  ;; map <bs> :noh<CR>
  ;; -> n  <BS>        * :noh<CR>
  (util.nnoremap :<bs> "noh")

  ;; " RT: Disable Ex mode
  ;; map Q <Nop>
  ;; -> n  Q           * <Nop>
  (util.nnoremap :Q "")

  ;; " RT: invoke TSNodeUnderCursor
  ;; nnoremap <LocalLeader>tn :TSNodeUnderCursor<CR>
  ;; -> n  ,tn         * :TSNodeUnderCursor<CR>
  (util.nnoremap :<LocalLeader>tn "TSNodeUnderCursor")
  ;(util.lnnoremap :tn "TSNodeUnderCursor")

  ;; " RT: invoke TSPlaygroundToggle
  ;; nnoremap <LocalLeader>tn :TSNodeUnderCursor<CR>
  ;; -> n  ,tp         * :TSPlaygroundToggle<CR>
  (util.nnoremap :<LocalLeader>tp "TSPlaygroundToggle")
  ;(util.lnnoremap :tp "TSNodeUnderCursor")

  ;; Mappings to use with the command line:
  ;; check with: :cmap or (nvim.get_keymap :c)
  ;;
  ;; :cnoremap <C-a>       <Home>    " start of line
  (nvim.set_keymap :c :<C-a> "<Home>" {:noremap true})    ;; start of line
  (nvim.set_keymap :c :<C-e> "<End>" {:noremap true})     ;; end of line
  ; Don't use <C-V> in the console because it's normally used to escape control chars.
  (nvim.set_keymap :c :<C-h> "<S-Left>" {:noremap true})  ;; back one word
  (nvim.set_keymap :c :<C-l> "<S-Right>" {:noremap true}) ;; forward one word

  (nvim.set_keymap :c :<C-b> "<Left>" {:noremap true})    ;; back one character
  (nvim.set_keymap :c :<C-f> "<Right>" {:noremap true})   ;; forward one character

  (nvim.set_keymap :c :<C-d> "<Del>" {:noremap true})     ;; delete character under cursor
  (nvim.set_keymap :c :<C-k> "<Up>" {:noremap true})      ;; previous command in history
  (nvim.set_keymap :c :<C-j> "<Down>" {:noremap true})    ;; next command in history

  ;; RT: Make the conjure log buffer 5 lines smaller and jump back up to code
  ;; window.
  (util.nnoremap :<LocalLeader>bu ":resize -5<CR>:wincmd k")

  ;; Mappings to switch between windows:
  ; map <C-h> <C-W>h
  (util.nnoremap :<C-j> ":wincmd j") ; down
  (util.nnoremap :<C-k> ":wincmd k") ; up
  (util.nnoremap :<C-h> ":wincmd h") ; left
  (util.nnoremap :<C-l> ":wincmd l") ; right

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
