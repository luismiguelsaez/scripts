
[[ "$(lsb_release -i)" =~ "Ubuntu" ]] && DISTRO="Deb"
[[ "$(lsb_release -i)" =~ "Debian" ]] && DISTRO="Deb"

if [ "${DISTRO}" == "Deb"]
then
  sudo apt-get update -y
  sudo apt-get install -y bat exa
  echo "alias c='clear'" >> ~/.bashrc
  echo "alias cat='batcat --theme='Solarized (light)''" >> ~/.bashrc
  echo "alias la='exa --all --long --sort date --group-directories-first --time modified --extended --git --icons --octal-permissions'" >> ~/.bashrc
  echo "alias ll='exa --long --sort date --group-directories-first --time modified --extended --git --icons --octal-permission'"        >> ~/.bashrc
fi
