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
  if [[ $i -ge 2 ]];then
    echo "第 $i 次 开始执行任务..." 
    flexget -c /root/config.yml --logfile  /root/logs/flexget.log  --test  execute
    tail -n 20 /root/logs/flexget.log
    tail -n 10 /root/logs/autoremove*.log
    i=0
    let y++
    end=$(date +%M)
    take=$(( end - start ))
    echo "已经运行 ${take} 分钟。"
    if [[ $y -ge 2 ]];then
      echo "超时，正在退出！"
      break
    fi
  fi
  let i++
  echo "正在睡眠..." 
  sleep 1m
done
