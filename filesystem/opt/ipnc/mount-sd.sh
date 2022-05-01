#!/bin/sh
df |grep -v grep |grep /opt/httpServer/lighttpd/htdocs/sd && /bin/umount -f /opt/httpServer/lighttpd/htdocs/sd/ 
/bin/mount  /dev/$1  /opt/httpServer/lighttpd/htdocs/sd
sync

for j in $(seq 1 3)
do
    himm 0x201B0008 0x0 >/dev/null 2>&1
	himm 0x201B0004 0x0 >/dev/null 2>&1
	himm 0x201B0008 0x02 >/dev/null 2>&1
	sleep 0.2
    himm 0x201B0008 0x0 >/dev/null 2>&1
	himm 0x201B0004 0x0 >/dev/null 2>&1
	himm 0x201B0004 0x01 >/dev/null 2>&1
	sleep 0.2
done

