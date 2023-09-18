# HPC_notification ![Pull Request](https://img.shields.io/badge/Pull%20Requests-Welcome-brightgreen)
HPCのタスクが終了したときに通知するLINE bot

・タスクが終わってるかどうか毎回確認する必要がなくなる。

・タスクをたくさん投げたときに、終わったタスクがあるかどうかわかる。

# 手順
## 1. LINE botを追加
下記のQRコードを読み込み追加する。

## 2. IDを取得
botに「登録」と送信すると、下記のようにIDが発行される。

## 3. batに以下のコードを追加
{id}の部分に2で取得したIDを入れる。以下のコマンドをbatファイルの最終行に記入。
```
curl "http://localhost:5050/notification?id={id}&job_id=%CCP_JOBID%&job_name=%CCP_JOBNAME%&computer_name=%COMPUTERNAME%"
```

# 技術スタック
server1だけだと、Webhookが受け取れない。

server2だけだと、プロキシを通すための設定がタスクに毎回必要になる。

そのため、二つのサーバーを経由している。
![Untitled](https://github.com/clcl777/HPC_notification/assets/77223796/941067b8-8a0f-4c24-8f77-e4209fcfca9f)


