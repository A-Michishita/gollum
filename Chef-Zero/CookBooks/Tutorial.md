# Chef-ZeroでNginxをインストールする。

## 概要

* Nginxをリモートホストに自動インストールする。
* 環境に合わせてconfigファイルを作成・配置する。

## クックブックの作成

`Berksfile`に`nginx`の項目を追加する。

```ruby
source "https://supermarket.getchef.com"
...
cookbook 'nginx', '>=1.6.0'
```

追加したら下記コマンドでクックブックを作成します。

```sh
berks vendor cookbooks
```
## レシピの適用

デフォルト設定のままインストールするのであれば、[チュートリアル](/Chef-Zero/Tutorial)に従ってレシピを適用します。  
ロールを用いて適用するコマンド例を下記に示します。

```sh
knife role run_list add ROLE_NAME nginx
knife node run_list add NODE_NAME "role[ROLE_NAME]"
```

## configファイルの設定

リモートホストに構築する環境に合わせてNginxのconfigファイルを作成する手順を説明します。

