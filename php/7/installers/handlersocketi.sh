#!/usr/bin/env bash

PHP_EXT_DIR=`php-config --extension-dir`

mkdir -p /tmp/handlersocketi-ext && cd /tmp/handlersocketi-ext

git clone https://github.com/tony2001/php-ext-handlersocketi.git -b badoo-7.0 && cd php-ext-handlersocketi

phpize
./configure

make
make install

mv /tmp/handlersocketi-ext/php-ext-handlersocketi/modules/handlersocketi.so "${PHP_EXT_DIR}/handlersocketi.so"

touch /etc/php/7.0/mods-available/handlersocketi.ini && echo extension=handlersocketi.so > /etc/php/7.0/mods-available/handlersocketi.ini
ln -s /etc/php/7.0/mods-available/handlersocketi.ini /etc/php/7.0/cli/conf.d/20-handlersocketi.ini
