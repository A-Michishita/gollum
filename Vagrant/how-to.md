# Vagrantの使い方
## Boxの追加
下記サイトよりboxのURLを調べ、下記コマンドでダウンロード  
http://www.vagrantbox.es/
```
vagrant box add BOX-NAME http://files.vagrantup.com/precise32.box
```
## 仮想環境の作成

```
vagrant init BOX-NAME
```

## 操作方法
### 起動
```
vagrant up
```
### 状態
```
vagrant status
```
### 停止
```
vagrant suspend
```
## 接続

## 参考サイト

* [vagrantbox.es](http://www.vagrantbox.es/)