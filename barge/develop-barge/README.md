
# v-dock

vagrant + docker 環境を構築するプロジェクトです。

vagrantのOSは `beage` を使ってます。大変軽量で素晴らしです！

## 概要

dockerを使うことを前提に開発環境を構築する上で必要なものをインストールしてます。  
詳細は `provision_root.sh` を参照ください。
後は`vagrant up`するだけで軽量なdocker環境が構築されます。


プロジェクトの各ディレクトリは `sync` する為のディレクトリとなります。
`home/beagee/` 配下とsyncする想定で、それぞれ以下の役割を意識してます。

- data : dbの保存先や、exportしたファイル等の置き場
- shells : provisionの追加設定、便利ツール置き場
- workspace : プロジェクト作成先。ソース置き場
- dockerspace : dockerプロジェクト、dockerイメージ当の置き場

基本的に使い方を強制するわけではありません。
自分の設定を追加したい場合は `Vagrantfile` に変更を加えてください。

## 設定
`provision_root.sh` でGitのアカウント設定をしてますので、
出来るなら環境変数に任意の値を設定してから実行してください。
※設定をしない場合でも後から設定を追加可能です。

```
export GITUSER=''
export GITEMAIL=''
```
