#!/bin/bash

# === CONFIGURATION ===
BOT_TOKEN="YOUR_TELEGRAM_BOT_TOKEN"
CHAT_ID="YOUR_CHAT_ID"
MESSAGE="💰 Unmineable Miner Started on $(hostname) with $(nproc) threads"

# === SEND NOTIFICATION ===
curl -s -X POST https://api.telegram.org/bot$BOT_TOKEN/sendMessage \
  -d chat_id=$CHAT_ID -d text="$MESSAGE"
