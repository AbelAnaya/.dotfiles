#!/bin/bash

# Configuration
BOT_TOKEN="YOUR_BOT_TOKEN"
CHAT_ID="YOUR_CHAT_ID"
IP_FILE="/var/opt/public_ip"
CURRENT_IP=$(curl -s ifconfig.me)

# Function to send Telegram message
send_telegram_message() {
    local message=$1
    curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
        -d chat_id="${CHAT_ID}" \
        -d text="${message}" > /dev/null
}

# Check if the IP file exists; if not, create it
if [ ! -f "$IP_FILE" ]; then
    touch "$IP_FILE"
fi

# Read the last known IP from the file
LAST_IP=$(cat "$IP_FILE")

# If the IP has changed, update the file and send a Telegram notification
if [ "$CURRENT_IP" != "$LAST_IP" ]; then
    echo "$CURRENT_IP" > "$IP_FILE"
    send_telegram_message "Your public IP has changed to: $CURRENT_IP"
fi
