ls
git init
git config --global user.name fxlip
git config --global user.email felip42@gmail.com
git config --global core.editor nano
nano -v
git config --list
git init
git status
cd ~/.git/
touch .gitignore
git rm --cached .
git rm --cached .bashrc
ls
nano config 
ls
cd ../
cd ~/.config/
ls 
cd yadm/
ls
cd ../
sudo apt remove yadm
cd 
ls
ls -a
nano .gitconfig 
nano .gitignore
git config --global core.excludesFile ~/.gitignore
git status
nano .gitignore
nano .profile 
git status
nano .gitignore
cd .config/
ls
nano .gitignore
cd ../
nano .gitignore
git status
git clone https://github.com/fxlip/.dotfiles
ls
ls -a
cd .dotfiles/
ls
cd ../
git status
git add .
nano .gitignore 
ssh-keygen -t ed25519 -C "felip42@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub 
ssh -T git@github.com
git status
nano .gitignore 
git add .
git commit -m "hello world"
git remote add origin git@github.com:fxlip/.dotfiles.git
git pull -u origin main
git pull origin main
git status
ls 
ls -a
git status
git push origin main
git status
git remote add origin git@github.com:fxlip/.dotfiles.git
git push -u origin main
git branch 
git branch -m master main
git checkout -b main
git status
git add .
git commit -m "hello world"
git push -u origin main
ls -a
cd .dotfiles/
ls
sudo apt install code
sudo apt update
sudo apt upgrade
sudo apt install code
sudo apt install software-properties-common apt-transport-https curl
sudo apt install snapd
sudo snap install code --classic
sudo snap run code
snap run code
git status
git push origin main
git add .
git commit -m "primeiro update"
git push origin master
git push origin main
git status
git add .
git commit -m "dotfiles rebase"
git push origin main
git status
git add .
git commit -m "wallpaper1"
git push origin main
git status
sudo apt install conky
git status
sudo apt install conky-all
conky
ls -a
conky -v
git status
git add .
git commit -m "configs default"
git push origin main
git status
git add .
git commit -m "conky add"
conky -c ~/.config/conky/esquerda.conf 
pkill conky
cd /etc/apt/sources.list.d/
nano /etc/apt/sources.list
sudo apt install linux-headers-$(uname -r) 
sudo apt install nvidia-driver 
nano /etc/apt/sources.list
sudo nano /etc/apt/sources.list
cd
clear
sudo apt update
sudo apt upgrade
sudo apt install nvidia-driver 
sudo apt install nvidia-driver
sudo apt purge nvidia-*
sudo apt autoremove 
sudo apt update
sudo apt upgrade
sudo apt install nvidia-driver
sudo nano /etc/apt/sources.list
sudo apt update
sudo apt upgrade
sudo apt install nvidia-driver
sudo apt --fix-broken install
sudo apt --fix-broken install nvidia-driver
lspci | grep -i nvidia
nvidia-smi
sudo reboot 0
sudo apt update
sudo apt upgrade
sudo apt install nvidia-driver
sudo apt install build-essential
gcc -v
sudo apt install software-properties-common
sudo apt install gcc-12 g++-12 gcc-13 g++-13 -y
sudo apt install gcc-12 g++-12 -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 12 --slave /usr/bin/g++ g++ /usr/bin/g++-12
sudo update-alternatives --config gcc
sudo apt install pkg-config libglvnd-dev
sudo apt install nvidia-driver
sudo nano /etc/apt/sources.list
sudo apt update
sudo apt upgrade
sudo apt install nvidia-driver
sudo nano /etc/apt/sources.list
sudo apt update
sudo apt upgrade
sudo reboot 0
conky -c ~/.config/conky/esquerda.conf 
pkill conky
sudo apt  install curl lm-sensors hddtemp
sudo apt  install curl lm-sensors
conky -c ~/.config/conky/esquerda.conf 
~/.config/conky/scripts/start.sh 
cd /home/fxlip/.config/conky/scripts/
ls
git status
git add .
git commit -m "ajustes finos"
git push origin main
sudo apt install gnome-tweaks
cd Downloads/
ls
ls -a
cd dotfiles-main
ls -a
cd .dotfiles-main/
ls -a
cd ../../
cd 
git status
git add .
git commit -m "updt bash"
git push origin main
sudo reboot 0
teste
~/.config/conky/scripts/start.sh 
git status
git add .
git commit -m "config monitores"
git push origin main
sudo nano /etc/default/grub
pkill conky
sudo nano /etc/default/grub
sudo update-grub
sudo reboot 0
pkill conky
sudo nano /etc/default/grub
sudo update-grub
sudo reboot 0
pkill conky
sudo nano /etc/default/grub
sudo update-grub
sudo reboot 0
ls
cd .
startx
cd .
cd ..
ls
cd etc/
ls
cd default/
ls
nano grub
sudo nano grub
sudo reboot 0
cd 
cd ..
sudo nano etc/default/grub
sudo upgrade-grub
sudo apt upgrade-grub
sudo apt upgrade grub
sudo apt grub-upgrade
sudo update-grub
sudo reboot 0
sudo apt install plymouth
sudo apt update
sudo apt upgrade
clear
sudo apt install plymouth
sudo plymouth-set-default-theme -R plymouth-theme-script
ls /usr/share/plymouth/themes/
cd Downloads/
cp -r simplefuture/ /usr/share/plymouth/themes/
ls /usr/share/plymouth/
ls /usr/share/plymouth/themes/
sudo cp -r simplefuture/ /usr/share/plymouth/themes/
ls /usr/share/plymouth/themes/
plymouth
sudo plymouth-set-default-theme -R simplefuture
sudo reboot 0
sudo apt install gnome-shell-extension-dash-to-dock
sudo apt install gnome-shell-extension-dash-to-panel 
sudo apt update
sudo apt upgrade
sudo apt update
for i in {0..15}; do echo -e "\e[48;5;${i}m Cor ${i} \e[0m"; done
printf "\e[38;5;%sm Cor de texto %s \e[0m\n" {0..15} {0..15}
printf "\e[48;5;%sm Cor de fundo %s \e[0m\n" {0..15} {0..15}
for fg in {30..37} {90..97}; do   for bg in {40..47} {100..107}; do     echo -en "\e[${fg};${bg}m FG:${fg} BG:${bg} \e[0m";   done;   echo; done
clear
ls
cd 
ls -a --color=auto
man ls
cat .bash
cat .bashrc 
clear
cd .dotnet/
ls
cd corefx/
ls
clear
ls
cd ~
lks
lss
ls
cd Documentos/
ls
cd ../
cd /
ls
cd etc/
ls
cd apt/
ls
cd keyrings/
ls
clear
ls
cd ../../
ls
clear
ls
cd  ../
clear
ls
cd etc/
ls
export PS1="\[\e[38;5;1m\]Meu Prompt \[\e[0m\]\$ "
teste
exit
sudo apt update
curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash
clear
sudo apt update
sudo snap install obsidian 
sudo snap install obsidian --classic
cat ~/.Xauthority 
rm ~/.Xauthority 
sudo apt install webalizer 
