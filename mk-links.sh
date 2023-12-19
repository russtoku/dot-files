#!/bin/bash
# mk-links.sh - Create symlinks in the appropriate places to config files in
#               $HOME/dot-files which you clone from your git repo.
#             - 01/21/2023, russtoku@gmail.com
#
os_name=$(uname -s)

# OS-specific files
if [ "Darwin" == "$os_name" ]; then
  echo "Setting up symlinks for Macos"

  echo "symlinking $HOME/.bash_profile"
  echo ln -sf "$HOME"/dot-files/macos-bash_profile "$HOME"/.bash_profile

  echo "symlinking $HOME/.config/kitty/kitty.conf"
  echo ln -sf "$HOME"/dot-files/kitty/macos-kitty.conf "$HOME"/.config/kitty/kitty.conf

elif [ "Linux" == "$os_name" ]; then
  echo "Setting up symlinks for Linux"

  echo "symlinking $HOME/.bashrc"
  echo ln -sf "$HOME"/dot-files/linux-bashrc "$HOME"/.bashrc

  echo "symlinking $HOME/.config/kitty/kitty.conf"
  echo ln -sf "$HOME"/dot-files/kitty/linux-kitty.conf "$HOME"/.config/kitty/kitty.conf

else
  echo "Not Macos or Linux"
fi

# Same for macos and linux:
echo "symlinking $HOME/.config/nvim directory"
echo ln -sf "$HOME"/dot-files/magic-kit "$HOME"/.config/nvim


