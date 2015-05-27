# Chefのインストール手順
## インストール
下記ページ、下記コマンドでchef development kitをダウンロードしてrpmインストール。
[Chef Development Kit | Chef Downloads | Chef](https://downloads.chef.io/chef-dk/redhat/#/)
```
# cd /usr/local/src
# wget https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.3.5-1.x86_64.rpm
# rpm -ivh chefdk-0.3.5-1.x86_64.rpm
```

## 確認
```
# chef verify
```