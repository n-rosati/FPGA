#!/usr/bin/env zsh

set -e

# # Get latest oss-cad-suite
# NAMES=$(curl -s https://api.github.com/repos/YosysHQ/oss-cad-suite-build/releases/latest | grep "oss-cad-suite-linux-x64*" | cut -d : -f 2,3 | tr -d \" | tr -d '\n')

# IFS=', ' read -r -A NAMES_SPLIT <<< "$NAMES"

# curl -L -o /tmp/${NAMES_SPLIT[1]} ${NAMES_SPLIT[2]}

# sudo mkdir -p /usr/local/bin/oss-cad-suite
# sudo tar -xzvf /tmp/${NAMES_SPLIT[1]} -C /usr/local/bin/

# echo 'export PATH="/usr/local/bin/oss-cad-suite/bin:$PATH"' >> ~/.zshrc