## タスク
開発中に何度も実行するコマンドや操作をRakeタスクにしておくことで開発をスムーズに進められるようになります。

### 作成方法
下記コマンドでタスクが作成できます。
```sh
rails g task task_name
```
実行後、`lib/tasks/task_name.rake`というファイルが作成されているはずです。

ここでは、作成されたファイルに以下のコードを実装します。
`desc`に説明文を記述することで、コマンドでこのタスクの概要を確認できます。
```ruby
namespace :task_name do 
  desc "サンプルデータを作成する"
  task hello: :environment do
    puts "Hello"
  end
end
```
### 実行方法
以下のコマンドで実行可能です。実行後、コンソール画面に`Hello`と表示されれば無事成功です。
```
rake task_name:hello
```

## 参考サイト
+ [RailsでRakeタスクの作成](http://ruby-rails.hatenadiary.com/entry/20141117/1416225563)