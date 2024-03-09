(module magic.file-types
  {require {core aniseed.core
            nvim aniseed.nvim
            nu aniseed.nvim.util
            util magic.util}})

;; File type customizations

(defn setup []

  ;; TODO: Set these inside augroups (:he augroup) so they can be removed or
  ;;       executed as a group.
  (nvim.ex.augroup :russ_keymaps)
  (nvim.ex.autocmd_)

  ;; C files:
  (nvim.ex.autocmd "FileType" "c" "setl tw=80 ts=4 sw=4")

  ;; Clojure files:
  ;; from practicalli/neovim-config-redux/fnl/config/init.fnl
  (nvim.ex.autocmd "BufNewFile,BufRead" ".edn,.clj,.cljstyle" "set filetype=clojure")

  ;; Fennel files:
  ;;  default: formatoptions=cqj (autowrap comments; format comments with gq;
  ;;  remove comment leader when joining lines)
  (nvim.ex.autocmd "FileType" "fennel" "setl noai tw=80 fdm=indent nofen fo+=n1")
  
  ;; Text files: *.txt
  ;;   autocmd BufNewFile,BufRead *.txt setlocal filetype=text
  (nvim.ex.autocmd "BufNewFile,BufRead" "*.txt" "setlocal filetype=text")
  ;;   Enable folding in text files;
  ;;   http://stackoverflow.com/questions/20758028/how-to-activate-vim-folding-markers
  ;;   autocmd FileType text setlocal ai tw=76 foldmethod=marker nofoldenable
  ;;   Indent numbered paragraphs (formatoptions) - from stevelosh.com
  ;;   autocmd FileType text setlocal formatoptions+=n1 (numbered list; don't break after single char)
  (nvim.ex.autocmd "FileType" "text " "setl ai tw=76 fdm=marker fmr={#{,}#} nofen fo+=n1")

  ;; Racket files: *.rkt, *.rktl
  (nvim.ex.autocmd "BufNewFile,BufRead" "*.rkt,*.rktl" "setlocal filetype=racket")

  ;; Vimscript files: treat ':' (58) as part of a word.
  (nvim.ex.autocmd "BufNewFile,BufRead" :*.vim "setlocal iskeyword=@,48-58,_,192-255,#")

  (nvim.ex.augroup :END)
)
