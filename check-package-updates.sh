#!/usr/bin/env bash
echo "Server = ${local_mirror}\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacman -Sy
if [[ $(pacman -Qu) && -n ${output_repo} ]]
then
  pacman -S --needed --noconfirm git
  git clone ${output_repo} ${output_repo}-output
  pacman -Qu | tee ${output_repo}-output/update_history
  cd ${output_repo}-output
  git config --global user.email $git_user_email
  git config --global user.name $git_user_name
  git commit -am "ci package updates"
else
  false
fi
