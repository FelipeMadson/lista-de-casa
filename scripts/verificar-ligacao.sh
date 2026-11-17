#!/usr/bin/env bash
# Abre o app no emulador, captura a tela inicial e confere se a ligação
# profunda compras://app/item/novo leva ao formulário de novo item.
# Uso: bash scripts/verificar-ligacao.sh caminho/do/app.apk
set -uo pipefail

PACOTE="br.com.felipemadison.compras"

adb install -r "$1"
adb shell am start -W -n "$PACOTE/.MainActivity"
sleep 15
adb exec-out screencap -p > lista-de-casa.png

adb shell am start -W -a android.intent.action.VIEW -d "compras://app/item/novo" "$PACOTE"
for _ in $(seq 1 10); do
  sleep 3
  adb shell uiautomator dump /sdcard/tela.xml > /dev/null 2>&1
  adb pull /sdcard/tela.xml tela.xml > /dev/null 2>&1
  if grep -qF "Adicionar à lista" tela.xml; then
    adb exec-out screencap -p > ligacao-profunda.png
    echo "ok: a ligação profunda abriu o formulário"
    exit 0
  fi
done

adb exec-out screencap -p > ligacao-profunda.png
textos=$(grep -oE '(text|content-desc)="[^"]+"' tela.xml 2>/dev/null | sort -u | paste -sd ' ')
echo "::error::A ligação profunda não abriu o formulário. Na tela: ${textos:-nada legível}"
exit 1
