
# laradockをvagrant up時に追加するシェル

vagrant + docker(laradock) 環境を構築します。

## 概要

dockerを使うことを前提に開発環境を構築する上で必要なものをインストールしてます。  
詳細は `provision_root.sh` を参照ください。
このシェルを`vagrant up`時に使用するには`Vagrantfile`のlaradocの設定追加する必要があります。

