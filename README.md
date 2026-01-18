# fnapp-peerbanhelper

飞牛 fnpack 版本 PeerBanHelper，使用 docker 打包，支持飞牛 fnOS HTTP 嵌入默认使用 `9898` 端口开放 WebUI。

[![Stars](https://m3-markdown-badges.vercel.app/stars/3/3/miaoermua/fnapp-peerbanhelper)](https://github.com/miaoermua/fnapp-peerbanhelper)
[![Issues](https://m3-markdown-badges.vercel.app/issues/1/2/miaoermua/fnapp-peerbanhelper)](https://github.com/miaoermua/fnapp-peerbanhelper/issues)
[![Support](https://ziadoua.github.io/m3-Markdown-Badges/badges/Sponsor/sponsor1.svg)](https://www.miaoer.net/sponsor)
[![COPYING](https://ziadoua.github.io/m3-Markdown-Badges/badges/LicenceGPLv3/licencegplv33.svg)](https://github.com/miaoermua/fnapp-peerbanhelper/blob/main/LICENSE)



自动封禁不受欢迎、吸血和异常的 BT 客户端，并支持自定义规则。

PeerBanHelper 是一个开放源代码的个人网络防火墙安全软件。通过连接支持的应用程序（如：BitTorrent 客户端软件）的 Web API 接口获取受保护应用的连接信息，识别其中可能包含潜在安全威胁的连接并通知对应的应用程序主动断开其连接。



https://github.com/PBH-BTN/PeerBanHelper

文档: https://docs.pbh-btn.com/docs/category/

## 截图

![截图 2026-01-18 17-51-14](https://github.com/user-attachments/assets/2a4c78c7-c8dc-413b-829a-75e8a03f97c2)

## 说明

本仓库不设任何版本信息，版本信息由上游提供，此仓库使用 CI 自动化构建 fpk 文件（每天晚上 0 点拉取更新信息并覆盖）。

- `@PBH_VERSION@` 是上游版本去掉 v 得到的数字版本，适应 fnpack 的 manifest 的无 v 版本号
- `@IMAGE@` 是 ghostchu/peerbanhelper + 上版本标签得到的

分别用在 manifest 和 compose 文件里定义

如果你需要手动构建，
则 @PBH_VERSION@ 需要替换为 `vX.X.X` 例如 `v9.2.5`，@IMAGE@ 需要替换为 `ghostchu/peerbanhelper:vX.X.X` 例如 `ghostchu/peerbanhelper:v9.2.5`

如果是需要提交 fpk 到应用商店，只需要看 github-actions 创建 release 标签的时间，而不是看文件最后一次修改的时间。
