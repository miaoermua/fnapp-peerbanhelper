#!/bin/bash

# Replace placeholders in current directory
sed -i "s#@IMAGE@#${IMAGE}#g" app/docker/docker-compose.yaml
sed -i "s#@PBH_VERSION@#${PBH_VERSION}#g" manifest

# Download and install fnpack
echo "Downloading fnpack..."
FNPACK_URL="https://static2.fnnas.com/fnpack/fnpack-1.2.1-linux-amd64"
FNPACK_TMP=$(mktemp)

curl -s -L -f -o "${FNPACK_TMP}" "${FNPACK_URL}"
if [ $? -ne 0 ] || [ ! -f "${FNPACK_TMP}" ]; then
    echo "错误: 下载 fnpack 失败"
    exit 1
fi

sudo mv "${FNPACK_TMP}" /usr/local/bin/fnpack
sudo chmod +x /usr/local/bin/fnpack

if ! command -v fnpack &> /dev/null; then
    echo "错误: fnpack 安装后无法执行"
    exit 1
fi

echo "fnpack 安装成功"

# Create package
echo "Building package..."
fnpack build

# Rename artifact
FPK_FILE=$(ls *.fpk | head -1)
if [ -z "$FPK_FILE" ]; then
    echo "错误: 未找到 .fpk 文件"
    exit 1
fi

NEW_NAME="peerbanhelper-${PBH_VERSION}.fpk"
mv "${FPK_FILE}" "${NEW_NAME}"
echo "构建产物已重命名为: ${NEW_NAME}"
