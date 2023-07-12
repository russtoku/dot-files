(module magic.plugin.telescope
  {autoload {nvim aniseed.nvim}})

;; Helper for setting normal mode keymaps copied from fnl/magic/mapping.fnl
;; but without description.
;; Use instead of nnoremap() and lnnoremap() from magic.util.
(defn- map [from to]
  (nvim.set_keymap :n from (.. ":" to "<CR>") {:noremap true :silent true}))

(let [(ok? telescope) (pcall #(require :telescope))]
  (when ok?
    (telescope.setup
      {:defaults
       {:vimgrep_arguments ["rg" "--color=never" "--no-heading"
                            "--with-filename" "--line-number" "--column"
                            "--smart-case" "--hidden" "--follow"
                            "-g" "!.git/"]}})

    ;; Set keymaps.
    (map :<leader>ff  "Telescope find_files hidden=true")
    (map :<leader>f-  "Telescope file_browser")
    (map :<leader>fg  "Telescope live_grep")
    (map :<leader>*   "Telescope grep_string")
    (map :<leader>fb  "Telescope buffers")
    (map :<leader>fH  "Telescope help_tags")
    (map :<leader>fm  "Telescope keymaps")
    (map :<leader>fM  "Telescope marks")
    (map :<leader>fh  "Telescope oldfiles")
    (map :<leader>ft  "Telescope filetypes")
    (map :<leader>fc  "Telescope commands")
    (map :<leader>fC  "Telescope command_history")
    (map :<leader>fq  "Telescope quickfix")
    (map :<leader>fl  "Telescope loclist")
    (map :<leader>fsa "Telescope lsp_code_actions")
    (map :<leader>fsi "Telescope lsp_implementations")
    (map :<leader>fsr "Telescope lsp_references")
    (map :<leader>fsS "Telescope lsp_document_symbols")
    (map :<leader>fss "Telescope lsp_workspace_symbols")
    ))

