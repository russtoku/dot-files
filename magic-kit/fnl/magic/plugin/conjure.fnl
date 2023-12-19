(module magic.plugin.conjure
  {autoload {nvim aniseed.nvim}})

;; No HUD
(set nvim.g.conjure#log#hud#enabled false)
;; Don't automatically start REPL
(set nvim.g.conjure#client_on_load false)

;; Use Conjure only for specified languages.
;;  - default filetypes: ['clojure', 'fennel', 'janet', 'hy', 'julia', 'racket', 'scheme', 'lua', 'lisp', 'python', 'rust'] 
(set nvim.g.conjure#filetypes [:clojure :fennel :racket :scheme :lua :python])

;; Disable languages that we don't want.
;; See https://github.com/Olical/conjure/issues/472
(set nvim.g.conjure#filetype#janet false)
(set nvim.g.conjure#filetype#hy false)
(set nvim.g.conjure#filetype#julia false)
(set nvim.g.conjure#filetype#lisp false)
(set nvim.g.conjure#filetype#rust false)

; Use es instead of E for keymapping to evaluate visual selection.
(set nvim.g.conjure#mapping#eval_visual "es")

; Turn off lsp diagnostics for the Conjure log buffer.
; https://github.com/Olical/conjure/wiki/Frequently-asked-questions#my-log-buffer-is-full-of-diagnostic-warnings-and-errors--a-plugin-is-running-in-the-log-buffer-and-i-dont-want-it-to
; autocmd BufNewFile conjure-log-* lua vim.diagnostic.disable(0)
(do
  (nvim.ex.augroup :conjure_log_no_diags)
  (nvim.ex.autocmd_)
  (nvim.ex.autocmd :BufNewFile :conjure-log-* "lua vim.diagnostic.disable(0)")
  (nvim.ex.augroup :END))

; Completion menu behavior
(set nvim.o.completeopt "menuone,noselect")

