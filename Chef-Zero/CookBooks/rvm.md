# Chef-Zeroでrvmをインストールする。

## 概要

* chef-zeroでrvm及びrubyやgemをインストール。
* ユーザー別にインストール環境を設定する。

## クックブックの作成

`Berksfile`に下記コードを追記する。

```ruby
cookbook 'rvm'
```

追記したら下記コマンドでクックブックをダウンロード。

```sh
berk vendor cookbooks
```

### レシピの修正
このまま利用するとgemインストール時にエラーが発生するため、`libraries/rvm_rubygems_package.rb`を以下のように修正。

before
```ruby
# ensure each ruby is installed and gemset exists
ruby_strings.each do |rubie|
  next if rubie == 'system'
    e = rvm_environment rubie do
    user    gem_env.user if gem_env.user
    action :nothing
  end
  e.run_action(:create)
end
```

```ruby
# ensure each ruby is installed and gemset exists
ruby_strings.each do |rubie|
  next if rubie == 'system'
  e = ::Chef::Resource::RvmEnvironment.new(rubie, @run_context)
  e.user(gem_env.user) if gem_env.user
  e.action(:nothing)
  e.run_action(:create)
end
```

## レシピの適用

ノード、ロールを設定に設定を追記します。以下は設定例。

`nodes/node_name.json`
```json
{
  "name": "ROLE_NAME",
  "description": "",
  "json_class": "Chef::Role",
  "default_attributes": {
    "rvm": {
      "user_installs": [
        {
          "user": "USER",
          "home": "/home/USER"
        }
      ]
    }
  },
  "override_attributes": {

  },
  "chef_type": "role",
  "run_list": [
    "recipe[rvm::user]"
  ],
  "env_run_lists": {

  }
}
```

## 参考サイト
* [Chef-Solo + Berkshelf で Rails 4 の開発環境を構築](http://qiita.com/Salinger/items/267f7ac4720f44eb6bfe)
* [Chef SoloでUbuntu Server12.04にRVMでRubyをインストール](http://blog.scimpr.com/2014/02/01/chef-solo%E3%81%A7ubuntu-server12-04%E3%81%ABrvm%E3%81%A7ruby%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB/)
* [Use full class name for rvm_environment resource usage inside Chef::Provider::Package:RVMRubygems class](https://github.com/martinisoft/chef-rvm/pull/284/files)