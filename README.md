# My Dotfiles

This dotfiles are inspired by the [Nord Theme](https://www.nordtheme.com/), and are designed to be simple and easy to use.  
Check the Nord Theme color palette [here](https://www.nordtheme.com/docs/colors-and-palettes).

### Table of Contents 📚
- [Features](#features-)
- [Requirements](#requirements-)
- [Installation](#installation-)
- [Documentation](#documentation-)
- [External configurations](#external-configurations-)
- [Screenshots](#screenshots-)
- [Contributing](#contributing-)

### Features 🎨
- **btop++**: [Configuration Folder](https://github.com/a-lebailly/dotfiles/tree/main/config/btop)
- **cava**: [Configuration Folder](https://github.com/a-lebailly/dotfiles/tree/main/config/cava)
- **fastfetch**: [Configuration Folder](https://github.com/a-lebailly/dotfiles/tree/main/config/fastfetch)
- **hypr**: [Configuration Folder](https://github.com/a-lebailly/dotfiles/tree/main/config/hypr)
- **kitty**: [Configuration Folder](https://github.com/a-lebailly/dotfiles/tree/main/config/kitty)
- **rofi**: [Configuration Folder](https://github.com/a-lebailly/dotfiles/tree/main/config/rofi)
- **waybar**: [Configuration Folder](https://github.com/a-lebailly/dotfiles/tree/main/config/waybar)
- And many other external configurations (*see below*)

### Requirements 📦
| **Name**  | **Requirements**                                                                                        |
|-----------|---------------------------------------------------------------------------------------------------------|
| btop++    | *No requirements*                                                                                       |
| cava      | *No requirements*                                                                                       |
| fastfetch | `./assets/nord-theme.png`                                                                               |
| hypr      | [Breeze Cursor](https://github.com/KDE/breeze/tree/master/cursors/Breeze) and `./assets/nord-theme.png` |
| kitty     | `./fonts/CaskaydiaCoveNerdFont`                                                                         |
| rofi      | `./fonts/UbuntuNerdFont`                                                                                |
| waybar    | `./fonts/UbuntuNerdFont`                                                                                |

### Installation 🚀
You can install the configurations manually or use the automated installation script.

**Clone the repository**:
```bash
git clone https://github.com/a-lebailly/dotfiles.git && cd dotfiles
```

**Automated installation** :  
The automated installation script will ask you which configuration you want to install.  
The script will prompt you to install each configuration one by one.
```bash
chmod +x install.sh
./install.sh
```

**Manual installation** :  
To install manually all the configurations, you can use the following commands :
```bash
cp -r ./fonts/* ~/.local/share/fonts/
cp -r ./assets/* ~/.local/share/dotfiles/
cp -r ./config/* ~/.config/
```

To install a specific configuration, you can use the following commands :  
**Note**: Check the requirements before installing a specific configuration.
```bash 
# E.g. Install the kitty configuration
cp -r ./config/kitty ~/.config/
cp -r ./fonts/CaskaydiaCoveNerdFont ~/.local/share/fonts/
```

### Documentation 📖
- **rofi**: Execute `rofi -show drun -theme ~/.config/rofi/config.rasi` to open rofi and apply the style.

### External configurations 🌐
- **tty-clock**: Execute `tty-clock -c -C 6` or add this alias to your `.bashrc` or `.zshrc` file.
   ```bash
   # E.g. Add the alias to your .bashrc or .zshrc
   alias clock="tty-clock -c -C 6"
   ```
- **firefox**: Install the Nord Theme [here](https://addons.mozilla.org/fr/firefox/addon/nord-firefox/).
- **obsidian**: Install the Nord Theme [here](https://github.com/insanum/obsidian_nord).
- **vim/neovim**: Install the Nord Theme [here](https://github.com/nordtheme/vim).
- **jetbrains**: Install the Nord Theme [here](https://plugins.jetbrains.com/plugin/10321-nord).
- **vscode**: Install the Nord Theme [here](https://github.com/nordtheme/visual-studio-code).

You can find more ports of the Nord Theme [here](https://www.nordtheme.com/ports).

### Screenshots 📸

...

### Contributing 🤝
Feel free to contribute to this project by opening an issue or a pull request.
