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
(set nvim.o.updatetime 3000) ;; default 4000
(set nvim.o.timeoutlen 1000)  ;; default 1000
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")
(set nvim.o.inccommand :split)


;; Disable some providers because we don't want to use them.
(set nvim.g.loaded_node_provider 0)
(set nvim.g.loaded_perl_provider 0)
(set nvim.g.loaded_ruby_provider 0)
(set nvim.g.loaded_python3_provider 0)

; Disable netrw when we use nvim-tree/nvim-tree.lua.
(set nvim.g.loaded_netrw 1)
(set nvim.g.loaded_netrwPlugin 1)

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
  ;  :Olical/conjure {:mod :conjure}
  :/Users/russ/Projects/Conjure/russ-try/conjure {:mod :conjure}
  :Olical/nfnl {}  ;; Neovim v0.9.0+
  :clojure-vim/clojure.vim {}
  :jaawerth/fennel-nvim {} ;; instead of :bakpakin/fennel.vim {}
  :guns/vim-sexp {:mod :sexp}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :kylechui/nvim-surround {}  ;; instead of :tpope/vim-surround {}
  :lewis6991/gitsigns.nvim {:mod :gitsigns} ;; instead of :airblade/vim-gitgutter {}
  :lewis6991/impatient.nvim {}
  :nvim-lualine/lualine.nvim {:requires [:kyazdani42/nvim-web-devicons] :mod :lualine}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter}
  ; treesitter/playground requires the query parser for the query editor.
  :nvim-treesitter/playground {:mod :playground}
  :terrortylor/nvim-comment {} ;; instead of :tpope/vim-commentary {}
  :nvim-tree/nvim-tree.lua {:mod :nvim-tree} ;; directory tree navigation
  :wbthomason/packer.nvim {}
  :andymass/vim-matchup {}

  ;; Completion
  ;; Is nvim-lspconfig required for nvim-cmp? language servers provide more than completions.
  :neovim/nvim-lspconfig {:mod :lspconfig} ;; plugin/lspconfig.fnl specifies language servers available
  ;; nvim-cmp provides completions for neovim's built-in lsp client, right?
  :hrsh7th/nvim-cmp {:mod :cmp} ;; init file, plugin/cmp.fnl sets sources
  ;;  -- Start of nvim-cmp sources specified in plugin/cmp.fnl
  :PaterJason/cmp-conjure {}
  :hrsh7th/cmp-nvim-lsp {}
  :hrsh7th/cmp-buffer {}
  :hrsh7th/cmp-path {} ;; for filesystem paths
  :hrsh7th/cmp-nvim-lua {}  ;; for Neovim's Lua API
  ;; :hrsh7th/cmp-cmdline {} ;; not specified
  ;;  -- End of nvim-cmp sources specified in plugin/cmp.fnl

  ;; Fuzzy finder
  :nvim-telescope/telescope.nvim {:mod :telescope
                                  :requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]}
  ;;  NOTE: plugin/telescope.fnl requires rg (ripgrep).

  ;; Hints when using mapped keys.
  :folke/which-key.nvim {:mod :which-key}

  ;; Color schemes
  ;;   Other schemes may be available in ../../colors.
  :bluz71/vim-nightfly-colors {}
  :bluz71/vim-moonfly-colors {}
  ;;:folke/tokyonight.nvim {}
  ;;:marko-cerovac/material.nvim {:mod :material}
  )

;; Select the color scheme
;;   Should load plugin/<colorscheme_name>.fnl to only customize; see plugin/material.fnl.
(nvim.ex.colorscheme :nightfly)
;; (nvim.ex.colorscheme :moonfly)  ;; darker than nightfly, comments are thin
;; (nvim.ex.colorscheme :material) ;; darker's lime green is a bit bright; also has decent light theme.
;; (nvim.ex.colorscheme :tokyonight-night) ;; a bit faded, must turn up brightness
;; (nvim.ex.colorscheme :tokyonight-day) ;; a decent light theme but vertical split border is very light
;; (nvim.ex.colorscheme :leuven-ish) ;; a decent light theme

