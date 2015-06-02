# Chef-Zero環境の構築

## 概要

* ローカルにChef-Zeroの環境を構築する。
* ローカルからリモートホストChef-Clientの環境を自動構築する。
* クックブックを作成・管理する
* 作成したクックブック内のレシピを適用しリモートホストに環境を構築する。
* ロールを用いて、サーバーの役割別にレシピを管理する。

## 環境構築
### ローカルホスト
#### Chef-DKのインストール

[Chef Development Kit](https://downloads.chef.io/chef-dk/)から各環境にあったインストーラをダウンロードし、インストールする。  

##### 確認

`chef verify`を実行し、全てsucceedであればOK。

#### knife-zeroのインストール

```sh
chef gem install knife-zero
mkdir .chef
echo 'local_mode true' > .chef/knife.rb
```
#### 作業用フォルダの作成
`chef generate repo`コマンドでchef-repoを作成し、以降の作業ディレクトリとします。このフォルダはgitで管理するようにしましょう。

```sh
chef generate repo chef-repo
```

### リモートホスト
#### 前提条件
* ローカルホストの公開鍵を対象となるリモートホストが持っている。
* リモートホストのログインユーザはパスワード無しで「sudo」コマンドを実行可能である。

#### Chef-clientのインストール

`knife zero bootstrap`コマンドで指定のホストに`Chef Client`をインストールします。コマンド例及び各オプションについては以下。

```sh
knife zero bootstrap node.example.jp -x ubuntu --sudo
```

* knife zero bootstrap : コマンド
* node.example.jp : ホスト名
* -x ubuntu : `-x`でリモートのログインユーザ名を指定。
* --sudo : sudoコマンドでroot権限を得ることを指定

#### 確認

`knife node list`コマンドで指定したホストが表示されていればOKです。

## 実践自動環境構築

### クックブックの作成
クックブックの作成・管理には`Berkshelf`を利用します。
`Berksfile`というファイルを以下の内容で作成してください。  
ここではTimezoneを変更するクックブック`timezone-ii`を作成しています。

```sh
source "https://supermarket.getchef.com"

cookbook 'timezone-ii', git: "https://github.com/L2G/timezone-ii.git"
```

下記コマンドでクックブックを取得します
```
berks vendor cookbooks
```

### レシピの適用

下記コマンドで指定のノードに指定のレシピを適用します。

```sh
knife node run_list add nodename timezone-ii
knife zero chef_client 'name:nodename' --attribute ipaddress
```

### ロールを用いてレシピを管理
まず下記コマンドでロールを作成します。

```sh
knife role create role_name
```

以下の様なファイルが`roles`フォルダ内に作成されているはずです。

```
cat roles/role_name.json

{
  "name": "role_name"
}
```

ロールを作成したら、下記コマンドで作成済みのレシピをロールに追加します。

```sh
knife role run_list add role_name timezone-ii
```

ファイルが以下のように変更されていれば無事追加されています。

```
cat roles/role_name.json
{
  "name": "role_name",
  "run_list": [
    "recipe[timezone-ii]"
  ]
}
```

run_listにロールを追加してknife zero chef_clientを実行します。これでリモートホストのタイムゾーンが自動で変更されれば成功です。

```
knife node run_list add node_name "role[role_name]"
knife zero chef_client 'name:node_name' -a ipaddress -x user_name --sudo
```

#### Please set EDITOR environment variable

上記エラーメッセージがでる場合は`.zshrc`(もしくは`.bachrc`)に下記コードを追記し、リロード。

```sh
export EDITOR="vim"
```

## 参考サイト
* [Chef-Zeroを使ってみる。](http://qiita.com/shn/items/d2c0d0a8bc3299637073)
* [Knife-SoloからKnife-Zeroへの移行](http://www.creationline.com/lab/6401)
* [Knife-ZeroでInfrastructure as Codeを始めよう。](http://www.creationline.com/lab/6718)
* [Knife-ZeroをマスターしてChef Soloの引退に備えよう！](http://knowledge.sakura.ad.jp/tech/2708/)
* [Knife-ZeroをマスターしてChef Soloの引退に備えよう！](http://knowledge.sakura.ad.jp/tech/2708/)
* [knifeで操作してみる](http://openbook4.me/projects/77/sections/446)
* [Please set EDITOR environment variableの対処法](http://nitamago-monster.hatenablog.com/entry/2014/12/25/125334)
