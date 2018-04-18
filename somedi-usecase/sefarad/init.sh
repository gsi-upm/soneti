#!/bin/sh

# Copy bower dependencies when using -v $PWD/:/usr/src/app

envsubst < /usr/src/app/dashboard-somedi.env.html > /usr/src/app/dashboard-somedi.html || exit 1;


if [ -f /.dockerenv ]; then
    for i in "/usr/src/app"; do
        if [ ! -L "$i/bower_components" ] && [ -d "$i/bower_components" ]; then
            echo "$i/bower_components exists, remove manually!"
            exit 1
        fi
        unlink "$i/bower_components"
        ln -s /usr/src/bower_components "$i"
    done
fi


bower link $APP_NAME --allow-root

envsubst < /usr/src/app/index.env.html > /usr/src/app/index.html || exit 1;
http-server .
