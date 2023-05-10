# start.sh

#!/bin/bash

# set variables
export K3S_NODE_NAME=k3s-server
export K3S_URL=https://localhost:6443
export K3S_TOKEN=my-secret-token

# start k3s server
sudo /usr/local/bin/k3s server --config=config.yaml &
sleep 5

# start k3s agent
sudo /usr/local/bin/k3s agent --config=config.yaml

