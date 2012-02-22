#!/bin/sh
#VNC Port clear
echo "Start to clear the useless port"

echo "1. Find the working port:"
var=$(find . -name "\.X[0-9]*-lock" | awk -F- '{print $1}'| awk -F. '{print $3}')

echo "2. Find all of the used ports"
var2=$(ls /tmp/.X11-unix)

for i in $var2;do
    a=1;
    for j in $var;do
    if [ $i == $j ];then
        a=2
    fi
done;
    if [ $a == 2 ];then
        echo "This is a available port and will not be removed "
        echo $i
        a=1
    else
        echo "This port had been destroyed, we can remove it"
        echo $i
    rm -rf /tmp/.X11-unix/$i
fi
done

#TODO current solution can remove more than 90% the useless ports, but still will missed some ports.

