#!/bin/bash
# ubuntu 環境初始化

set -e

echo "🔧 開始安裝開發工具..."

apt update && \
apt install -y make curl && \
pip install poetry uvicorn[standard] && \
poetry self add poetry-plugin-export && \
poetry self add poetry-plugin-export && \

echo -e "\n✅ 開發工具初始化完成"
echo "✅ apt: make, curl"
echo "✅ pip: poetry, uvicorn"
echo "✅ poetry plugin 安裝完成"
