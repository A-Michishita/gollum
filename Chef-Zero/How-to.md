# Chef-Zeroでの自動環境構築手順

## 目的

* クックブックを作成・管理する
* 作成したクックブック内のレシピを適用しリモートホストに環境を構築する。
* ロールを用いて、サーバーの役割別にレシピを管理する。

## クックブックの作成
クックブックの作成・管理には`Berkshelf`を利用します。
`Berksfile`というファイルを以下の内容で作成してください。  
ここではTimezoneを変更するクックブック`timezone-ii`を作成しています。

```sh
source "https://supermarket.getchef.com"

cookbook 'timezone-ii', git: "https://github.com/L2G/timezone-ii.git"
```

## レシピの適用

下記コマンドで指定のノードに指定のレシピを適用します。

```sh
knife node run_list add nodename timezone-ii
knife zero chef_client 'name:nodename' --attribute ipaddress
```

## ロールを用いてレシピを管理

## 参考サイト
* [Knife-ZeroをマスターしてChef Soloの引退に備えよう！](http://knowledge.sakura.ad.jp/tech/2708/)
* [knifeで操作してみる](http://openbook4.me/projects/77/sections/446)
* [Please set EDITOR environment variableの対処法](http://nitamago-monster.hatenablog.com/entry/2014/12/25/125334)