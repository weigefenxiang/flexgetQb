#!/bin/bash

flexget -c /root/config.yml --logfile  /root/logs/flexget.log  --test  execute
autoremove-torrents --conf=/root/autoremove.config.yml  --log=/root/logs/
start=$(date +%M)

sleep 1m
i=1
y=1
while true
do
  echo "正在删除种子..." 
  autoremove-torrents --conf=/root/autoremove.config.yml  --log=/root/logs/
  if [ i -ge 3 ];then
    echo "第$i次 开始执行任务..." 
    flexget -c /root/config.yml --logfile  /root/logs/flexget.log  --test  execute
    i=0
    y+=1
    end=$(date +%M)
    take=$(( end - start ))
    echo "已经运行 ${take} 分钟。"
    cat /root/logs/flexget.log
    if [ y -ge 3 ];then
      echo "超时，正在退出！"
      exit 1
    fi
  fi
  i+=1
  echo "正在睡眠..." 
  sleep 1m
done
