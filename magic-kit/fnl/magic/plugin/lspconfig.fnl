;; nvim-lspconfig initialization
(module magic.plugin.lspconfig
  {autoload {nvim aniseed.nvim}})

;; Helper for setting normal mode keymaps copied from fnl/magic/mapping.fnl.
;; Use instead of nnoremap() and lnnoremap() from magic.util.
(defn- map [from to desc]
  (nvim.set_keymap :n from (.. ":" to "<CR>")
                   {:noremap true :silent true :desc desc}))

(let [(ok? lsp) (pcall #(require :lspconfig))]
  (when ok?
    ;; Language servers must be installed manually before using.
    ;;   See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    ;;
    ;; 1. Lua
    (lsp.lua_ls.setup
      {:cmd ["lua-language-server"]
       :settings {:Lua {:runtime {:version "LuaJIT"}
                        :diagnostics {:globals [:vim]}
                        :workspace {:library (vim.api.nvim_get_runtime_file "" true)
                                    :checkThirdParty false}
                        :telemetry {:enable false}}}})

    ;; 2. Python
    ;(lsp.jedi_language_server.setup {}) ;; for Python

    ;; 3. Fennel
    ;;    a. Defaults from https://sr.ht/~xerool/fennel-ls/.
    ;(lsp.fennel_ls.setup
    ;  {:fennel-ls {:fennel-path "./?.fnl;./?/init.fnl;src/?.fnl;src/?/init.fnl"
    ;               :macro-path "./?.fnl;./?/init-macros.fnl;./?/init.fnl;src/?.fnl;src/?/init-macros.fnl;src/?/init.fnl"
    ;               :checks {:unused-definitions true
    ;                        :unknown-module-field true}
    ;               }
    ;   })
    ;;    b. Defaults from https://github.com/rydesun/fennel-language-server and
    ;;       Olical/dotfiles/stowed/.config/nvim/lua/user/plugins/mason.fnl.
    ;(lsp.fennel_language_server.setup
    ;  {:filetypes [:fennel]
    ;   :root_dir (lsp.util.root_pattern :fnl :lua)
    ;   :single_file_support true
    ;   :settings {:fennel {:diagnostics {:globals [:vim :jit :comment]}
    ;                       :workspace {:library (vim.api.nvim_list_runtime_paths)}}}
    ;   })

    ;; 4. Clojure
    ;     (lsp.clojure_lsp.setup {})

    ;; 5. Typescript
    ;     (lsp.tsserver.setup {})

    ;; Keymaps for LSP interactions.
    ;;   https://www.chrisatmachine.com/Neovim/27-native-lsp/
    ;;   We use <C-k> to move between windows.
    ;;   So, reassign: lua vim.lsp.buf.signature_help()
    ;;                 lua vim.diagnostic.goto_prev()
    ;;                 lua vim.diagnostic.goto_next()
    (map :gd         "lua vim.lsp.buf.definition()"     "LSP definition of symbol")
    (map :gD         "lua vim.lsp.buf.declaration()"    "LSP declaration of symbol")
    (map :gr         "lua vim.lsp.buf.references()"     "LSP references to symbol")
    (map :gi         "lua vim.lsp.buf.implementation()" "LSP implementations of symbol")
    (map :K          "lua vim.lsp.buf.hover()"          "LSP info about symbol")
    (map :<leader>k  "lua vim.lsp.buf.signature_help()" "LSP signature info about symbol")
    (map :<leader>lr "lua vim.lsp.buf.rename()"         "LSP rename all references to symbol")
    (map :<leader>lf "lua vim.lsp.buf.formatting()"     "LSP Format buffer")
    (map :<leader>dp "lua vim.diagnostic.goto_prev()"   "Go to previous diagnostic in buffer")
    (map :<leader>dn "lua vim.diagnostic.goto_next()"   "Go to next diagnostic in buffer")

    ;;(print "nvim-lspconfig initialized")
    ))
