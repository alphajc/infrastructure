#! /bin/bash
## Nginx 日志分割脚本
## by wangxb
LOGS_PATH=/opt/nginx/logs
YESTERDAY=`date -d "yesterday" +%Y-%m-%d`
mv ${LOGS_PATH}/access.log ${LOGS_PATH}/access_${YESTERDAY}.log
mv ${LOGS_PATH}/error.log ${LOGS_PATH}/error_${YESTERDAY}.log
/usr/bin/find ${LOGS_PATH}/ -name "access_*" -mtime +10 -exec rm {} \;
/usr/bin/find ${LOGS_PATH}/ -name "error_*" -mtime +10 -exec rm {} \;
sleep 3
kill -USR1 `cat /opt/nginx/logs/nginx.pid`
