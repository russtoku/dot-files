(module magic.plugin.material
  {autoload {nvim aniseed.nvim}})

(let [(ok? material) (pcall #(require :material))]
  (when ok?
    (material.setup
      {:custom_highlights {:FloatBorder {:fg "#1A1A1A"}}
       :borders true
       :high_visibility {:darker true
                         :lighter true}})
    ;;  Set the style before setting neovim's colorscheme.
    (set nvim.g.material_style :darker)
    ;;(set nvim.g.material_style :lighter))) ;; nice light theme
    ;;(set nvim.g.material_style :deep_ocean))) ;; too washed out
    ;;(set nvim.g.material_style :palenight))) ;; kinda like dracula
    ;;(set nvim.g.material_style :oceanic))) ;; ugly, greenish tingle

    ;; Set the color theme in init.fnl instead.
    ;;(nvim.ex.colorscheme :material)))
    ;;(print "material initialized")
    )) ;; best of the dark themes

