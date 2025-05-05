#!/bin/bash
# ubuntu 環境初始化
#　執行　: `curl -sSL https://raw.githubusercontent.com/simongood/dev-init-scripts/master/init-dev.sh | sed 's/apt /sudo apt /' | bash`

set -e

echo "🔧 開始安裝開發工具..."

apt update && \
apt install -y make curl && \

# -----------------------------------
# 安裝 pyenv
curl https://pyenv.run | bash
      
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc      # 設定 pyenv 環境變數
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

pyenv install 3.11.9                    # 安裝 Python 並設為全域版本
pyenv install 3.12.3
pyenv global 3.12.3

# ---------------------------------
# 安裝 poetry 
pip install poetry uvicorn[standard] && \
poetry self add poetry-plugin-export && \
poetry self add poetry-plugin-export

# ----------------------------------
echo -e "\n✅ 開發工具初始化完成"
echo "✅ apt: make, curl"
echo "✅ pyenv python : 3.11.9 3.12.3"
echo "✅ pip: poetry, uvicorn"
echo "✅ poetry plugin 安裝完成"
