#!/bin/bash

docker exec qb  flexget -c /root/config.yml --logfile  /root/logs/flexget.log  --test  execute
docker exec qb  autoremove-torrents --conf=/root/autoremove.config.yml  --log=/root/logs/

sleep 1m
i=0
while True
do
  echo "正在睡眠..." 
  sleep 1m
  echo "正在删除种子..." 
  docker exec qb  autoremove-torrents --conf=/root/autoremove.config.yml  --log=/root/logs/
  i+=1
  if [ i -eq 3 ];then
    echo "第${i}次 开始执行任务..." 
    docker exec qb  flexget -c /root/config.yml --logfile  /root/logs/flexget.log  --test  execute
    i=0
  fi
done
