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
また，環境変数を設定することでMySQLのユーザーやデータベースを作成したり，パスワードを設定したりできる
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
|MYSQL_DATABASE| 起動時に作成されるDBの名前|
|MYSQL_USER| 起動時に作成される新しいユーザー<br>ここで作成したユーザには[MYSQL_DATABASE] で指定したDBへの**GRANT ALL** 権限が付与される|
|MYSQL_PASSWORD|上記の[MYSQL_USER] で作成されるユーザーのパスワード<br>ユーザーを作成する場合にはこれが必須|

更に，以下のようにMySQLの設定ファイル`my.cnf'をコピーすることでデフォルトの認証方式を設定できる
```
COPY ./db/conf.d/my.cnf /etc/mysql/my.cnf
```

## 3.コンテナの起動
以下のコマンドでDockerコンテナを起動する
```
docker container run --name (コンテナ名) -d -p 3306:3306 (イメージ名)
```
コンテナの初回起動時に上の環境変数で指定されたユーザーとデータベースが作成される

また，`/docker-entrypoint-initdb.d`ディレクトリ配下にある拡張子`.sh`と`.sql`のファイルがアルファベット順に実行される

これによりコンテナの起動時にテーブルの作成や権限の付与などを行うことができる

## 4.コンテナへの接続
以下のコマンドでDockerコマンドに接続する
```
docker container exec -it (コンテナ名) /bin/bash
```

## 5.データベースの設計
- users
  
|Field|Type|Null|Key|Default|Extra|
|---|---|---|---|---|---|
|id|int unsigned|NO|PRI|Null|auto_increment|
|name|varchar(255)|YES|UNI|Null||
|password|varchar(255)|YES||Null||

- tasks

|Field|Type|Null|Key|Default|Extra|
|---|---|---|---|---|---|
|id|int unsigned|NO|PRI|Null|auto_increment|
|user_id|int|NO||Null||
|content|varchar(255)|NO||Null||

## 6.sqlファイルの記述の仕方
`.sql`ファイルの記述をする際にはクォーテーションの使い方に注意する

MySQLではシングルとダブルは文字列定数，バックは識別引用符として扱われる

識別子とはテーブル名やカラム名などデータベース中のオブジェクトを表す文字列である

MySQLの予約語を識別子として使うための引用符が識別引用符である

そのため`password`などの文字列をテーブル名やカラム名に使う場合にはバッククォートを使う必要がある

したがって，`.sql`ファイルを記述する際にはデータベース名，テーブル名とカラム名はバッククォートをその他の文字列にはシングルクォートを使うようにする

## 7.初回起動時のインポート
`.sql`ファイルに以下のコマンドを記述することで`.csv`ファイルのインポートをDockerコンテナの初回起動時に行うことができる
```
LOAD DATA LOCAL INFILE (csvファイルのパス) INTO TABLE `tasks` FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;
```
ただし，デフォルトでは`.csv`ファイルのインポートは禁止されているのでサーバー側とクライアント側で明示的に許可する必要がある

そのために設定ファイル`my.cnf`に以下のように追記する必要がある
```
[mysql]
local-infile=1 

[mysqld]
local-infile=1
```

## 8.参考URL
ToDoAppについて
- https://zenn.dev/wkb/books/node-tutorial
  
Dockerfileの記述の仕方について
- https://qiita.com/taqm/items/8b6b896ec4a9a0b84886
- https://hub.docker.com/_/mysql/

`.sql`ファイルの記述の仕方について
- https://qiita.com/Ping/items/d5d8468dadd9c1287f5e

初回起動時の`.csv`ファイルのインポートについて
- https://zenn.dev/thefirstpenguin/articles/117321e71a3625
- https://rooter.jp/infra-ops/load-data-infile/
