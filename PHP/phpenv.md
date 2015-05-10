# PHP複数バージョン管理
phpenvとphp-buildを利用したphpの複数バージョン管理を説明
## インストール
### パッケージのインストール
まずは下記コマンドでEPELレポジトリを追加します。

```bash
rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
```
その後、必要なパッケージをインストールします。  
このインストールによって以下のパッケージもインストールされます。  

* apxa:apache拡張ツール
* re2c:高速で柔軟性のある字句解析器を書くためのツール

```bash
yum -y --enablerepo=epel install git libxml2-devel bison bison-devel openssl-devel curl-devel libjpeg-devel libpng-devel libmcrypt-devel readline-devel libtidy-devel libxslt-devel libmcrypt libmcrypt-devel re2c httpd httpd-devel libtidy
```

### phpenvのインストール
Githubからダウンロードし、インストールスクリプトを実行します。

```bash
#ユーザーディレクトリに移動
cd	
git clone https://github.com/CHH/phpenv.git
cd phpenv/bin
sh phpenv-install.sh
```

インストール終了後、`.bash_profile`(zshの場合は`.zshrc`)の最終行に以下のコードを追記します。

```bash
vim ~/.bash_profile
		↓
PATH=$HOME/.phpenv/bin:$PATH
eval "$(phpenv init -)"
```
追記終了後、以下のコマンドでSHELLの再起動を行います

```bash
exec -l $SHELL
```
以下のコマンドを実行後、次のような実行結果が表示されればOKです。

```plain
phpenv
	↓
rbenv 0.4.0-146-g7ad01b2
Usage: rbenv <command> [<args>]

Some useful rbenv commands are:
   commands    List all available rbenv commands
   local       Set or show the local application-specific Ruby version
   global      Set or show the global Ruby version
   shell       Set or show the shell-specific Ruby version
   rehash      Rehash rbenv shims (run this after installing executables)
   version     Show the current Ruby version and its origin
   versions    List all Ruby versions available to rbenv
   which       Display the full path to an executable
   whence      List all Ruby versions that contain the given executable
See `rbenv help <command>' for information on a specific command.
For full documentation, see: https://github.com/sstephenson/rbenv#readme
```
