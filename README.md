# test-mysql

## 1.リポジトリのクローン
以下のコマンドでリモートリポジトリをローカルにクローンする
```
git clone https://github.com/mtakahashi1011/test-mysql.git
```

## 2.イメージの作成
以下のコマンドでDockerfileからDockerイメージを作成する
```
docker image build -t (イメージ名):(タグ) (Dockerfileのあるディレクトリのパス)
```
Dockerイメージの作成時に以下のコマンドが実行されることに注意する
```
apt update
apt install -y vim
apt install -y git
```
また，環境変数を設定することでMySQLのユーザーやデータベースを作成したりパスワードを設定したりできる


## 3.コンテナの起動
以下のコマンドでDockerコンテナを起動する
```
docker container run --name (コンテナ名) -d -p 3306:3306 (イメージ名)
```


## 3.コンテナへの接続
以下のコマンドでDockerコマンドに接続する
```
docker container exec -it (コンテナ名) /bin/bash
```

