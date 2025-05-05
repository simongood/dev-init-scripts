# ubuntu 終端機初始化開發環境

快速建立 Python 開發環境，適用於 **Ubuntu 22.04**（或其他版本）及 **WSL Windows 子系統 for Linux**。

---

## 🚀 腳本內容
- 安裝 pyenv（含 Python 3.11.9 與 3.12.3）
- 安裝 poetry + export plugin
- 基礎開發工具：make, curl, git, build-essential 等

---

## 🔗 腳本檔案
[ubuntu-init-dev.sh 環境配置](https://github.com/simongood/dev-init-scripts/blob/master/ubuntu-init-dev.sh)

---

## 🛠️ 執行方式

- 建議先到 powershell 管理員身分執行重置 WSL 環境：
```bash
wsl --unregister Ubuntu-22.04 
```
- 安裝執行檔 : 
```bash
curl -sSL https://raw.githubusercontent.com/simongood/dev-init-scripts/master/ubuntu-init-dev.sh | sed 's/apt /sudo apt /' | bash
```
