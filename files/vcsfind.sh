#!/bin/bash
CFGDIR=/etc/vcscheck
GITREPOS=$(find /etc /root /home /opt /usr/local /data_svn -xdev -name ".git" -type d)
for gr in $GITREPOS ; do
    dir=$(dirname $gr)
    #echo $dir
    grep -q "DIR=$dir" $CFGDIR/git*
    if [ $? -ne 0 ]; then
	echo "$dir not found in $CFGDIR"
    fi
done
