(module magic.plugin.surround)

(let [(ok? aplugin) (pcall #(require :nvim-surround))]
  (when ok?
    (aplugin.setup)
    ;;(print "nvim-surround initialzed")
    ))

