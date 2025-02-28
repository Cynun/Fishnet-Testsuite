# 生成客户端的key
`wg genkey | tee ./client.private.key | wg pubkey > ./client.public.key`


# 客户端的配置文件 ~/wg/wgclient.conf
```yaml
[Interface]
PrivateKey = <client.private.key>
Address = 10.0.0.<ip>/24, 2001:db8::<ip>/64
DNS = 10.0.0.1

[Peer]
PublicKey = <server.public.key>
Endpoint = <server.ip>:51820
AllowedIPs = 0.0.0.0/0, ::/0
PersistentKeepalive = 25
```

# 服务端的配置文件 /etc/wireguard/wg0.conf
(追加)
```yaml
[Peer]
PublicKey = 
AllowedIPs = 10.0.0.<ip>/32, 2001:db8::<ip>/128
```

```bash
systemctl restart wg-quick@wg0.service #重启wg 更新配置
qrencode -t ansiutf8 <wgclient.conf #生成二维码
```

# 启用ip转发，配置路由表（已经写好了）
```bash
sysctl -w net.ipv4.ip_forward=1
sysctl -w net.ipv6.conf.all.forwarding=1
bash ~/nat.sh
bash ~/nat6.sh
```
## 永久启用 IP 转发：
编辑 /etc/sysctl.conf 文件，并添加以下行：
```yaml
net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1
sysctl -p
```

## 实用链接：
>https://blog.csdn.net/wq1205750492/article/details/124816246

>https://docs.redhat.com/zh-cn/documentation/red_hat_enterprise_linux/9/html/configuring_and_managing_networking/proc_creating-private-and-public-keys-to-be-used-in-wireguard-connections_assembly_setting-up-a-wireguard-vpn#proc_creating-private-and-public-keys-to-be-used-in-wireguard-connections_assembly_setting-up-a-wireguard-vpn

>https://docs.redhat.com/zh-cn/documentation/red_hat_enterprise_linux/9/html/configuring_and_managing_networking/proc_configuring-a-wireguard-server-by-using-the-wg-quick-service_assembly_setting-up-a-wireguard-vpn#proc_configuring-a-wireguard-server-by-using-the-wg-quick-service_assembly_setting-up-a-wireguard-vpn

>https://blog.mistivia.com/posts/2024-03-24-router/
