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
  ;; -> n  Q           * <Nop>
  (util.nnoremap :<LocalLeader>tn "TSNodeUnderCursor")

  ;; " RT: invoke TSPlaygroundToggle
  ;; nnoremap <LocalLeader>tn :TSNodeUnderCursor<CR>
  ;; -> n  Q           * <Nop>
  (util.nnoremap :<LocalLeader>tp "TSPlaygroundToggle")

)
