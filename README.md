# 🔧 Unmineable CPU Miner for Ubuntu (RandomX)

This project sets up XMRig CPU miner on Ubuntu to mine any coin from Unmineable (e.g., BNB, SHIB, PEPE) using RandomX algorithm.

---

## 🚀 Setup Instructions

### 1. Download & Run

```bash
wget https://your-link/setup.sh
chmod +x setup.sh
./setup.sh
```

> ⚠️ Edit the script to replace `WALLET` with your own BEP20 or other address before running.

---

## ⚙️ Configuration Example

```
bnb:0xYourBEP20Address.WorkerName#ref=nksi-ouwo
```

Supports:
- `bnb:`, `doge:`, `shib:`, `btc:`, `pepe:` etc.

---

## 💻 View Miner Output

```bash
screen -r miner
```

To detach (background):
```bash
Ctrl + A then D
```

---

## 🛠️ Troubleshooting

| Problem | Solution |
|--------|----------|
| ❌ `screen -r miner` shows multiple sessions | Run `screen -ls`, then `screen -r <session>` or kill old ones with `screen -S <session> -X quit` |
| ❌ Low hashrate | Make sure CPU threads are not limited or thermally throttled |
| ❌ No payout | Ensure you're using correct address format and worker name |
| ❌ Not showing in dashboard | Wait 5–10 minutes after mining starts |
| ❌ Wants to stop miner | Run `screen -X -S miner quit` to terminate |

---

## 🔁 Auto Start on Boot (Optional)

Coming soon as `miner.service` systemd unit.


## ✅ নতুন সংযোজনসমূহ:

### 1. 🛠️ `unmineable-miner.service` (systemd auto-start)

Linux boot হলেই miner চালু হবে।

**ইনস্টল করার নিয়ম:**

```bash
sudo cp unmineable-miner.service /etc/systemd/system/
sudo systemctl daemon-reexec
sudo systemctl enable unmineable-miner
sudo systemctl start unmineable-miner
```

---

### 2. 📲 `notify_telegram.sh` (Telegram Alert Script)

Mining শুরু হলে Telegram এ নোটিফিকেশন যাবে।

**ব্যবহারের নিয়ম:**

1. `BOT_TOKEN` আর `CHAT_ID` সেট করুন
2. রান করুন:

```bash
bash notify_telegram.sh
```

---

### 3. ⚡ `GPU_SUPPORT.md` (NVIDIA/AMD miner config)

Unmineable-এর জন্য NBMiner বা T-Rex দিয়ে কিভাবে GPU miner চালাবেন — সেটার বিস্তারিত।


---

## 🧑‍💻 Created Badsha Faysal
