(module magic.util
  {autoload {nvim aniseed.nvim
             a aniseed.core}})

(defn expand [path]
  (nvim.fn.expand path))

(defn glob [path]
  (nvim.fn.glob path true true true))

(defn exists? [path]
  (= (nvim.fn.filereadable path) 1))

(defn lua-file [path]
  (nvim.ex.luafile path))

(def config-path (nvim.fn.stdpath "config"))

(defn nnoremap [from to opts]
  (defn- helper [from to opts]
    (let [map-opts {:noremap true}]
      (if (a.get opts :local?)
        (nvim.buf_set_keymap 0 :n from to map-opts)
        (nvim.set_keymap :n from to map-opts))))
  ;; When the to arg is empty, the key is mapped to <Nop>.
  (if (= "" to)
    (helper from to opts)
    (helper from (.. ":" to "<cr>") opts)))

(defn lnnoremap [from to]
  (nnoremap (.. "<leader>" from) to))

;; from neovim-config-redux/fnl/config/util.fnl
(defn set-global-option [key value]
  "Sets a nvim global options"
  (a.assoc nvim.o key value))

;; Query the value of a global variable.
(defn get-global-var [name]
  (a.get nvim.g name))

