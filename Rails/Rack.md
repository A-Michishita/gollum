Gemfileに以下のコードを追記
```ruby
gem "rack-contrib", require: "rack/contrib"
```

インストール
```
bundle install
```

`config/application.rb`に以下のようにコードを追記
```ruby
module Sample
  class Application < Rails::Application

   config.middleware.use Rack::Access, {
      "/admins" => ["127.0.0.1", "自分の IP アドレス"],
      "/rails_admin" => ["127.0.0.1", "自分の IP アドレス"],
    }

  end
end
```
