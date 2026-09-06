#!/usr/bin/env bash

# Ensure the script is run with superuser privileges
if [[ $EUID -ne 0 ]]; then
   echo "Error: This script must be run as root (via sudo)." 
   exit 1
fi

# Determine the target user
# Use the user who invoked sudo, or fallback to the first passed argument
TARGET_USER="${1:-${SUDO_USER:-$USER}}"

if [[ "$TARGET_USER" == "root" ]]; then
   echo "Error: Could not determine a regular user."
   echo "Usage: sudo ./fix-i2c.sh [username]"
   exit 1
fi

echo "=== Configuring I2C permissions for user: $TARGET_USER ==="

# 1. Check and create the i2c group
if ! getent group i2c > /dev/null 2>&1; then
    echo "[+] Creating 'i2c' group..."
    groupadd i2c
else
    echo "[v] Group 'i2c' already exists."
fi

# 2. Add the user to the group
if id -nG "$TARGET_USER" | grep -qw "i2c"; then
    echo "[v] User $TARGET_USER is already a member of the 'i2c' group."
else
    echo "[+] Adding user $TARGET_USER to the 'i2c' group..."
    usermod -aG i2c "$TARGET_USER"
fi

# 3. Create the udev rule
UDEV_RULE_PATH="/etc/udev/rules.d/99-i2c.rules"
echo "[+] Writing udev rule to $UDEV_RULE_PATH..."
echo 'KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"' > "$UDEV_RULE_PATH"

# 4. Apply the rules
echo "[+] Applying new udev rules..."
udevadm control --reload-rules
udevadm trigger

echo "=== Configuration completed successfully ==="
echo "Checking current device permissions:"
ls -l /dev/i2c-0 2>/dev/null | head -n 1 || echo "I2C buses are not yet initialized by the kernel."
echo ""
echo "WARNING: You must completely log out of your session and log back in for the new group permissions to take effect!"