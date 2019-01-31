sudo pkg install vim

export GITUSER=''
export GITEMAIL=''

#git
sudo pkg install git -e BR2_PACKAGE_OPENSSL=y -e BR2_PACKAGE_LIBCURL=y
git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt

git config --global user.name ＄GITUSER
git config --global user.email ＄GITEMAI
git config --global core.editor 'vim'
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.co checkout

#curl
sudo pkg install libcurl -e BR2_PACKAGE_OPENSSL=y -e BR2_PACKAGE_CURL=y
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

#bindfs criu su-exec tar make vim
sudo pkg install bindfs
sudo pkg install criu
sudo pkg install su-exec
sudo pkg install tar
sudo pkg install make

#docker
sudo /etc/init.d/docker restart latest

docker -v

git clone https://github.com/docker/compose.git /usr/local/src/docker-compose
cd /usr/local/src/docker-compose
export DOCKERCOMPOSE=$(git describe --tags --abbrev=0)

#docker-compose
cd /home
wget -L https://github.com/docker/compose/releases/download/$DOCKERCOMPOSE/docker-compose-`uname -s`-`uname -m`
chmod +x docker-compose-`uname -s`-`uname -m`
sudo mv docker-compose-`uname -s`-`uname -m` /opt/bin/docker-compose
sudo chown root:root /opt/bin/docker-compose

usermod -a -G docker vagrant

docker-compose -v

rm -rf /usr/local/src/docker-compose

#locale
sudo pkg install locales
sudo localedef -i ja_JP -f UTF-8 ja_JP.UTF-8
export LANG=ja_JP.UTF-8

locale -a

#timezone
sudo pkg install tzdata -e BR2_TARGET_TZ_ZONELIST=default -e BR2_TARGET_LOCALTIME="Asia/Tokyo"
echo 'Asia/Tokyo' | sudo tee /etc/timezone
sudo cp -L /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

date