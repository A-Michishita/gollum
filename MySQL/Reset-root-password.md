ストップ
```
sudo service mysqld stop
```

セーフモードで起動
```
mysqld_safe --skip-grant-tables &
```

rootでログイン
```
sudo -u root mysql
```

パスワード再設定
```
use mysql;
update user set password=PASSWORD("ここにパスワードを記述") where User='root';
flush privileges;
```

退散
```
quit
```

セーフモード終了
```
sudo service mysqld stop
sudo service mysqld start
```
