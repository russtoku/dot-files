(module magic.plugin.gitsigns)

;; https://github.com/lewis6991/gitsigns.nvim
(let [(ok? aplug) (pcall #(require :gitsigns))]
  (when ok?
    (aplug.setup
      {:attach_to_untracked false })
    ;;(print "gitsigns loaded")
    ))
