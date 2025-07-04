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

---

## 🧑‍💻 Created Badsha Faysal
