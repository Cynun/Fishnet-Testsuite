# 关于cjdns
## 简介
cjdns是一个端到端加密的,几乎零配置的仅ipv6 mesh网络.
cjdns网络中的每个实例都有一对公私钥,和对应的唯一ipv6地址.

## 快速设起鱼网兼容路由层
> 我们推荐对cjdns进行基本了解后再加入鱼网的开发,具体见cjdns官方repo:
>
> https://github.com/cjdelisle/cjdns/blob/master/README_ZHCN.md
>
> 本段仅会讲述在ubuntu24上安装并运行cjdns的必须操作.

1. 安装必须的文件
```bash
sudo apt-get install nodejs git build-essential
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#rust使用默认安装
```
2. clone cjdns repo
```bash
git clone https://github.com/cjdelisle/cjdns.git cjdns
cd cjdns
./do
```
> (如果tun设备不存在),创建一个tun设备.
> 
> 使用`LANG=C cat /dev/net/tun`来检查tun设备状态-正常情况下应返回`File descriptor in bad state`
> ```bash
> sudo mkdir -p /dev/net &&
> sudo mknod /dev/net/tun c 10 200 &&
> sudo chmod 0666 /dev/net/tun
> ```
3. 生成默认配置文件
```bash
./cjdroute --genconf >> cjdroute.conf
```
随后修改配置文件(这里是`cjdroute.conf`)
```
// Nodes to connect to.
"connectTo":
{
    //在此处填写向外链接的节点.
    //询问已经在网络中的人-不一定必须是你的邀请者.
}
```
...
```
"authorizedPasswords":
[
    //在此处添加向内链接你的节点需要的许可信息
    "你的对外ip:cjdns外部端口":{"password": "独一无二的密码（请不要输入中文）","publicKey":对方的公钥.k", "user": "便于记忆的名称"},
    ...
],
```
删除dnsseeds中的所有内容-鱼网不使用cjdns的dns系统.
```
    // Configuration for the router.
    "router": {
        // DNS Seeds, these will be used to add peers automatically.
        // The first seed in the list is trusted to provide the snode.
        "dnsSeeds": [
            "seed.pns.cjdns.fr" //删除这一行
        ],
...
```

4. 最后 让cjdns运行起来!

    `sudo ./cjdroute < cjdroute.conf`

    如果需要文件形式的log:

    `sudo ./cjdroute < cjdroute.conf > cjdroute.log`

    停止cjdns:
    
    `sudo killall cjdroute`

## 参考&感谢&外部链接
cjdns 官方中文文档:https://github.com/cjdelisle/cjdns/blob/master/README_ZHCN.md