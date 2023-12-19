(module magic.plugin.lspconfig
  {autoload {util magic.util
             nvim aniseed.nvim}})

(defn- map [from to]
  (util.nnoremap from to))

(let [(ok? lsp) (pcall #(require :lspconfig))]
  (when ok?
    ;; These language servers must be installed already.
    ;; See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    ;;(lsp.clojure_lsp.setup {})
    ;;(lsp.tsserver.setup {})
    (lsp.lua_ls.setup
      {:cmd ["lua-language-server"]
       :settings {:Lua {:runtime {:version "LuaJIT"}
                        :diagnostics {:globals [:vim]}
                        :workspace {:library (vim.api.nvim_get_runtime_file "" true)
                                    :checkThirdParty false}
                        :telemetry {:enable false}}}})
    ;;(lsp.fennel_ls.setup {})
    (lsp.jedi_language_server.setup {}) ;; for Python

    ;; https://www.chrisatmachine.com/Neovim/27-native-lsp/
    (map :gd "lua vim.lsp.buf.definition()")
    (map :gD "lua vim.lsp.buf.declaration()")
    (map :gr "lua vim.lsp.buf.references()")
    (map :gi "lua vim.lsp.buf.implementation()")
    (map :K "lua vim.lsp.buf.hover()")
    ;  We use <c-k> to move to the window above.
    ;(map :<c-k> "lua vim.lsp.buf.signature_help()")
    (map :<leader>k "lua vim.lsp.buf.signature_help()")
    (map :<c-p> "lua vim.diagnostic.goto_prev()")
    (map :<c-n> "lua vim.diagnostic.goto_next()")

    (map :<leader>lr "lua vim.lsp.buf.rename()")
    (map :<leader>lf "lua vim.lsp.buf.formatting()")

    ;;(print "nvim-lspconfig initialized")
    ))
