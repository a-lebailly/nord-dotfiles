# Dotfiles

### Roadmap 🗺️
- **kitty**: `Done`
- **hypr**: `Done`
- **fastfetch**: `Done`
- **rofi**: `WIP`

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
```bash
chmod +x install.sh
./install.sh
```

**Manual (all)**:
```bash
cp -r ./fonts/* ~/.local/share/fonts/
cp -r ./assets/* ~/.local/share/dotfiles/
cp -r ./config/* ~/.config/
```

**Manual (unitary)**:
```bash 
cp -r ./fonts/CaskaydiaCoveNerdFont ~/.local/share/fonts/
cp -r ./assets/* ~/.local/share/dotfiles/
cp -r ./config/kitty ~/.config/
cp -r ./config/hypr ~/.config/
cp -r ./config/fastfetch/ ~/.config/
...
```
