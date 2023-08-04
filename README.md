# test-mysql

## コンテナの起動
以下のコマンドでDockerコンテナを起動する
```
docker container run --name (コンテナ名) -d -p 3306:3306 (イメージ名)
```

## コンテナへの接続
以下のコマンドでDockerコマンドに接続する
```
docker container exec -it (コンテナ名) /bin/bash
```

