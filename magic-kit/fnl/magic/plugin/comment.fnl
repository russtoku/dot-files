(module magic.plugin.comment)

(let [(ok? aplugin) (pcall #(require :nvim_comment))]
  (when ok?
    (aplugin.setup)
    ;;(print "nvim-comment initialized")
    ))
