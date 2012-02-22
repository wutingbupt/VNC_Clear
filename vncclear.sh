#!/bin/sh
#VNC Port clear
echo "Start to clear the useless port"

echo "1. Find the working port:"
var=$(find . -name "\.X[0-9]*-lock" | awk -F- '{print $1}'| awk -F. '{print $3}')



var2=$(ls /tmp/.X11-unix)

for i in $var2;do
 a=1;
 for j in $var;do
 
 if [ $i == $j ];then
#  echo "This is a correct port"
#  echo $i
  a=2
 fi
 done;
 if [ $a == 2 ];then
  echo "This is a correct port "
  echo $i
  a=1
 else
  echo "Remove this port"
  echo $i
  rm -rf /tmp/.X11-unix/$i
fi
done

