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

```
berks vendor cookbooks
```
