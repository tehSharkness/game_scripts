#!/bin/zsh

source ${ZSH}/custom/countdown.zsh

function ds3_backup {
  timeout=$1

  if [ -z "${timeout}" ]; then
    timeout=300
  fi

  ds3_gameid="374320"
  steam_lib="/mnt/sdc/SteamLibrary/"
  save_dir="users/steamuser/Application Data/DarkSoulsIII/0110000102c5b38e"
  save="DS30000.sl2"

  prefix_path="${steam_lib}/steamapps/compatdata/${ds3_gameid}/pfx/drive_c"
  save_path="${prefix_path}/${save_dir}/${save}"

  backup_path="${HOME}/Documents/game_backups/Dark_Souls_III"

  mkdir -p ${backup_path}

  while true; do
    timestamp=$(date +%Y%m%d-%H%M%S)
    backup_file="${backup_path}/${timestamp}.sl2"
    echo "Backing up DS3 save to ${backup_file}..."
    cp ${save_path} ${backup_file}
    countdown ${timeout}
  done
}
