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
```
ENV MYSQL_ROOT_PASSWORD password
ENV MYSQL_DATABASE todo_app
ENV MYSQL_USER todoapp
ENV MYSQL_PASSWORD password
```
これらの環境変数は以下のように用いられる

|変数名|説明|
|---|---|
|MYSQL_ROOT_PASSWORD| この変数の設定は**必須**です!名前の通りROOTユーザのパスワードになります。 |
|MYSQL_DATABASE| 起動時に作成されるDBの名前です。|
|MYSQL_USER| 起動時に新しいユーザを作成します。ここで作成したユーザには[MYSQL_DATABASE] で指定したDBへの**GRANT ALL** 権限が付与されます。|
|MYSQL_PASSWORD|上記の[MYSQL_USER] で作成したユーザのパスワードです。<br>ユーザを作成する場合にはこちらが必須になります。|
|MYSQL_ALLOW_EMPTY_PASSWORD|[MYSQL_ROOT_PASSWORD] に空を設定できる用にするフラグです。<br>`"yes"`を設定することで空を設定することが可能になります。ただし、よくわからないならおすすめしない設定です。|
|MYSQL_RANDOM_ROOT_PASSWORD|`"yes"`を設定することでランダムなパスワードが発行されます。<br>起動時の標準出力へ`GENERATED ROOT PASSWORD:  xxxxxxx`と出力されますが、正直ローカル開発用ならこのオプションを使うことはないと思います。|
|MYSQL_ONETIME_PASSWORD|rootユーザのパスワード一度で期限切れにしてくれるらしいです。試してみたのですが、何故かうまく行かなかったので動作確認はできていません・・・ |

更に，以下のようにMySQLの設定ファイル`my.cnf'をコピーすることでデフォルトの認証方式を設定できる
```
COPY
```

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

## 5.参考URL
- https://qiita.com/taqm/items/8b6b896ec4a9a0b84886
