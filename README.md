# 223nTech

## このリポジトリについて

このリポジトリは、223n.techのドメイン管理やブログ管理とかをするためのリポジトリです。

## 必要な設定など

環境変数に下表の値を設定する必要があります。

| 変数名                    | 設定する値                             |
| ------------------------- | -------------------------------------- |
| TF_VAR_CLOUDFLARE_EMAIL   | Clougflareに登録しているメールアドレス |
| TF_VAR_CLOUDFLARE_TOKEN   | Global API Key                         |
| TF_VAR_CLOUDFLARE_ZONE_ID | 制御対象のゾーンID                     |

## License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/223n/223nTech/blob/master/LICENSE)
