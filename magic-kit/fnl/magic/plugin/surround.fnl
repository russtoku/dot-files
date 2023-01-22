(module magic.plugin.surround
  {autoload {nvim aniseed.nvim}})

(let [(ok? nvim-surround) (pcall #(require :nvim-surround))]
  (when ok?
    (nvim-surround.setup)
    ;;(print "magic.plugin.surround loaded")
    ))

