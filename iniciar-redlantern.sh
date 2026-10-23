#!/usr/bin/env bash

set -e

cd /workspaces/cobblemon

echo "======================================"
echo "       REDLANTERN COBBLEMON"
echo "======================================"

# Inicia o painel Crafty se ainda não estiver rodando
if pgrep -af '[r]un_crafty.sh' >/dev/null; then
    echo "Crafty parece já estar iniciado."
else
    echo "Iniciando Crafty Controller..."
    nohup bash /workspaces/cobblemon/Minecraft/run_crafty.sh \
      > /tmp/redlantern-crafty.log 2>&1 &
fi

sleep 3

echo
echo "Crafty: confira o painel e inicie o servidor Minecraft."
echo "Iniciando o túnel OpenPort na porta 25565..."
echo "Mantenha este terminal aberto."
echo

openport 25565
