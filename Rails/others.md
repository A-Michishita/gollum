developmentの時だけ読み込みコードを書く
```ruby
if Rails.env == 'development'
  puts 'Rails.env is development'
end
```
短いバージョン
```ruby
puts "Rails.env is development" if Rails.env.development?
```