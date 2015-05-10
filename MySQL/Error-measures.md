まずLogファイルを確認。   
特に設定していなければ`/var/log/mysqld.log`にあるはず   
```
sudo cat /var/log/mysqld.log
```

## Innodb
ログファイルに下記のようなメッセージが出ている場合の対処法です。
```
[ERROR] InnoDB: auto-extending data file ./ibdata1 is of a different size 640 pages (rounded down to MB) than specified in the .cnf file: initial 768 pages, max 0 (relevant if non-zero) pages!
```

このエラーメッセージが出ている場合は、`/var/lib/mysql`内にある`ib`で始まるデータを削除します。

```bash
> sudo ls /var/lib/mysql
ib_logfile0  ib_logfile1  ibdata1  mysql  wp_agileceos_db
```


[Back](Home)