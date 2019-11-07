#!/bin/bash

set -euo pipefail

NEXBIT_DIR=/root/.nexbit
NEXBIT_CONF=${NEXBIT_DIR}/nexbit.conf

# If config doesn't exist, initialize with sane defaults for running a
# non-mining node.

if [ ! -e "${NEXBIT_CONF}" ]; then
  tee -a >${NEXBIT_CONF} <<EOF



# server=1 tells NEXBIT-Qt and NEXBITd to accept JSON-RPC commands
server=1
daemon=1
# You must set rpcuser and rpcpassword to secure the JSON-RPC api
rpcuser=${NBC_RPCUSER:-nbc_rpc}
rpcpassword=${NBC_RPCPASSWORD:-changeme}

# How many seconds NEXBIT will wait for a complete RPC HTTP request.
# after the HTTP connection is established.
rpcclienttimeout=${NBC_RPCCLIENTTIMEOUT:-30}


# Can use multiple entries or can allow all.
rpcallowip=127.0.0.1



# Listen for RPC connections on this TCP port:
rpcport=${NBC_RPCPORT:-13519}

# Print to console (stdout) so that "docker logs -f nexbitd" prints useful
# information.
printtoconsole=${NBC_PRINTTOCONSOLE:-1}



# Enable an on-disk txn index. Allows use of getrawtransaction for txns not in
# mempool.

txindex=${NBC_TXINDEX:-1}

# Run on the test network instead of the real NEXBIT network.
testnet=0

# Set database cache size in MiB
dbcache=512
maxmempool=150
maxreceivebuffer=2500
maxsendbuffer=500

EOF
fi

if [ $# -eq 0 ]; then
  exec nexbitd -datadir=${NEXBIT_DIR} -conf=${NEXBIT_CONF}
else
  exec "$@"
fi
