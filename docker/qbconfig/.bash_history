cd
cd /
sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list && sed -i s@/security.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list && apt update
mkdir ~/.pip
vim .pip/pip.conf
vi .pip/pip.conf
apt install vim
exit
apt install flexget
exit
