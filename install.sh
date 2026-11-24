#!/usr/bin/env bash
set -euo pipefail

source_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/theme"
target_dir="${XDG_DATA_HOME:-$HOME/.local/share}"

for package in \
    color-schemes/Archmage.colors \
    color-schemes/ArchmageSapphire.colors \
    icons/Archmage \
    icons/ArchmageSapphire \
    plasma/desktoptheme/archmage \
    plasma/desktoptheme/archmage-sapphire \
    plasma/look-and-feel/org.archmage.desktop \
    plasma/look-and-feel/org.archmage.sapphire.desktop \
    wallpapers/ArchmageEclipse \
    wallpapers/ArchmageLibrary \
    wallpapers/ArchmageLunarObservatory \
    wallpapers/ArchmageGlacialScriptorium
do
    destination="$target_dir/$package"
    mkdir -p -- "$(dirname -- "$destination")"
    if [[ -d "$source_dir/$package" ]]; then
        mkdir -p -- "$destination"
        cp -R -- "$source_dir/$package/." "$destination/"
    else
        cp -- "$source_dir/$package" "$destination"
    fi
done

printf '%s\n' 'Archmage and Archmage Sapphire are installed. Choose either under System Settings → Colors & Themes → Global Theme.'
