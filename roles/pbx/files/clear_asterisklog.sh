#!/bin/bash
#
#this script  clear asterisk log
#history
#wangxb  2014-8-25 Version 1.0
ls /var/log/asterisk/*/full > /tmp/alog_file
ls /var/log/asterisk/*/*log >> /tmp/alog_file
ls /var/log/asterisk/*/message >> /tmp/alog_file
ls /var/log/asterisk/*/cdr-csv/Master.csv>> /tmp/alog_file
d=`date +%u`
list=$(cat /tmp/alog_file)
for file in $list
do
cp ${file}{,_${d}}
> ${file}
done
/bin/rm /tmp/alog_file
