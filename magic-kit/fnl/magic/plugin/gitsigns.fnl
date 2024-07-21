(module magic.plugin.gitsigns)

;; https://github.com/lewis6991/gitsigns.nvim
(let [(ok? aplug) (pcall #(require :gitsigns))]
  (when ok?
    (aplug.setup
      {:attach_to_untracked false
       :on_attach (fn [bufnr]
                    (local gitsigns
                      (require :gitsigns))

                    ;; Navigation of hunks
                    (vim.keymap.set :n :<localleader>hn
                                    (fn [] (gitsigns.nav_hunk :next))
                                     {:buffer bufnr})
                    (vim.keymap.set :n :<localleader>hp
                                    (fn [] (gitsigns.nav_hunk :prev))
                                     {:buffer bufnr})
                    (vim.keymap.set :n :<localleader>hf
                                    (fn [] (gitsigns.nav_hunk :first))
                                     {:buffer bufnr})
                    (vim.keymap.set :n :<localleader>hl
                                    (fn [] (gitsigns.nav_hunk :last))
                                     {:buffer bufnr}))})
    ;;(print "gitsigns loaded")
    ))
