(module magic.plugin.nfnl)

(let [(ok? aplugin) (pcall #(require :nfnl))]
  (when ok?
    (aplugin.setup)))
