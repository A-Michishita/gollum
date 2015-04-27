# macにPostgreSQLをインストールする

```shell
sudo brew install postgres
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
touch ~/.zprofile
echo 'export ARCHFLAGS="-arch x86_64"' >> ~/.zprofile
echo 'export PGDATA="/usr/local/var/postgres"' >> ~/.zprofile
source ~/.zprofile
```

`/usr/local/var/postgres/pg_hba.conf`
```
# "local" is for Unix domain socket connections only
local   all             all                                     trust
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
# IPv6 local connections:
host    all             all             ::1/128                 md5
```
```
launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

timezone変更  
`/usr/local/var/postgres/postgresql.conf`
```
log_timezone = 'UTC'
timezone = 'UTC'
lc_messages = 'ja_JP.UTF-8'
lc_monetary = 'ja_JP.UTF-8'
lc_numeric = 'ja_JP.UTF-8'
lc_time = 'en_US.UTF-8'
```

初期化
```
sudo rm -rf /usr/local/var/postgres
sudo mkdir /usr/local/var/postgres
sudo chmod 775 /usr/local/var/postgres
sudo chown <USERNAME> /usr/local/var/postgres
initdb /usr/local/var/postgres
```

データベースを作成する
```
postgres=# create role develop with password 'bestthanh';
CREATE ROLE
postgres=# alter role develop with createdb login;
ALTER ROLE
postgres=# create database ironna template template0 encoding 'unicode'
postgres-# ;
CREATE DATABASE
postgres=# alter database ironna owner to develop;
ALTER DATABASE
postgres=# grant all privileges on database ironna to develop;
GRANT
postgres=# \q
```

ダンプ・リストアする
```
pg_dump database_name > dump_file_name
psql database_name < dump_file_name
```