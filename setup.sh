#!/bin/bash

# =============================================================================
# SCRIPT DE SETUP - FEDORA SWAY (DELL INSPIRON 14)
# Focado em C/C++, Python, Dart/Flutter e Computação Gráfica
# =============================================================================

echo "Iniciando setup... Prepare o café."

# 1. Atualização inicial do sistema
sudo dnf update -y

# 2. Adição de Repositórios Oficiais (Sublime, Docker, VirtualBox)
echo "Configurando repositórios externos..."

# Sublime Text
sudo rpm -v --import https://download.sublimetext.com/sublimehq-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# Docker
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# VirtualBox (Repositório oficial Oracle para Fedora)
sudo dnf config-manager --add-repo https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo

# 3. Habilitar Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# 4. Instalação de Pacotes via DNF
echo "Instalando ferramentas de sistema, hardware e compiladores..."

sudo dnf install -y \
    brightnessctl pavucontrol pipewire-utils blueman nm-connection-editor \
    neovim foot waybar wofi grim slurp swaylock \
    sublime-text \
    docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
    VirtualBox-7.0 \
    gcc gcc-c++ cmake make gdb binutils \
    python3 python3-devel python3-pip \
    mesa-libGL-devel mesa-libGLU-devel glfw-devel \
    sfml-devel raylib-devel SDL2-devel SDL2_image-devel SDL2_ttf-devel \
    kernel-devel kernel-headers dkms # Essenciais para os módulos do VirtualBox

# 5. Instalação de Apps via Flatpak
echo "Instalando Discord e Insomnia..."
flatpak install -y flathub com.discordapp.Discord rest.insomnia.Insomnia

# 6. Setup do Flutter/Dart
echo "Configurando ambiente Dart/Flutter..."
if [ ! -d "$HOME/development" ]; then
    mkdir ~/development
fi
# Baixando Flutter estável (ajuste o caminho se preferir manual)
sudo dnf install -y xz unzip
cd ~/development
git clone https://github.com/flutter/flutter.git -b stable

# 7. Pós-instalação e Permissões
echo "Ajustando permissões de grupo..."

# Docker sem sudo
sudo systemctl enable --now docker
sudo usermod -aG docker $USER

# VirtualBox Kernel Modules
sudo /sbin/vboxconfig

# Adicionar Flutter ao PATH (temporário para a sessão, adicione ao seu .bashrc ou .zshrc depois)
export PATH="$PATH:$HOME/development/flutter/bin"

echo "-----------------------------------------------------------"
echo "SETUP CONCLUÍDO!"
echo "1. Adicione 'export PATH=\$PATH:\$HOME/development/flutter/bin' ao seu shell config."
echo "2. REINICIE o computador para aplicar os grupos de usuário e módulos do kernel."
echo "-----------------------------------------------------------"
