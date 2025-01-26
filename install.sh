#!/bin/bash

function banner() {
    echo -e "\033[1;34m---------------------------------------\033[0m"
    echo -e "\033[1;32m$1\033[0m"
    echo -e "\033[1;34m---------------------------------------\033[0m"
}

function get_target_dir() {
    local prompt_message="$1"
    local default_dir="$2"
    read -p "$prompt_message" target_dir
    if [[ -z "$target_dir" ]]; then
        target_dir="$default_dir"
    else
        target_dir="${target_dir/#\~/$HOME}"
    fi
    mkdir -p "$target_dir"
    echo "$target_dir"
}

function copy_assets() {
    local source="$1"
    local destination="$2"
    banner "🚀 Copying assets to $destination"
    cp -r "$source" "$destination"
}

function update_config_files() {
    local configs=($@)
    updated_configs=()
    skipped_configs=()

    for config in "${configs[@]}"; do
        if [[ -f "$config" ]]; then
            echo -e "⚙️  Updating $config..."
            sed -i "s|\$HOME/.local/share/dotfiles|$target_dir|g" "$config"
            updated_configs+=("$config")
        else
            echo -e "❌ File $config not found, skipping."
            skipped_configs+=("$config")
        fi
    done
}

function setup_symlinks() {
    local config_dirs=($1)
    linked_configs=()
    skipped_links=()

    for config_dir in $config_dirs; do
        if [[ -d "$config_dir" ]]; then
            local config_name=$(basename "$config_dir")
            local config_target="$HOME/.config/$config_name"

            read -p "🔄 Do you want to enable the configuration for $config_name? (y/n): " choice
            case "$choice" in
                y|Y)
                    if [[ -d "$config_target" && ! -L "$config_target" ]]; then
                        echo -e "🔄 Existing directory $config_target found. Renaming to $config_target-backup."
                        mv "$config_target" "$config_target-backup"
                    fi
                    echo -e "✅ Creating a symbolic link for $config_name..."
                    ln -sfn "$(pwd)/.config/$config_name" "$config_target"
                    linked_configs+=("$config_name")
                    ;;
                n|N)
                    echo -e "⏭️  Skipping $config_name."
                    skipped_links+=("$config_name")
                    ;;
                *)
                    echo -e "⚠️  Invalid choice. Skipping $config_name."
                    skipped_links+=("$config_name")
                    ;;
            esac
        fi
    done
}

function handle_starship() {
    local starship_file="./.config/starship.toml"
    if [[ -f "$starship_file" ]]; then
        local config_target="$HOME/.config/starship.toml"
        read -p "🔄 Do you want to enable the configuration for starship.toml? (y/n): " choice
        case "$choice" in
            y|Y)
                if [[ -f "$config_target" && ! -L "$config_target" ]]; then
                    echo -e "🔄 Existing file $config_target found. Renaming to $config_target-backup."
                    mv "$config_target" "$config_target-backup"
                fi
                echo -e "✅ Creating a symbolic link for starship.toml..."
                ln -sfn "$(pwd)/.config/starship.toml" "$config_target"
                linked_configs+=("starship.toml")
                ;;
            n|N)
                echo -e "⏭️  Skipping starship.toml."
                skipped_links+=("starship.toml")
                ;;
            *)
                echo -e "⚠️  Invalid choice. Skipping starship.toml."
                skipped_links+=("starship.toml")
                ;;
        esac
    fi
}

function print_summary() {
    echo -e "\n\033[1;33mSummary:\033[0m"
    printf "\033[1;34m%-30s %-10s\033[0m\n" "Configuration" "Status"
    for config in "${updated_configs[@]}"; do
        printf "%-30s %-10s\n" "$(basename $config)" "Updated"
    done
    for config in "${skipped_configs[@]}"; do
        printf "%-30s %-10s\n" "$(basename $config)" "Skipped"
    done
    for link in "${linked_configs[@]}"; do
        printf "%-30s %-10s\n" "$link" "Linked"
    done
    for link in "${skipped_links[@]}"; do
        printf "%-30s %-10s\n" "$link" "Not Linked"
    done
}

# Main script execution
assets_dir=$(get_target_dir "📂 Enter the directory where you want to store assets (e.g., ~/.local/share/dotfiles): " "$HOME/.local/share/dotfiles")
copy_assets "./assets/images/*.png" "$assets_dir"

fonts_dir=$(get_target_dir "📂 Enter the directory where you want to store fonts (e.g., ~/.local/share/fonts/ttf): " "$HOME/.local/share/fonts/ttf")
copy_assets "./fonts/*" "$fonts_dir"

banner "📦 Updating font cache"
fc-cache -f -v
if [[ $? -eq 0 ]]; then
    echo -e "✔️  Fonts have been installed successfully in $fonts_dir."
else
    echo -e "❌ Failed to update font cache. Check your font installation."
fi

banner "🔧 Updating configuration files"
update_config_files \
    "./.config/fastfetch/config.jsonc" \
    "./.config/hypr/hyprpaper.conf"

banner "🛠️ Setting up configurations"
setup_symlinks "./.config/*"
handle_starship

banner "🎉 Installation complete"
echo -e "✔️  Assets have been copied to $assets_dir."
echo -e "✔️  Fonts have been copied to $fonts_dir."
echo -e "✔️  Configuration files have been updated."
echo -e "✔️  Symbolic links have been created for selected configurations."
print_summary
