# Enable the COPR
sudo dnf copr enable solopasha/hyprland -y >/dev/null
sudo mv /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:solopasha:hyprland.repo /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:Entity:Hyprland.repo
sudo sed -i -e "s/Copr repo for hyprland owned by solopasha/Hyprland/g" /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:Entity:Hyprland.repo
sudo sed -i -e "s/gpgcheck=1/gpgcheck=0/g" /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:Entity:Hyprland.repo

# Install Dependencies
sudo dnf upgrade -y --refresh
sudo dnf install -y \
    git \
    NetworkManager \
    NetworkManager-wifi \
    NetworkManager-tui \
    npm \
    tsc \
    meson \
    g++ \
    cmake \
    rust-glib-devel \
    gobject-introspection-devel \
    gjs-devel \
    gtk3-devel \
    pulseaudio-libs-devel \
    pulseaudio-qt-qt5-devel \
    pulseaudio-qt-qt6-devel \
    pam-devel \
    axel \
    tinyxml2-devel \
    gtkmm3.0-devel \
    gtksourceview3-devel \
    gtksourceviewmm3-devel \
    gtk4-devel \
    libadwaita-devel \
    python3-gobject \
    python3-gobject-devel \
    libsoup3-devel \
    desktop-file-utils \
    rsync \
    hyprland-git \
    hyprlock \
    hypridle \
    foot \
    fish \
    gtk-layer-shell-devel \
    ddcutil \
    libdbusmenu-gtk3-devel \
    gnome-bluetooth \
    firefox \
    xdg-user-dir \
    yad \
    bc \
    hyprpaper \
    swww \
    gnome-font-viewer \
    polkit-125 \
    mate-polkit \
    wget \
    unzip \
    curl \
    gnome-control-center

# We need dart-sass
sudo npm install -g sass

# Install StarShip
cargo install starship --locked
sudo ln -s /home/Entity/.cargo/bin/starship /usr/local/bin/starship

git clone https://github.com/end-4/dots-hyprland /tmp/Dots
cd /tmp/Dots
sed -i -e "s/exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 || /usr/libexec/polkit-gnome-authentication-agent-1/exec-once= /usr/libexec/polkit-mate-authentication-agent-1/g" .config/hyprland/execs.conf
sed -i -e "s/meson install -C build/sudo meson install -C build/g" scriptdata/installers
cp .config/ ~ -R
cp .local/ ~ -R
bash -c "./manual-install-helper.sh <<< \"yesforall\""
sudo ln /usr/local/bin/agsv1 /usr/local/bin/ags

# Install the Nerd Fonts
cd /tmp
wget https://github.com/google/material-design-icons/raw/refs/heads/master/font/MaterialIcons-Regular.ttf
wget https://github.com/google/material-design-icons/raw/refs/heads/master/font/MaterialIconsOutlined-Regular.otf
wget https://github.com/google/material-design-icons/raw/refs/heads/master/font/MaterialIconsRound-Regular.otf
wget https://github.com/google/material-design-icons/raw/refs/heads/master/font/MaterialIconsSharp-Regular.otf
wget https://github.com/google/material-design-icons/raw/refs/heads/master/font/MaterialIconsTwoTone-Regular.otf
wget https://github.com/google/material-design-icons/raw/refs/heads/master/variablefont/MaterialSymbolsOutlined%5BFILL,GRAD,opsz,wght%5D.ttf
wget https://github.com/google/material-design-icons/raw/refs/heads/master/variablefont/MaterialSymbolsOutlined%5BFILL,GRAD,opsz,wght%5D.woff2
wget https://github.com/google/material-design-icons/raw/refs/heads/master/variablefont/MaterialSymbolsSharp%5BFILL,GRAD,opsz,wght%5D.ttf
wget https://github.com/google/material-design-icons/raw/refs/heads/master/variablefont/MaterialSymbolsSharp%5BFILL,GRAD,opsz,wght%5D.woff2
wget https://github.com/google/material-design-icons/raw/refs/heads/master/variablefont/MaterialSymbolsRounded%5BFILL,GRAD,opsz,wght%5D.ttf
wget https://github.com/google/material-design-icons/raw/refs/heads/master/variablefont/MaterialSymbolsRounded%5BFILL,GRAD,opsz,wght%5D.woff2
sudo mkdir /usr/share/fonts/GoogleMaterial
sudo mv Material* /usr/share/fonts/GoogleMaterial/

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SpaceMono.tar.xz
tar -xf SpaceMono.tar.xz
sudo mkdir /usr/share/fonts/SpaceMonoNerd
sudo mv SpaceMonoNerdFont* /usr/share/fonts/SpaceMonoNerd/
