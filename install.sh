#!/data/data/com.termux/files/usr/bin/bash
set -e

DEST="$HOME/.jwf-menu1"
mkdir -p "$DEST" "$PREFIX/bin"

# Salin menu1 utama
cp -f menu1.py "$DEST/menu1.py"
chmod +x "$DEST/menu1.py"

# Backup bashrc
if [ -f "$HOME/.bashrc" ]; then
  cp -f "$HOME/.bashrc" "$HOME/.bashrc.bak.jwf"
fi

# Tambahkan autoload ke .bashrc kalau belum ada
LINE='[ -f "$HOME/.jwf-menu1/menu1.py" ] && . "$HOME/.jwf-menu1/menu1.py"'
grep -qxF "$LINE" "$HOME/.bashrc" || echo "$LINE" >> "$HOME/.bashrc"

# Pesan sukses
echo -e "\n\e[32m✅ Instalasi selesai. Menjalankan menu sekarang...\e[0m"
sleep 1

# Jalankan menu1.py langsung
bash "$DEST/menu1.py"
