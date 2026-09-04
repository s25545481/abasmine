#!/bin/bash

echo "=== Starting MCSManager ==="

# Set MCSManager web port to Railway's PORT
export MCSM_PORT=${PORT:-8080}

# Start daemon
screen -dmS mcsm-daemon bash -c 'cd /opt/mcsmanager/daemon && node app.js'
echo "[OK] Daemon started"

sleep 2

# Start web on Railway's port
screen -dmS mcsm-web bash -c "cd /opt/mcsmanager/web && PORT=$MCSM_PORT node app.js"
echo "[OK] Web started on port $MCSM_PORT"

echo ""
echo "=== MCSManager is running! ==="
echo "Open the Railway URL to access the panel"
echo ""
echo "=== Starting playit.gg for Minecraft port ==="
echo "After setup, players connect via your playit.gg address on port 25565"
echo ""

# Keep container alive and show logs
playit &

# Keep container running
tail -f /dev/null
