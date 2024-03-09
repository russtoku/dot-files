(module magic.plugin.treesitter)

;(let [(ok? parsers) (pcall #(require :nvim-treesitter.parsers))]
;  (when ok?
;    (let [parser_config (parsers:get_parser_configs)]
;      (set parser_config.sexp
;           {:install_info
;            {:url "/Users/russ/Projects/Conjure/Tree-sitter/Parsers/tree-sitter-sexp"
;             :files ["src/parser.c"]
;             :branch "main"
;             :generate_requires_npm false
;             :requires_generate_from_grammar false
;             :filetype "sexp"
;             }}))))

(let [(ok? aplugin) (pcall #(require :nvim-treesitter.configs))]
  (when ok?
    (aplugin.setup
      {:ensure_installed [
                          "clojure"
                          "fennel"
                          "html"
                          "lua"
                          "python"
                          "query"
                          "racket"
                          "scheme"
                          ;"sexp"
                          "sql"
                          "typescript"
                          "vim"
                          ]
       :sync_install true
       :highlight {:enable true
                   :disable ["org"]
                   :additional_vim_regex_highlighting false}
       :indent    {:enable false}
       :match     {:enable true
                   :disable ["sexp"]
                   }
       })
    ;;(print "nvim-treesitter initialized")
    ))
