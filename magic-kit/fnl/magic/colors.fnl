(module magic.file-types
  {require {nvim aniseed.nvim}})



;;; Color tweaks
(defn setup []

(nvim.ex.highlight "VertSplit NONE") ;; clearing it links it to Normal
;; :hi ColorColumn ctermbg=1 guibg=#bd93f9  "(light purple)
;;(nvim.ex.highlight "ColorColumn ctermbg=1 guibg=#bd93f9") ;; (light purple)

;;(nvim.ex.highlight "NormalFloat ctermbg=grey guibg=#c8d8f8") ;; for the HUD

)
