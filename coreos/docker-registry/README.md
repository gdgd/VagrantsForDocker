# vagrant_docker-registry-frontend
vagrantで以下プロセスを自動で立ち上げます

os:coreos

dockerプロセス

・registry:2.3.0  
・docker-registry-frontend:v2  

参考：http://qiita.com/rsakao/items/617f54579278173d3c20#registry%E3%82%B3%E3%83%B3%E3%83%86%E3%83%8A


## setup
とりあえず使ってみたいなら以下のコマンド実行

<code>
vagrant up
</code>


### Docker registry
vagrantにsshしてから以下実行

<code>
docker tag <イメージ名>:<タグ> <レジストリのIP>:<ポート>/<任意のリポジトリ名>/<イメージ名>:<タグ>
</code>


### docker-registry-frontend
http://127.0.0.1:8080


### その他
設定が気に食わない場合はconfig周りの設定を修正してください。
