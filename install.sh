#!/bin/bash

# --- Core Settings ---
BRAND="MamadWhyt-UI"
ADMIN_USER="admin"
ADMIN_PASS="admin123"
PANEL_PORT="2053"

# --- Colors ---
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m'

clear
echo -e "${BLUE}==================================================${NC}"
echo -e "${CYAN}      DEPLOYING FULL $BRAND PANEL            ${NC}"
echo -e "${BLUE}==================================================${NC}"

# ۱. نصب پیش‌نیازها و ساخت ساختار پوشه‌ها
echo -e "${CYAN}[1/4] Preparing System...${NC}"
apt update && apt install curl tar wget sed -y
rm -rf /usr/local/x-ui
mkdir -p /usr/local/x-ui/bin
mkdir -p /usr/local/x-ui/web

# ۲. دانلود هسته اصلی (Xray-core)
echo -e "${CYAN}[2/4] Downloading Xray Core...${NC}"
# ما همیشه آخرین نسخه را مستقیم دانلود می‌کنیم
wget -N --no-check-certificate -O /usr/local/x-ui/bin/xray-linux-amd64.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-amd64.zip
unzip /usr/local/x-ui/bin/xray-linux-amd64.zip -d /usr/local/x-ui/bin/
rm /usr/local/x-ui/bin/xray-linux-amd64.zip -f

# ۳. دانلود و شخصی‌سازی فایل‌های وب (UI)
echo -e "${CYAN}[3/4] Personalizing Web Interface...${NC}"
# در این مرحله ما فایل‌های وب را از گیت‌هابت دانلود می‌کنیم
# (فرض بر این است که تو این فایل‌ها را در فازهای بعدی در گیت‌هابت می‌سازی)
wget -N --no-check-certificate -O /usr/local/x-ui/web/dist.tar.gz https://raw.githubusercontent.com/juliian321/mamadwhyt-ui/main/web/dist.tar.gz
tar zxvf /usr/local/x-ui/web/dist.tar.gz -d /usr/local/x-ui/web/
rm /usr/local/x-ui/web/dist.tar.gz -f

# ۴. شخصی‌سازی برند و تنظیمات ورود
echo -e "${CYAN}[4/4] Finalizing Branding...${NC}"
# این بخش تمام ردپاهای ثنایی را از فایل‌های دانلود شده پاک می‌کند
find /usr/local/x-ui/web -type f -exec sed -i "s/3x-ui/$BRAND/g" {} +
find /usr/local/x-ui/web -type f -exec sed -i "s/Sanaei/$BRAND/g" {} +

# تنظیم یوزر و پسورد
# (نیاز به فایل باینری x-ui دارد که در فاز بعدی می‌سازیم)
# ./x-ui setting -username $ADMIN_USER -password $ADMIN_PASS -port $PANEL_PORT

echo -e "${GREEN}==================================================${NC}"
echo -e "${GREEN}   $BRAND IS INSTALLED! (Web Files Only)$NC}"
echo -e "${BLUE}==================================================${NC}"
