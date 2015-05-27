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

run_listにロールを追加してknife zero chef_clientを実行します。

## 参考サイト
* [Knife-ZeroをマスターしてChef Soloの引退に備えよう！](http://knowledge.sakura.ad.jp/tech/2708/)
* [knifeで操作してみる](http://openbook4.me/projects/77/sections/446)
* [Please set EDITOR environment variableの対処法](http://nitamago-monster.hatenablog.com/entry/2014/12/25/125334)