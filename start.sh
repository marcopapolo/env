#!/bin/sh
echo "==> Start the installation"
echo $(pwd)
if [ ! -d /setup/web ]; then
    echo "==> web folder does not exist..."
    git clone https://github.com/marcopapolo/web.git /setup/web
    npm --prefix /setup/web install
    echo "==> web installed."
fi

# we move the docker-compose above
mv docker-compose.yml /setup