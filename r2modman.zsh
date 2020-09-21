#!/bin/zsh

function r2modman {
  ror2_dir="/mnt/sda/SteamLibrary/steamapps/common/Risk of Rain 2"

  cwd=$(pwd)

  cd ${HOME}/Documents/r2modmanPlus
  node_modules/.bin/quasar dev -m electron

  # wait for r2modmanPlus to close

  cd ${HOME}/.config/r2modmanPlus-local/mods/profiles/Default/
  rm -r "${ror2_dir}/BepInEx/plugins/"
  cp -r ./BepInEx/ "${ror2_dir}"

  cd ${cwd}
}
