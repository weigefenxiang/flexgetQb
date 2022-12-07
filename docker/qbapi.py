import qbittorrentapi
from time import sleep

qbt_client = qbittorrentapi.Client(host='127.0.0.1',port=55555,username='admin',password='adminadmin',)

try:
    qbt_client.auth_log_in()
except qbittorrentapi.LoginFailed as e:
    print(e)

print(f'qBittorrent: {qbt_client.app.version}')
print(f'qBittorrent Web API: {qbt_client.app.web_api_version}')
i=0
# qbt_client.torrents_reannounce()
for torrent in qbt_client.torrents.info():
    torrent.pause()
    sleep(2)
print("所有种子已暂停")
sleep(60)
