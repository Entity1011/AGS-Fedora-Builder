sudo dnf install typescript\
            npm\
            meson\
            gjs-devel\
            gtk3-devel\
            gtk-layer-shell\
            gnome-bluetooth\
            upower\
            NetworkManager\
            pulseaudio-libs-devel\
            libdbusmenu-gtk3\
            libsoup3

git clone --recursive https://github.com/Aylur/ags.git /tmp/agsv1
cd /tmp/agsv1
npm install
meson setup build
meson install -C build