#!/bin/bash

read -p "Enter Repo Name " repo_name

if id -u "git" >/dev/null 2>&1; then
    "user exist"
else
    adduser git 
fi

if [ ! -d /home/git/.ssh ];
then
	 mkdir /home/git/.ssh
	chmod 700 /home/git/.ssh
else
	echo "Directory exist"
fi
if [ ! -f /home/git/.ssh/authorized_keys ];
then
        touch /home/git/.ssh/authorized_keys
        chmod 700 /home/git/.ssh/authorized_keys
else
        echo "file exist"
fi
mkdir -p /srv/git/$repo_name.git
chown -R git:git /srv/git
chown -R git:git /home/git
cd /srv/git/$repo_name.git
git init --bare


#cat /root/.ssh/id_rsa.pub > /home/git/.ssh/authorized_keys
#git clone git@github.com:AnelyaHovhannisyan/Utils.git
#cd Utils
#touch m.py
#echo "12443" > README.md
#git add README.md
#git add m.py
#git commpit -m "script"
#git commit -m "new"
#git remote add origin git@github.com:AnelyaHovhannisyan/Utils.git
#git push -u origin main
