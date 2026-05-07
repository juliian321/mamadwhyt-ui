#!/bin/bash

# ——————————————————————————————————————————————————————————————————————————————————————
# Colors for Terminal UI
# ——————————————————————————————————————————————————————————————————————————————————————
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear
echo -e "${BLUE}==================================================${NC}"
echo -e "${CYAN}      Welcome to MAMADWHYT-UI Installation        ${NC}"
echo -e "${CYAN}      Fully Customized & Premium Edition          ${NC}"
echo -e "${BLUE}==================================================${NC}"

# ۱. آپدیت مخازن و نصب پیش‌نیازها
echo -e "${YELLOW}[1/4] Preparing System...${NC}"
apt update && apt install curl socat sed git -y

# ۲. نصب سورس اصلی پنل انگلیسی (Sanaei 3X-UI)
echo -e "${YELLOW}[2/4] Fetching Core Files...${NC}"
bash <(curl -Ls https://raw.githubusercontent.com/mhzard/v2ray-sanaei/master/install.sh)

# ۳. عملیات شخصی‌سازی عمیق (White-Labeling)
echo -e "${YELLOW}[3/4] Customizing Branding & UI...${NC}"

# متغیر نام برند تو
BRAND="MamadWhyt-UI"

# تغییر نام سرویس و فایل‌های اجرایی
find /usr/local/x-ui/bin -type f -exec sed -i "s/3x-ui/$BRAND/g" {} +
find /usr/local/x-ui/bin -type f -exec sed -i "s/3X-UI/$BRAND/g" {} +

# تغییر لوگوی متنی در صفحه لاگین و هدر (سمت راست بالا)
# ما تمام تگ‌های مربوط به لوگوی 3X-UI را با نام تو جایگزین می‌کنیم
find /usr/local/x-ui/bin -type f -exec sed -i "s/3x-ui/$BRAND/g" {} +
find /usr/local/x-ui/bin -type f -exec sed -i "s/Sanaei/$BRAND/g" {} +

# تغییر عنوان تب مرورگر (Browser Title)
sed -i "s/<title>.*<\/title>/<title>$BRAND | Login<\/title>/g" /usr/local/x-ui/bin/x-ui

# ۴. تنظیمات فایروال و امنیت
echo -e "${YELLOW}[4/4] Finalizing Security Settings...${NC}"
ufw disable
ufw allow 2053/tcp
ufw allow 443/tcp
ufw allow 80/tcp

# ری‌استارت برای اعمال تغییرات ظاهری
x-ui restart

echo -e "${GREEN}==================================================${NC}"
echo -e "${CYAN}   $BRAND INSTALLED SUCCESSFULLY!               ${NC}"
echo -e "${BLUE}   ----------------------------------------------${NC}"
echo -e "${YELLOW}   Panel Port:   2053                           ${NC}"
echo -e "${YELLOW}   Login URL:    http://$(curl -s ipv4.icanhazip.com):2053 ${NC}"
echo -e "${BLUE}==================================================${NC}"
echo -e "${GREEN}   Everything is set. Log in and enjoy!          ${NC}"
