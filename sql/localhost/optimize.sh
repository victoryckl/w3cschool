#!/bin/bash

host_name=localhost
host_port=3306
user_name=root
user_pwd=123456
database=cybertron
need_optmize_table=true

table_name=alltpoint

check_result=$(mysql -h $host_name --port $host_port -u $user_name -p$user_pwd $database -A -Bse "check table $table_name" | awk '{ print $4 }')
if [ "$check_result" = "OK" ]
then
  echo "It's no need to repair table $database.$table_name"
else
  echo $(mysql -h$host_name --port $host_port -u$user_name -p$user_pwd $database -A -Bse "repair table $table_name")
fi

# 优化表,可提高性能
if [ $need_optmize_table = true ]
then
  data_free=$(mysql -h$host_name --port $host_port -u$user_name -p$user_pwd $database -A -Bse "select data_free from information_schema.tables where table_schema='$database' and table_name='$table_name'")

  if [ $data_free > 10*1024 ]
  then
    echo $(mysql -h$host_name --port $host_port -u$user_name -p$user_pwd $database -A -Bse "optimize local table $table_name")
  fi
fi

