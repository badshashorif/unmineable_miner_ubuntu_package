#!/bin/bash

# ---------------------------
# Unmineable RandomX Mining Installer for Ubuntu
# By Badsha Faysal
# ---------------------------

# === CONFIGURATION ===
WALLET="bnb:0x8bc6e382f7f3fa5e9b8dc1c7d12704649eb63d1c.TEST_2#ref=nksi-ouwo"  # এখানে আপনার Binance BEP20 Address দিন
THREADS=$(nproc) # Use all CPU threads
XM_VERSION="6.21.1"

echo "[+] Updating system..."
sudo apt update && sudo apt install -y curl tar screen

echo "[+] Downloading XMRig..."
curl -L -o xmrig.tar.gz https://github.com/xmrig/xmrig/releases/download/v$XM_VERSION/xmrig-$XM_VERSION-linux-x64.tar.gz
tar -xvf xmrig.tar.gz
cd xmrig-$XM_VERSION

echo "[+] Creating start script..."
cat <<EOF > start.sh
#!/bin/bash
./xmrig -a rx -o rx.unmineable.com:3333 -u $WALLET -p x --threads=$THREADS
EOF

chmod +x start.sh

echo "[+] Starting miner in screen session 'miner'..."
screen -dmS miner ./start.sh

echo "[✔] Mining started in background (screen session: miner)"
echo "[✔] Use 'screen -r miner' to view miner output"
