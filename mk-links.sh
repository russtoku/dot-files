#!/bin/bash
# mk-links.sh - Create symlinks in the appropriate places to config files in
#               $HOME/dot-files which you clone from your git repo.
#             - 01/21/2023, russtoku@gmail.com
#

echo "symlinking $HOME/.bash_profile"
ln -sf "$HOME"/dot-files/dot.bash_profile "$HOME"/.bash_profile

echo "symlinking $HOME/.config/kitty"
ln -sf "$HOME"/dot-files/kitty "$HOME"/.config/kitty
