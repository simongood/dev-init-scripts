#!/bin/bash
# Ubuntu 22.04 開發環境初始化腳本
# 建議先執行：wsl --unregister Ubuntu-22.04 重置 WSL 環境
# 使用方式：
#   curl -sSL https://raw.githubusercontent.com/simongood/dev-init-scripts/master/ubuntu-init-dev.sh | sed 's/apt /sudo apt /' | bash

#-------------------
# ✅ 安裝開發工具
# - pyenv：管理多版本 Python（3.11.9、3.12.3）
# - pip：升級 pip 並安裝 poetry、uvicorn
# - poetry：Python 套件與虛擬環境管理器，含 export plugin
# - 基本工具：make, curl, git, build-essential 等

#-------------------
# ⚙️ 特殊設定
# - set -e：出錯即中止腳本
# - 寫入 ~/.bashrc：自動套用 pyenv 環境
# - 即時生效 pyenv：不需重開終端機
# - 使用 pyenv 的 pip 安裝 poetry，確保版本一致

#-------------------
set -e

echo "🔧 開始安裝開發工具..."

sudo apt update && \
sudo apt install -y make curl git build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget llvm libncursesw5-dev \
    xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# -----------------------------------
# 安裝 pyenv
curl https://pyenv.run | bash

# 寫入 .bashrc 讓未來 shell 自動套用
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc            # 設定 pyenv 的根目錄變數
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc         # 把 pyenv 的執行檔加入 PATH（可使用 pyenv 指令）
echo 'export PATH="$PYENV_ROOT/shims:$PATH"' >> ~/.bashrc       # 把 pyenv shim 加入 PATH（確保 python/poetry 等 shim 指令可用）
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc                 # 初始化 pyenv 的 PATH 邏輯（適用 login shell）
echo 'eval "$(pyenv init -)"' >> ~/.bashrc                      # 初始化 pyenv 的功能（如切換版本、shim 邏輯）

# 立即生效 pyenv（不等重開 terminal）
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# 安裝 Python 並設為全域版本
pyenv install 3.11.9
pyenv install 3.12.3
pyenv global 3.12.3

# 確保使用的是 pyenv 的 pip
hash -r
pip install --upgrade pip

# ---------------------------------
# 安裝 poetry 與 plugins（作用在 pyenv 的 Python 上）
pip install poetry uvicorn[standard]
poetry self add poetry-plugin-export
poetry config virtualenvs.in-project true

# ----------------------------------
echo -e "\n✅ 開發工具初始化完成"
echo "✅ apt: make, curl, 其他開發依賴"
echo "✅ pyenv python : 3.11.9, 3.12.3（已設為全域）"
echo "✅ pip: poetry, uvicorn"
echo "✅ poetry plugin 安裝完成"
echo "💡 請重新開啟終端機或執行：source ~/.bashrc，以確保 poetry 指令可用"
