# Chef-Zero環境の構築

## 概要

* ローカルにChef-Zeroの環境を構築する。
* ローカルからリモートホストChef-Clientの環境を自動構築する。

## ローカルホストの環境構築

### Chef-DKのインストール

[Chef Development Kit](https://downloads.chef.io/chef-dk/)から各環境にあったインストーラをダウンロードし、インストールする。  linuxの場合は下記コマンドの要領でインストール可能。


zshを利用している場合は、下記コードを`.zshrc`などに追記することで、chefを使うときはChefDK内のruby環境を使うよう設定できる。(bashでも流用可？)

```sh
eval "$(chef shell-init zsh)"
```

#### 確認

`chef verify`を実行し、全てsucceedであればOK。

### knife-zeroのインストール

```sh
chef gem install knife-zero
mkdir .chef
echo 'local_mode true' > .chef/knife.rb
```
### 作業用フォルダの作成
`chef generate repo`コマンドでchef-repoを作成し、以降の作業ディレクトリとします。このフォルダはgitで管理するようにしましょう。

```sh
chef generate repo chef-repo
```

## リモートホストの環境構築
### 前提条件
* ローカルホストの公開鍵を対象となるリモートホストが持っている。
* リモートホストのログインユーザはパスワード無しで「sudo」コマンドを実行可能である。

### Chef-clientのインストール

`knife zero bootstrap`コマンドで指定のホストに`Chef Client`をインストールします。コマンド例及び各オプションについては以下。

```sh
knife zero bootstrap node.example.jp -x ubuntu --sudo
```

* knife zero bootstrap : コマンド
* node.example.jp : ホスト名
* -x ubuntu : `-x`でリモートのログインユーザ名を指定。
* --sudo : sudoコマンドでroot権限を得ることを指定

## 確認

`knife node list`コマンドで指定したホストが表示されていればOKです。

## 参考サイト

* [Chef-Zeroを使ってみる。](http://qiita.com/shn/items/d2c0d0a8bc3299637073)
* [Knife-SoloからKnife-Zeroへの移行](http://www.creationline.com/lab/6401)
* [Knife-ZeroでInfrastructure as Codeを始めよう。](http://www.creationline.com/lab/6718)
* [Knife-ZeroをマスターしてChef Soloの引退に備えよう！](http://knowledge.sakura.ad.jp/tech/2708/)