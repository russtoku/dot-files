(module magic.plugin.treesitter)

(let [(ok? aplugin) (pcall #(require :nvim-treesitter.configs))]
  (when ok?
    (aplugin.setup
      {:ensure_installed ["clojure" "fennel" "racket" "scheme"
                          "sql" "query" "vim" "lua" "python"
                          "markdown" "html" "css" "javascript" ]
       :sync_install true
       :highlight {:enable true
                   :additional_vim_regex_highlighting false}
       ;;:indent    {:enable true}
       :match     {:enable true}
       })
    ;;(print "nvim-treesitter initialized")
    ))
