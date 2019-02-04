#!/usr/bin/container-entrypoint /bin/dash

# set -e
grep "^$(id -u)\:" /etc/passwd
if test "$?" -ne "0" 
then
    if ! whoami &> /dev/null; then
        if [ -w /etc/passwd ]; then
            echo "${USER_NAME:-sdk}:x:$(id -u):0:${USER_NAME:-sdk} user:${HOME}:/bin/sh" >> /etc/passwd
        fi
    fi
fi

# echo "sdk" | sudo -S chown -R sdk:sdk /home/sdk
if [ -d "$HOME/.abuild" ]; then
    echo "sdk" | sudo -S /bin/apk-keys
else
	mkdir ~/.abuild
    abuild-keygen -a -n
    echo "sdk" | sudo -S /bin/apk-keys
fi

exec "$@"
