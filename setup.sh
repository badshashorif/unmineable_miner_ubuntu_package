#!/bin/bash

# ---------------------------
# Unmineable Miner + HugePages Setup (Ubuntu)
# Author: Badsha Faysal
# ---------------------------

# === CONFIGURATION ===
WALLET="bnb:0x8bc6e382f7f3fa5e9b8dc1c7d12704649eb63d1c.TEST_AUTO#ref=nksi-ouwo"
THREADS=20                # আপনি চাইলে এখানে থ্রেড সংখ্যা কাস্টম করতে পারেন
XM_VERSION="6.21.1"

echo "[+] Step 1: Updating system..."
sudo apt update && sudo apt install -y curl tar screen

echo "[+] Step 2: Enabling HugePages..."
echo "vm.nr_hugepages=128" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

echo "[+] Step 3: Downloading XMRig v$XM_VERSION..."
curl -L -o xmrig.tar.gz https://github.com/xmrig/xmrig/releases/download/v$XM_VERSION/xmrig-$XM_VERSION-linux-x64.tar.gz
tar -xvf xmrig.tar.gz
cd xmrig-$XM_VERSION

echo "[+] Step 4: Creating start.sh..."
cat <<EOF > start.sh
#!/bin/bash
./xmrig -a rx -o rx.unmineable.com:3333 -u $WALLET -p x --threads=$THREADS
EOF

chmod +x start.sh

echo "[+] Step 5: Starting miner inside screen session 'miner'..."
screen -dmS miner ./start.sh

echo ""
echo "[✔] Mining started successfully!"
echo "[✔] HugePages enabled. Use 'screen -r miner' to view mining log."
echo ""
grep Huge /proc/meminfo
