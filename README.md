# My Dotfiles

This dotfiles are inspired by the [Nord Theme](https://www.nordtheme.com/), and are designed to be simple and easy to use.  
Check the Nord Theme color palette [here](https://www.nordtheme.com/docs/colors-and-palettes).

### Roadmap 🗺️
- **kitty**: `Done`
- **hypr**: `Done`
- **fastfetch**: `Done`
- **rofi**: `Done`

### Requirements 📦
- `hypr`: `Breeze Cursors` and `./assets/wallpaper.png`.
- `kitty`: `./fonts/CaskaydiaCoveNerdFont`
- `fastfetch`: `./assets/nord-theme.png`

### Installation 🚀
```bash
git clone https://github.com/a-lebailly/dotfiles.githttps://github.com/a-lebailly/dotfiles
cd dotfiles
```

**Automated**:
The automated installation script will ask you which configuration you want to install.
```bash
chmod +x install.sh
./install.sh
```

**Manual (all)**:
To install manually all the configurations, you can use the following commands:
```bash
cp -r ./fonts/* ~/.local/share/fonts/
cp -r ./assets/* ~/.local/share/dotfiles/
cp -r ./config/* ~/.config/
```

**Manual (unitary)**:
To install a specific configuration, you can use the following commands:
```bash 
cp -r ./fonts/CaskaydiaCoveNerdFont ~/.local/share/fonts/
cp -r ./assets/* ~/.local/share/dotfiles/
cp -r ./config/kitty ~/.config/
cp -r ./config/hypr ~/.config/
cp -r ./config/fastfetch/ ~/.config/
...
```

### Documentation 📖
- **rofi**: Execute `rofi -show drun -theme ~/.config/rofi/config.rasi` to open the application launcher.

### Screenshots 📸

...

### Contributing 🤝
Feel free to contribute to this project by opening an issue or a pull request.
