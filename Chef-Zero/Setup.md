# Chef-Zero環境の構築
## 概要
* ローカルにChef-Zeroの環境を構築する。
* ローカルからリモートホストの環境を自動構築する環境を整える。
* Chefを使って自動でサーバー環境を構築する。
* Cher-Zeroを使ってリモートホストにも環境を自動構築する。

## ローカルホストの環境構築
### Chef-DKのインストール
[Chef Development Kit](https://downloads.chef.io/chef-dk/)から各環境にあったインストーラをダウンロードし、インストールする。  linuxの場合は下記コマンドの要領でインストール可能。
```
```

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
## リモートホストの環境構築
## 確認
## 参考サイト
* [Chef-Zeroを使ってみる。](http://qiita.com/shn/items/d2c0d0a8bc3299637073)
* [Knife-SoloからKnife-Zeroへの移行](http://www.creationline.com/lab/6401)
* [Knife-ZeroでInfrastructure as Codeを始めよう。](http://www.creationline.com/lab/6718)