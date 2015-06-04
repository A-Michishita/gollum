# Railsの基本的な使い方
## モデル
### モデルの生成
railsのモデルは以下の様な形式のコマンドで作成可能です。

```sh
rails generate model 名前 [カラム名:型] [オプション]
```

使用例
```sh
rails generate model font path:string
```

### モデルの削除
以下のコマンドでモデルを削除するマイグレーションスクリプトを作成可能です。

```sh
rails destroy model font
```

## 参考サイト
* [railsコマンド](http://railsdoc.com/rails)