# hotaru-api

hotaruのGoのAPI（いまは`/healthz`だけ）

## CI/CD

- PRでは、テストと、イメージのビルド・脆弱性スキャンをする
- mainにマージされたら、イメージをECRにpushする
- そのあと、イメージのtagを書き換えるPRをhotaru-deployに自動で出す

## 使用技術

- Go：標準ライブラリだけで書いたHTTPサーバー
- Docker：distrolessのイメージで、rootでは動かさない
- Trivy：イメージの脆弱性スキャン
- GitHub Actions：AWSへはOIDCで入り、hotaru-deployへはGitHub Appのトークンで書く
