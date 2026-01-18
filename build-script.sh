#!/bin/bash

# Replace placeholders in current directory
sed -i "s#@IMAGE@#${IMAGE}#g" app/docker/docker-compose.yaml
sed -i "s#@PBH_VERSION@#${PBH_VERSION}#g" manifest

# Download and install fnpack
echo "Downloading fnpack..."
curl -s -L -o /usr/local/bin/fnpack https://static2.fnnas.com/fnpack/fnpack-1.2.0-linux-amd64
chmod +x /usr/local/bin/fnpack

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