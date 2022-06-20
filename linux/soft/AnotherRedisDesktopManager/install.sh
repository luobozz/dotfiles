#!/bin/bash
sudo mkdir -p /opt/AnotherRedisDesktopManager
cd /opt/AnotherRedisDesktopManager
if [ ! -f "/opt/AnotherRedisDesktopManager/Another-Redis-Desktop-Manager.1.5.6.AppImage" ]; then
    sudo wget -O /opt/AnotherRedisDesktopManager/Another-Redis-Desktop-Manager.1.5.6.AppImage https://github.com/qishibo/AnotherRedisDesktopManager/releases/download/v1.5.6/Another-Redis-Desktop-Manager.1.5.6.AppImage
    sudo chmod +x /opt/AnotherRedisDesktopManager/Another-Redis-Desktop-Manager.1.5.6.AppImage
fi
sudo bash -c "cat > /opt/AnotherRedisDesktopManager/appRun.sh <<EOF
#!/bin/bash
exec /opt/AnotherRedisDesktopManager/Another-Redis-Desktop-Manager.1.5.6.AppImage
EOF"
sudo chmod +x /opt/AnotherRedisDesktopManager/appRun.sh