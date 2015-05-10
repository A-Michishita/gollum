* [Setup](Setup)
* [PHP install](PHP install)
* [Add module](Add module)

# PHP複数バージョン管理
phpenvとphp-buildを利用したphpの複数バージョン管理を説明

##PHPのインストール方法
先に下記コマンドでインストール可能なphpのバージョンを確認しましょう。  
ここでは5.6.1をインストールします。

```bash
phpenv install --list
```
以下のコマンドでPHPをインストールします。

```bash
phpenv install 5.6.1
phpenv versions #インストール済みのバージョンを確認
```

インストールしたバージョンを利用するには`phpenv global [VERSION]`か`phpenv local [VERSION]`を利用します。  
```bash
# 全体で利用するバージョンを指定します
phpenv global 5.6.1 
# 一部のディレクトリ以下で利用するバージョンを指定します
phpenv local 5.6.1
```

バージョンを確認してみましょう。
```bash
phpenv version
```
PHPのバージョンが正しく認識されない場合、以下のコマンドを実行し、再度パージョンの確認をおこなってください。

```bash
phpenv rehash
```

