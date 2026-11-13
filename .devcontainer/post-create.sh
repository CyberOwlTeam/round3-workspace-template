#!/usr/bin/env bash
# Installs the tools the devcontainer features don't cover, then warms each starter
# so the candidate's hour goes on the exercise, not on downloads.
set -euo pipefail

KIND_VERSION="v0.24.0"
ACTIONLINT_VERSION="1.7.3"
ACT_VERSION="0.2.92"
ARCH="$(dpkg --print-architecture)"   # amd64 | arm64

bin=/usr/local/bin
echo "== kind ${KIND_VERSION}"
sudo curl -fsSLo "$bin/kind" "https://kind.sigs.k8s.io/dl/${KIND_VERSION}/kind-linux-${ARCH}"
sudo chmod +x "$bin/kind"

echo "== actionlint ${ACTIONLINT_VERSION}"
curl -fsSL "https://github.com/rhysd/actionlint/releases/download/v${ACTIONLINT_VERSION}/actionlint_${ACTIONLINT_VERSION}_linux_${ARCH}.tar.gz" \
  | sudo tar -xz -C "$bin" actionlint

echo "== act ${ACT_VERSION}"
act_arch="x86_64"; [ "$ARCH" = "arm64" ] && act_arch="arm64"
curl -fsSL "https://github.com/nektos/act/releases/download/v${ACT_VERSION}/act_Linux_${act_arch}.tar.gz" \
  | sudo tar -xz -C "$bin" act
mkdir -p ~/.config/act && echo "-P ubuntu-latest=catthehacker/ubuntu:act-latest" > ~/.config/act/actrc

echo "== warm option A (python test deps for the stub service)"
python3 -m pip install --quiet --user pytest pyyaml

echo "== warm option C (go, python, ts)"
( cd option-c-namespace-provisioner/go && go mod tidy && go build -o /dev/null . )  # compile check only; leaves no binary in the repo
python3 -m pip install --quiet --user -r option-c-namespace-provisioner/python/requirements.txt
( cd option-c-namespace-provisioner/ts && npm install --no-audit --no-fund --silent )

echo "== done. Run: bash env-check.sh"
