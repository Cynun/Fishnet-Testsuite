IPT=/usr/sbin/ip6tables
SUB_NET=2001:db8::/64
WAN_FACE=tun0

$IPT -t nat -A POSTROUTING -o $WAN_FACE -j MASQUERADE
