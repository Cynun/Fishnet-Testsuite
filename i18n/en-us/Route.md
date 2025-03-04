# About the Routing Layer
Trust and Routing - The First Layer of Fishnet

## Trust
Fishnet is an invitation-only network. Except for the first node (Cynun), each node is invited.
Each node will have Leadin node information, serving as a record of the node's inviter.
Since the inviter and invitee trust each other, a trust network emerges - when any link is no longer trusted, the trust network is broken. This makes the entire network trustworthy.

The information of this process is secured by asymmetric encryption to ensure records cannot be forged. The program responsible for this part is called the "Trust Server". The visible network parts will be trustworthy.

> It is planned to be a project independently maintained by Fishnet.
>
> This part has not been implemented yet.
>
> It has relatively low priority.

## Routing
Routing is decentralized - most nodes will participate in routing.
Except for nodes that lack the capability to run their own routing service instances (they are called Fry), behind a NAT as a transit node.

Fishnet's private key -> public key = ipv6 address.

## About cjdns
cjdns is an end-to-end encrypted, almost zero-configuration ipv6-only mesh network.
Each instance in the cjdns network has a pair of public-private keys and a corresponding unique ipv6 address.

> Currently supported by [cjdns](https://github.com/cjdelisle/cjdns).
>
> This part is working and relatively stable.
>
> Its maintenance priority is low (almost no maintenance needed), and research on cjdns alternatives has very low priority.