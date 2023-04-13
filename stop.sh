#!/bin/bash
set -e
set +x
cd microservices

btc=$(pgrep sai-btc) && [ "$btc" != "" ] && kill -9 $btc && echo "BTC stopped" || echo "WARNING: BTC not running, or failed to stop"
bft=$(pgrep sai-bft) && [ "$bft" != "" ] && kill -9 $bft && echo "BFT stopped" || echo "WARNING: BFT not running, or failed to stop"
p2p=$(pgrep p2p_lin64) && [ "$p2p" != "" ] && kill -9 $p2p && echo "P2P stopped" || echo "WARNING: P2P not running, or failed to stop"
p2pr=$(pgrep sai-p2p) && [ "$p2pr" != "" ] && kill -9 $p2pr && echo "P2P proxy stopped" || echo "WARNING: P2P proxy not running, or failed to stop"
vm=$(pgrep sai-vm1) && [ "$vm" != "" ] && kill -9 $vm && echo "VM stopped" || echo "WARNING: VM not running, or failed to stop"

docker-compose -f docker-compose-windows.yml down
