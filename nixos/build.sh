sudo nixos-rebuild switch &>nixos-switch.log || (
  cat nixos-switch.log | grep --color error && false
)

# ln -s [**/build.sh] ~/build.sh
# realpath ~/build.sh

