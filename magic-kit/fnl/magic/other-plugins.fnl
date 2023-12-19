(module magic.other-plugins
  {autoload {plugin magic.plugin}})

(plugin.use
  ;;   Stuff to enable later.
  ;; :tpope/vim-commentary {} ;; NO, use nvim-comment
  ;; :tpope/vim-dispatch {}
  ;; :w0rp/ale {:mod :ale}

  ;;   Stuff we might not want to use.
  ;; :Olical/nvim-local-fennel {}
  ;; :PeterRincker/vim-argumentative {}
  ;; :clojure-vim/vim-jack-in {}
  ;; :folke/which-key.nvim {:mod :which-key}
  ;; :ggandor/lightspeed.nvim {}
  ;; :jiangmiao/auto-pairs {:mod :auto-pairs}
  ;; :liuchengxu/vim-better-default {:mod :better-default}
  ;; :mbbill/undotree {:mod :undotree}
  ;; :radenling/vim-dispatch-neovim {}
  ;; :tpope/vim-abolish {}
  ;; :tpope/vim-eunuch {}
  ;; :tpope/vim-fugitive {}
  ;;   Alternative to tpope/vim-fugitive (practicalli/neovim-config-redux/fnl/config/plugin.fnl)
  ;;   :TimUntersberger/neogit {:requires [:nvim-lua/plenary.nvim :sindrets/diffview.nvim] :mod :neogit}
  ;; :tpope/vim-repeat {}
  ;; :tpope/vim-sleuth {}
  ;; :tpope/vim-unimpaired {}
  )
