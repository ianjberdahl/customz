## Custom Scripts

- [**custom_cd**](https://github.com/ianjberdahl/customz/raw/refs/heads/main/custom_cd) will always keep you in your working directory even if a new block/terminal/window is launched. Linux has 'cd' built in. This is for i3 and other Desktop env.
- [**install.sh**](https://github.com/ianjberdahl/customz/raw/refs/heads/main/install.sh) will update/upgrade and install i3 desktop env and some goodies (*[installNOi3.sh](https://github.com/ianjberdahl/customz/raw/refs/heads/main/installNOi3.sh) just updates/upgrades and installs goodies*)

## zshrc 
To add autosuggestions for autocomplete.
```
cd $ZSH_CUSTOM/plugins/
git clone https://github.com/zsh-users/zsh-autosuggestions.git
```
Then add to your *.zshrc*.
```
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=(git zsh-autosuggestions)
```
