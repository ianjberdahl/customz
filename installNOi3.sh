#!/bin/bash
# Upgrade and Update script adding i3 and tools
# Author: Jay


echo -n "Ensure your /etc/apt/sources.list.d/parrot.list has the lines uncommented\n"
echo -n "----\n"
echo -n "deb https://deb.parrot.sh/parrot lory main contrib non-free non-free-firmware\n"
echo -n "deb https://deb.parrot.sh/direct/parrot lory-security main contrib non-free non-free-firmware\n"
echo -n "----\n"
echo -n "Also comment out Backports as were not worried about bleeding edge features\n"
echo -n "----\n"
echo -n "deb https://deb.parrot.sh/parrot lory-backports main contrib non-free non-free-firmware\n"
echo " "
echo -n "You have 10 seconds to quit if you need to do this, if not, update and upgrade will commence\n"
sleep 10
echo -n "Making your tools and programs dirs in /opt"

# Making tmp dir
mkdir -p /tmp/Install

# Making dirs in /opt
sudo mkdir -p /opt/tools
sudo mkdir -p /opt/programs
sudo mkdir -p /opt/tools/ligolo/windows

# Update and Upgrade

sudo apt-get update && sudo apt full-upgrade -y

# Installing other tools (can add more)
echo -n "Installing some Goodies!!"
sudo apt-get install -y wget curl git thunar cmake 
sudo apt-get install -y arandr flameshot arc-theme feh  i3status python3-pip rofi unclutter cargo compton imagemagick
sudo apt-get install -y cifs-utils netexec neo4j nfs-common krb5-user freerdp2-x11 ftp ffuf rlwrap exploitdb
npm install -g tldr

# Github Repos and Things
sudo wget -q https://github.com/AlessandroZ/LaZagne/releases/download/v2.4.6/LaZagne.exe -P /usr/share/windows-resources/binaries
sudo wget -q https://github.com/SnaffCon/Snaffler/releases/download/1.0.170/Snaffler.exe -P /usr/share/windows-resources/binaries
sudo wget -q https://github.com/TheWover/donut/releases/download/v1.0/donut_v1.0.tar.gz -P /tmp/Install
sudo mv /tmp/Install/donut/donut /opt/programs && sudo chmod +x /opt/programs/donut
sudo git clone https://github.com/XiaoliChan/LDAPShell.git /opt/tools
sudo ln -s /opt/tools/LDAPShell/ldapshell.py /opt/programs/ldapshell
sudo wget -q https://github.com/flozz/p0wny-shell/raw/refs/heads/master/shell.php -P /opt/tools
sudo wget -q https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -P /opt/programs
sudo mv /opt/programs/kerbrute_linux_amd64 /opt/programs/kerbrute && sudo chmod +x /opt/programs/kerbrute
sudo wget -q https://github.com/BloodHoundAD/BloodHound/releases/download/v4.3.1/BloodHound-linux-x64.zip -P /opt/tools
sudo mv /tmp/Install/BloodHound-linux-x64 /opt/tools
sudo ln -s /opt/tools/BloodHound-linux-x64/BloodHound /opt/programs/BloodHound
sudo git clone https://github.com/urbanadventurer/username-anarchy.git /opt/tools
sudo ln -s /opt/tools/username-anarchy/username-anarchy /opt/programs
sudo git clone https://github.com/NetSPI/PowerUpSQL.git /opt/tools
sudo wget -q https://github.com/projectdiscovery/nuclei/releases/download/v3.3.4/nuclei_3.3.4_linux_amd64.zip -P /tmp/Install
sudo mv /tmp/Install/nuclei /opt/programs
sudo chmod +x /opt/programs/nuclei
sudo -q wget https://github.com/projectdiscovery/katana/releases/download/v1.1.0/katana_1.1.0_linux_amd64.zip -P /opt/Install
sudo mv /opt/Install/katana /opt/programs
sudo chmod +x /opt/programs/katana
sudo wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.6.2/ligolo-ng_agent_0.6.2_linux_amd64.tar.gz -P /opt/tools/ligolo
sudo wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.6.2/ligolo-ng_proxy_0.6.2_linux_amd64.tar.gz -P /opt/tools/ligolo
sudo wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.6.2/ligolo-ng_agent_0.6.2_windows_amd64.zip -P /opt/tools/ligolo/windows
wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.6.2/ligolo-ng_proxy_0.6.2_windows_amd64.zip -P /opt/tools/windows

# Installing pipx
echo -n "Installing pipx and breaking system packages to do it"
python3 -m pip install --user pipx --break-system-packages
pipx ensurepath

# Installing via pipx
pipx install bloodhound-python
pipx install 'git+https://github.com/ScorpionesLabs/MSSqlPwner.git'

# Nano Syntax Highlighting
echo -n "include /usr/share/nano/*.nanorc" > ~/.nanorc

# Add to Path
export PATH=$PATH:/opt/programs
source /home/jaybit/.zshrc

# Summary
echo -n "All upgraded\n"
echo -n "Happy Hacking\n"