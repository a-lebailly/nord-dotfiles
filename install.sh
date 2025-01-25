#!/bin/bash

function banner() {
    echo -e "\033[1;34m---------------------------------------\033[0m"
    echo -e "\033[1;32m$1\033[0m"
    echo -e "\033[1;34m---------------------------------------\033[0m"
}

read -p "📂 Enter the directory where you want to store assets (e.g., ~/.local/share/dotfiles): " target_dir
if [[ -z "$target_dir" ]]; then
    target_dir="$HOME/.local/share/dotfiles"
else
    target_dir="${target_dir/#\~/$HOME}"
fi

mkdir -p "$target_dir"

banner "🚀 Copying assets to $target_dir"
cp -r ./assets/*.png "$target_dir"

banner "🔧 Updating configuration files"
configs=(
    "./config/fastfetch/config.jsonc"
    "./config/hypr/hyprpaper.conf"
)

updated_configs=()
skipped_configs=()

for config in "${configs[@]}"; do
    if [[ -f "$config" ]]; then
        echo -e "⚙️  Updating $config..."
        sed -i "s|../../assets|$target_dir|g" "$config"
        updated_configs+=("$config")
    else
        echo -e "❌ File $config not found, skipping."
        skipped_configs+=("$config")
    fi
done

banner "🛠️ Setting up configurations"
config_dirs=("./config/*")

linked_configs=()
skipped_links=()

for config_dir in $config_dirs; do
    if [[ -d "$config_dir" ]]; then
        config_name=$(basename "$config_dir")
        read -p "🔄 Do you want to enable the configuration for $config_name? (y/n): " choice
        case "$choice" in
            y|Y)
                echo -e "✅ Creating a symbolic link for $config_name..."
                ln -sfn "$(pwd)/config/$config_name" "$HOME/.config/$config_name"
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

banner "🎉 Installation complete"
echo -e "✔️  Assets have been copied to $target_dir."
echo -e "✔️  Configuration files have been updated."
echo -e "✔️  Symbolic links have been created for selected configurations."

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

