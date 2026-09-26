#!/bin/bash
# 网心云容器魔方 fpk 打包脚本
set -e
cd "$(dirname "$0")"

NAME="wxedge"
VERSION="1.0.5"

# 保证生命周期脚本可执行
chmod +x cmd/*

# 打包（fnpack 会在项目目录下生成 <appname>.fpk）
fnpack build -d .

# 重命名为带版本号的包
if [ -f "${NAME}.fpk" ]; then
  mv -f "${NAME}.fpk" "${NAME}-${VERSION}.fpk"
  echo "打包完成: ${NAME}-${VERSION}.fpk"
else
  echo "fnpack 未生成 ${NAME}.fpk，请检查 fnpack 是否可用"
  exit 1
fi
