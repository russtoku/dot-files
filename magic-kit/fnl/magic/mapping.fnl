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
  ;; -> n  ,tp         * :TSPlaygroundToggle<CR>
  (util.nnoremap :<LocalLeader>tn "TSNodeUnderCursor")

  ;; " RT: invoke TSPlaygroundToggle
  ;; nnoremap <LocalLeader>tn :TSNodeUnderCursor<CR>
  ;; -> n  ,tn         * :TSNodeUnderCursor<CR>
  (util.nnoremap :<LocalLeader>tp "TSPlaygroundToggle")

  ;; Mappings to use with the command line:
  ;; check with: :cmap or (nvim.get_keymap :c)
  ;;
  ;; :cnoremap <C-A>       <Home>    " start of line
  (nvim.set_keymap :c :<C-A> "<Home>" {:noremap true})    ;; start of line
  (nvim.set_keymap :c :<C-E> "<End>" {:noremap true})     ;; end of line
  (nvim.set_keymap :c :<C-V> "<S-Left>" {:noremap true})  ;; back one word
  (nvim.set_keymap :c :<C-W> "<S-Right>" {:noremap true}) ;; forward one word
  (nvim.set_keymap :c :<C-B> "<Left>" {:noremap true})    ;; back one character
  (nvim.set_keymap :c :<C-F> "<Right>" {:noremap true})   ;; forward one character
  (nvim.set_keymap :c :<C-D> "<Del>" {:noremap true})     ;; delete character under cursor
  (nvim.set_keymap :c :<C-K> "<Up>" {:noremap true})      ;; previous command in history
  (nvim.set_keymap :c :<C-J> "<Down>" {:noremap true})    ;; next command in history
  ;;
)
