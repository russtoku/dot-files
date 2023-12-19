(module magic.plugin.nvim-tree
  {autoload {nvim aniseed.nvim}})

(let [(ok? nvim-tree) (pcall require :nvim-tree)]
  (when ok?
    (nvim-tree.setup
      {:sort_by :case_sensitive
       :renderer {:group_empty true}
       :filters {:dotfiles true}
       })
    ;;(print "nvim-tree initialized")
    ))
