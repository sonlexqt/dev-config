read -p "This will unpack dev config to this machine. Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  cp ./config/.zshrc  ~/.zshrc 
  cp ./config/.tmux.conf ~/.tmux.conf
  cp ./config/.p10k.zsh ~/.p10k.zsh
  cp ./config/alacritty.yml ~/.config/alacritty/alacritty.yml
  cp -r ./config/karabiner ~/.config
fi
