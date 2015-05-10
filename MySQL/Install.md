リポジトリ追加-インストール
```
sudo yum install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
sudo yum install mysql-community-server
```

自動起動設定
```
sudo chkconfig mysqld on
sudo service mysqld start
```
