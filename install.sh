#!/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

clear
echo -e "${BLUE}==========================================${NC}"
echo -e "${CYAN}      Welcome to Mamadwhyt-UI             ${NC}"
echo -e "${CYAN}    The Most Elegant X-UI Edition         ${NC}"
echo -e "${BLUE}==========================================${NC}"
echo -e "${GREEN}Starting the clean installation process...${NC}"

# 1. Update and install dependencies
apt update && apt install curl socat -y

# 2. Download and install the English-based Panel (3X-UI)
# این نسخه به صورت پیش‌فرض انگلیسی است و هیچ زبان چینی ندارد
bash <(curl -Ls https://raw.githubusercontent.com/mhzard/v2ray-sanaei/master/install.sh)

# 3. Customizing the environment
# باز کردن پورت‌های لازم برای اینکه محیط پنل سریع لود شود
ufw allow 2053/tcp
ufw allow 443/tcp
ufw allow 80/tcp

echo -e "${BLUE}==========================================${NC}"
echo -e "${GREEN}   Mamadwhyt-UI is ready to use!         ${NC}"
echo -e "${CYAN}   Access: http://YOUR_IP:2053           ${NC}"
echo -e "${BLUE}==========================================${NC}"
