!/bin/bash

echo "Setup inicial do pc"

#Primeiramente se atualiza o sistema e instala os novos repositorios

sudo xbps-install -Syu && sudo xbps-install -Sy void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree

# Apos isso se instala os utilitarios iniciais para futuras builds


sudo xbps-install -Sy git wget curl zsh base-devel make cmake xorg i3 i3status sddm NetworkManager dbus elogind polkitd firefox nvim btop fastfetch rofi
#Agora faz a copia das .files

git clone github.com/jecat4tu/setup-void-linux.git

cd setup-void-linux/
cp -f config ~/.config/




#instala o st como emulador de terminal

mkdir suckless
cd suckless/
git clone https://git.suckless.org/st
cd st
sudo make clean install

#dando um cd para sair do diretorio
cd



#instalacao do mysql-server e do dbeaver

sudo xbps-install -Sy myql-server dbeaver



#Por fim faz o link do runit para ativacao dos servicos necessarios

sudo ln -s /etc/sv/{NetworkManager,dbus,elogind,sddm,mysqld} /var/service/

#lanca um fastfetch se nao ocorrer erros

fastfetch

