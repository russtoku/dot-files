(module magic.plugin.lualine)

(let [(ok? lualine) (pcall require :lualine)]
  (when ok?
    (lualine.setup
        {:options {:theme "dracula"
                   :icons_enabled false }})
    ;;(print "nvim-lualine initialized")
    ))

