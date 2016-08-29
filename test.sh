#!/bin/bash
# 备份tomcat的access和catalina的日志：
tomcat_dir=/opt/sofaware/test-work/tomcat/logs
nginx_dir=/opt/sofaware/test-work/nginx/logs
cd $tomcat_dir
access_log=`ls access* | sort -nk1 | head -n -60`
catalina_log=`ls catalina* | sort -nk1 | head -n -60`
time=`date +%Y%m%d`
tar -zcvf /data/backup/${time}_tomcat_access.tar.gz ${access_log} && tar -zcvf /data/backup/${time}_tomcat_catalina.tar.gz ${catalina_log}
rm -rf ${access_log} ${catalina_log}

#备份nginx日志：
cd $nginx_dir
nginx_log=`ls access* | sort -nk1 | head -n -60`
tar -zcvf /data/backup/${time}_nginx_access.tar.gz ${nginx_log}
rm -rf ${nginx_log}

