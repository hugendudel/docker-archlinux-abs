#!/usr/bin/env bash
echo "Server = http://archpkg.hendr.es/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacman --noprogressbar -Sy
if [[ $(pacman -Qu) && -n ${output_repo} ]]
then
  pacman -S --noprogressbar --needed --noconfirm git
  git clone ${output_repo} ${output_repo}-output
  pacman -Qu --noprogressbar | tee ${output_repo}-output/update_history
  cd ${output_repo}-output
  git config --global user.email $git_user_email
  git config --global user.name $git_user_name
  git commit -am "ci package updates"
else
  false
fi
