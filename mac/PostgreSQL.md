# macにPostgreSQLをインストールする

```shell
sudo brew install postgres
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
touch ~/.zprofile
echo 'export ARCHFLAGS="-arch x86_64"' >> ~/.zprofile
echo 'export PGDATA="/usr/local/var/postgres"' >> ~/.zprofile
source ~/.zprofile
```
