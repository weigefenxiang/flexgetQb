#!/bin/bash

flexget -c /root/config.yml --logfile  /root/logs/flexget.log  --cron  execute
tail -n 20 /root/logs/flexget.log
start=$(date +%M)

sleep 1m
i=1
y=1
while true
do
  echo "正在删除种子..." 
  autoremove-torrents --conf=/root/autoremove.config.yml  --log=/root/logs/ &>/dev/null
  if [[ $i -ge 4 ]];then   # 4 4分钟
    echo "第 $i 次 开始执行flexget任务..." 
    flexget -c /root/config.yml --logfile  /root/logs/flexget.log  --cron  execute 
    tail -n 20 /root/logs/flexget.log
    tail -n 10 /root/logs/autoremove*.log
    i=0
    let y++
    end=$(date +%M)
    take=$(( end - start ))
    echo "已经运行 ${take} 分钟。"
    if [[ $y -ge 80 ]];then   # 80 4分钟 每小时15次，5小时75次，80
      echo "超时，正在退出！"
      break
    fi
  fi
  let i++
  sleep 1m
done
