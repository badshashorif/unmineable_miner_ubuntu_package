#!/bin/bash

# ---------------------------
# Unmineable RandomX Optimized Miner Setup
# By Badsha Faysal
# ---------------------------

# === CONFIGURATION ===
WALLET="bnb:0x8bc6e382f7f3fa5e9b8dc1c7d12704649eb63d1c.TEST_2#ref=nksi-ouwo"
THREADS=20
XM_VERSION="6.21.1"

echo "[+] Updating system & installing required packages..."
sudo apt update && sudo apt install -y curl tar screen msr-tools cpufrequtils

echo "[+] Enabling HugePages..."
echo 'vm.nr_hugepages=128' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

echo "[+] Configuring CPU to performance mode..."
echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils
sudo systemctl disable ondemand
sudo systemctl enable cpufrequtils
sudo systemctl start cpufrequtils

echo "[+] Enabling Intel MSR tweaks (if supported)..."
sudo modprobe msr
sudo wrmsr -a 0x1a4 0xf || echo "MSR tweak skipped (non-Intel CPU?)"

echo "[+] Downloading XMRig $XM_VERSION..."
curl -L -o xmrig.tar.gz https://github.com/xmrig/xmrig/releases/download/v$XM_VERSION/xmrig-$XM_VERSION-linux-x64.tar.gz
tar -xvf xmrig.tar.gz
cd xmrig-$XM_VERSION

echo "[+] Creating start.sh for miner..."
cat <<EOF > start.sh
#!/bin/bash
./xmrig -a rx -o rx.unmineable.com:3333 -u $WALLET -p x --threads=$THREADS --huge-pages
EOF

chmod +x start.sh

echo "[+] Creating systemd service..."
sudo tee /etc/systemd/system/xmrig.service > /dev/null <<EOF
[Unit]
Description=XMRig CPU Miner
After=network.target

[Service]
ExecStart=/root/xmrig-$XM_VERSION/start.sh
Restart=always
Nice=10
CPUWeight=90

[Install]
WantedBy=multi-user.target
EOF

echo "[+] Enabling miner service..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable xmrig.service
sudo systemctl start xmrig.service

echo "[✔] Setup complete!"
echo "🟢 You can check status using: sudo systemctl status xmrig"
echo "📺 OR: screen -r miner (if running via screen manually)"
