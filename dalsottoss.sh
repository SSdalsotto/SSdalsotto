#!/bin/bash
# ==========================================================
#  DalsottoSS – Android Anti-Cheat Scanner
#  Credits: Kiwi
# ==========================================================

# Cores
G='\033[1;32m'; R='\033[1;31m'; Y='\033[1;33m'; B='\033[1;34m'; N='\033[0m'
OK="${G}[LIMPO]${N}"
FAIL="${R}[SUSPEITO]${N}"
WARN="${Y}[ALERTA]${N}"

clear
echo -e "${B}"
echo "╔═══════════════════════════════════════╗"
echo "║         🔎 DalsottoSS Scanner         ║"
echo "║             Credits: Kiwi             ║"
echo "╚═══════════════════════════════════════╝"
echo -e "${N}"
sleep 1

# Loading fake animation
for i in 1 2 3; do
  echo -ne "⏳ Iniciando scan$(printf '.%.0s' $(seq 1 $i))\r"
  sleep 1
done
echo -e "\n"

# ===== ROOT / MAGISK =====
echo -ne "➡ Verificando Root/Magisk... "; sleep 1
if command -v su >/dev/null 2>&1 || [ -f "/sbin/magisk" ]; then
    echo -e "$FAIL"
else
    echo -e "$OK"
fi

# ===== VPN =====
echo -ne "➡ Verificando VPN... "; sleep 1
if ip route | grep -q "tun0" || ifconfig 2>/dev/null | grep -q "tun0"; then
    echo -e "$FAIL"
else
    echo -e "$OK"
fi

# ===== FREE FIRE ORIGIN =====
echo -ne "➡ Verificando origem do Free Fire... "; sleep 1
if pm list packages -i com.dts.freefireth 2>/dev/null | grep -q "com.android.vending"; then
    echo -e "$OK"
else
    echo -e "$FAIL"
fi

# ===== APPS DESINSTALADOS =====
echo -ne "➡ Verificando apps desinstalados... "; sleep 1
if dumpsys package | grep -qi "stopped=true"; then
    echo -e "$WARN"
else
    echo -e "$OK"
fi

# ===== MP4 =====
echo -ne "➡ Procurando arquivos MP4 recentes... "; sleep 1
if find /sdcard -maxdepth 2 -type f -mmin -60 -name "*.mp4" | grep -q .; then
    echo -e "$WARN"
else
    echo -e "$OK"
fi

# ===== USB =====
echo -ne "➡ Verificando cabo USB... "; sleep 1
if dumpsys usb | grep -q "state=CONFIGURED"; then
    echo -e "$FAIL"
else
    echo -e "$OK"
fi

# ===== LIBS =====
echo -ne "➡ Checando libs suspeitas... "; sleep 1
if ls /data/app/*/lib/ 2>/dev/null | grep -qi "lib"; then
    echo -e "$WARN"
else
    echo -e "$OK"
fi

# Final
echo -e "\n${B}═══════════════════════════════════════${N}"
echo -e "   ✔️ Scan Finalizado - DalsottoSS"
echo -e "${B}═══════════════════════════════════════${N}\n"
