(module config.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

(treesitter.setup
  {:ensure_installed ["clojure" "fennel" "markdown"
                      "python" "html" "css" "javascript"]
   :sync_install true
   :highlight {:enable true
               :additional_vim_regex_highlighting false}
   :indent    {:enable true}
   :match     {:enable true}
  })

;;(print "magic.plugin.nvim-treesitter loaded")
