#!/bin/sh
export DOCKER_HOST_IP=${DOCKER_HOST_IP}
export LARAVEL_XDEBUG_PORT=${XDEBUG_PORT}
export LARAVEL_XDEBUG_KEY=${XDEBUG_KEY}
printenv

# install laradock
cd ${HOMEDIR}/dockerspace
git clone https://github.com/Laradock/laradock.git

cd ${HOMEDIR}/dockerspace/laradock
# settings
cp ./env-example ./.env
mv ./nginx/sites/default.conf ./nginx/sites/default.conf.bk
cp ./nginx/sites/laravel.conf.example ./nginx/sites/laravel.conf

# .env
sed -i "s/\(^APP_CODE_PATH_HOST=\).*/\APP_CODE_PATH_HOST=\/home\/workspace\//" ./.env
sed -i "s|\(^DOCKER_HOST_IP=\).*|\DOCKER_HOST_IP=$DOCKER_HOST_IP|" ./.env
sed -i "s/\(^WORKSPACE_INSTALL_XDEBUG=\).*/\WORKSPACE_INSTALL_XDEBUG=true/" ./.env
sed -i "s/\(^PHP_FPM_INSTALL_XDEBUG=\).*/\PHP_FPM_INSTALL_XDEBUG=true/" ./.env
sed -i "s/\(^MYSQL_DATABASE=\).*/\MYSQL_DATABASE=homestead/" ./.env
sed -i "s/\(^MYSQL_USER=\).*/\MYSQL_USER=homestead/" ./.env
sed -i "s/\(^MYSQL_PASSWORD=\).*/\MYSQL_PASSWORD=homestead/" ./.env

if [ ${IS_DEBUG} ]; then

# workspace/xdebug.ini
sed -i "s/\(^xdebug.remote_port=\).*/\xdebug.remote_port=$LARAVEL_XDEBUG_PORT/" ./workspace/xdebug.ini
sed -i "s/\(^xdebug.idekey=\).*/\xdebug.idekey=$LARAVEL_XDEBUG_KEY/" ./workspace/xdebug.ini
sed -i "s/\(^xdebug.remote_autostart=\).*/\xdebug.remote_autostart=1/" ./workspace/xdebug.ini
sed -i "s/\(^xdebug.remote_enable=\).*/\xdebug.remote_enable=1/" ./workspace/xdebug.ini
sed -i "s/\(^xdebug.cli_color=\).*/\xdebug.cli_color=1/" ./workspace/xdebug.ini
sed -i "s/\(^xdebug.profiler_output_dir=\).*/\xdebug.profiler_output_dir=\"\/var\/www\/xdebug_log\/xdebug_docker.log\"/" ./workspace/xdebug.ini

# php-fpm/xdebug.ini
sed -i "s/\(^xdebug.remote_port=\).*/\xdebug.remote_port=$LARAVEL_XDEBUG_PORT/" ./php-fpm/xdebug.ini
sed -i "s/\(^xdebug.idekey=\).*/\xdebug.idekey=$LARAVEL_XDEBUG_KEY/" ./php-fpm/xdebug.ini
sed -i "s/\(^xdebug.remote_autostart=\).*/\xdebug.remote_autostart=1/" ./php-fpm/xdebug.ini
sed -i "s/\(^xdebug.remote_enable=\).*/\xdebug.remote_enable=1/" ./php-fpm/xdebug.ini
sed -i "s/\(^xdebug.cli_color=\).*/\xdebug.cli_color=1/" ./php-fpm/xdebug.ini
sed -i "s/\(^xdebug.profiler_output_dir=\).*/\xdebug.profiler_output_dir=\"\/var\/www\/xdebug_log\/xdebug_docker.log\"/" ./php-fpm/xdebug.ini

docker-compose build workspace php-fpm

fi
