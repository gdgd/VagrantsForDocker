#redash
cd /vagrant
git clone https://github.com/getredash/redash.git
cd redash
cp docker-compose.production.yml docker-compose.yml

#初期設定
sudo ./setup/ubuntu/bootstrap.sh 
