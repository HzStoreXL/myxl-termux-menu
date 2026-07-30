#!/data/data/com.termux/files/usr/bin/bash
set -e

DEST="$HOME/.jwf-menu1"
mkdir -p "$DEST" "$PREFIX/bin"

# Salin menu1 utama
cp -f menu1.sh "$DEST/menu1.sh"
chmod +x "$DEST/menu1.sh"

# Backup bashrc
if [ -f "$HOME/.bashrc" ]; then
  cp -f "$HOME/.bashrc" "$HOME/.bashrc.bak.jwf"
fi

# Tambahkan autoload ke .bashrc kalau belum ada
LINE='[ -f "$HOME/.jwf-menu1/menu1.sh" ] && . "$HOME/.jwf-menu1/menu1.sh"'
grep -qxF "$LINE" "$HOME/.bashrc" || echo "$LINE" >> "$HOME/.bashrc"

# Pesan sukses
echo -e "\n\e[32m✅ Instalasi selesai. Menjalankan menu sekarang...\e[0m"
sleep 1

# Jalankan menu1.sh langsung
bash "$DEST/menu1.sh"
