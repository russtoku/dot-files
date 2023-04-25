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

(set nvim.o.completeopt "menuone,noselect")

