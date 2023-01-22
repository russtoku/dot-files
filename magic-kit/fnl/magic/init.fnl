(module magic.init
  {autoload {plugin magic.plugin
             my_mappings magic.mapping
             my_options magic.options
             my_ftypes magic.file-types
             my_colors magic.colors
             nvim aniseed.nvim}})

;;; Introduction

;; Aniseed compiles this (and all other Fennel files under fnl) into the lua
;; directory. The init.lua file is configured to load this file when ready.

;; We'll use modules, macros and functions to define our configuration and
;; required plugins. We can use Aniseed to evaluate code as we edit it or just
;; restart Neovim.

;; You can learn all about Conjure and how to evaluate things by executing
;; :ConjureSchool in your Neovim. This will launch an interactive tutorial.


;;; Generic configuration

(set nvim.o.termguicolors true)
(set nvim.o.mouse "") ;; use mouse with macos' Cmd-c
(set nvim.o.updatetime 2000) ;; default 4000
(set nvim.o.timeoutlen 900)  ;; default 1000
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")
(set nvim.o.inccommand :split)


;; Disable some providers because we don't want to use them.
(set nvim.g.loaded_node_provider 0)
(set nvim.g.loaded_perl_provider 0)
(set nvim.g.loaded_ruby_provider 0)
(set nvim.g.loaded_python3_provider 0)

;;; Mappings

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;;; My customizations
(my_mappings.setup)
(my_options.setup)
(my_ftypes.setup)
(my_colors.setup) 

;;; Plugins

;; Run script/sync.sh to update, install and clean your plugins.
;; Packer configuration format: https://github.com/wbthomason/packer.nvim
(plugin.use
  :Olical/aniseed {}
  ;;:Olical/conjure {}
  :/Users/russ/Projects/Conjure/conjure {}
  ;;:airblade/vim-gitgutter {:mod :gitgutter} ;; NO
  :clojure-vim/clojure.vim {}
  :guns/vim-sexp {:mod :sexp}
  :kylechui/nvim-surround {:mod :surround}  ;; instead of tpop/vim-surround
  :lewis6991/gitsigns.nvim {:mod :gitsigns} ;; instead of vim-gitgutter
  :lewis6991/impatient.nvim {}
  :nvim-lualine/lualine.nvim {:requires [:kyazdani42/nvim-web-devicons] :mod :lualine}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter}
  :terrortylor/nvim-comment {} ;; like tpope/vim-commentary
  :tpope/vim-sexp-mappings-for-regular-people {}
  ;;:tpope/vim-surround {} ;; NO
  :tpope/vim-vinegar {}
  :wbthomason/packer.nvim {}
  :andymass/vim-matchup {}

  ;; Color schemes
  :Mofiqul/dracula.nvim {}
  :bluz71/vim-moonfly-colors {}
  :bluz71/vim-nightfly-colors {}
  :folke/tokyonight.nvim {}
  ;;:jacoborus/tender.vim {} ;; NO
  :marko-cerovac/material.nvim {} ;; {:mod :material}
  )

;; Select the color scheme
;;   Should load plugin/<colorscheme_name>.fnl instead to select & customize
(nvim.ex.colorscheme :nightfly)
;; (nvim.ex.colorscheme :moonfly)  ;; a bit lighter than nightfly
;; (nvim.ex.colorscheme :material) ;; should load the plugin/material.fnl instead
;; (nvim.ex.colorscheme :tokyonight-night) ;; a bit faded, must turn up brightness
;; (nvim.ex.colorscheme :dracula) ;; comments are too faded, must turn up brightness
;; (nvim.ex.colorscheme :tender) ;; faded like dracula

