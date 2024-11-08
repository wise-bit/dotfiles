# #!/bin/bash 

DEST_DIR="$(pwd)"

NIX_FILES_DIR="$DEST_DIR/nix-files"
OTHER_CONFIGS_DIR="$DEST_DIR/other-configs"
mkdir -p "$NIX_FILES_DIR" "$OTHER_CONFIGS_DIR"

CONFIG_FILES=(
  "/etc/nixos/configuration.nix"
  "/etc/nixos/hardware-configuration.nix"
  "/etc/nixos/prog-configs.nix"
  "~/.config/home-manager/home.nix"
  "~/.config/alacritty/alacritty.toml"
)

# Function to copy files
copy_files() {
  local files=("$@")
  for file in "${files[@]}"; do
    file_expanded="${file/#\~/$HOME}"
    if [ -f "$file_expanded" ]; then
      if [[ "$file" == *.nix ]]; then
        cp -f "$file_expanded" "$NIX_FILES_DIR/${file##*/}"
      else
        cp -f "$file_expanded" "$OTHER_CONFIGS_DIR/${file##*/}"
      fi
    else
      echo "warning: $file_expanded does not exist or is not a file."
    fi
  done
}

copy_files "${CONFIG_FILES[@]}"
echo "files updated!"

