### 更新日志

#### v2.0

2020.02.02

1. 把旧版本里的dns解析模块cproxy换成了clnc
2. 加入了 tun2socks。联发科的不支持TPROXY的手机应该可以免udp的。只有udp部分使用了tun2socks，有个选项的，可以使用tun2socks，也可以使用TPROXY，耗电情况如何没测试过。

#### v2.1

2020.02.20

1. 新增wifi代理功能
2. 新增应用、端口放行功能
2020-02-21: 昨天的域名解析有点小问题，已修复

#### v2.2

2020.03.03

1. 去掉pdnsd，dns解析只用clnc，dns在单独的配置文件里设置
2. tun2socks换成了github上找的[go-tun2socks](https://github.com/eycorsican/go-tun2socks)，好不好用你们先试试，不好用下次就换成大海的tun2socks了

#### v2.3

2020.03.08

1. tun2socks换回原来的了
2. 不再支持32位系统，需要用的自己替换除busybox外的所有其他核心
3. 修复了上个版本用mt管理器关闭时出现的错误提示
4. 里面有两个防跳，感兴趣的可以试试另一个防跳

#### v2.4

2020.03.09

1. 增加了DNS放行功能(DNS留空就是放行)
注意：clnc只支持一个DNS，不要填写多个

#### v2.5

2020.03.20

1. 用最新的源码编译了一下，让v2ray不再需要v2ctl

#### v2.6

2020.04.05

1. 新增国内外双服务器设置
2. 新增ws_tls,kcp等支持。
3. 新增破版权功能。
4. 使用v2ray内置的DNS功能。
5. 不再支持DNS放行功能。
6. v2ray核心换成家住大海魔改的核心，官方核心可能有点小问题

v2.6.1

1. 修复空中卡域名解析失败的BUG

v2.6.2

2020.04.07

1. 更新了geoip.dat,geosite.dat文件

#### v2.7

2020.06.19

1. 核心换成v2fly发布的最新预览版v4.25.0,以后要换最新版核心的自己下载替换
2. 最新版貌似解决了使用socks udp(tun2socks会用到)出现cpu占用高的情况。介绍中也写到TPROXY的udp断流问题也有所改善。

#### v2.8

2021.01.14

1. 替换核心为[Xray-core v1.2.1](https://github.com/XTLS/Xray-core/releases/tag/v1.2.1)(直接把xray改名v2ray后替换的，需要自己替换的这样替换就行了)
2. 修复 `proxy_mode="gfw"` 时的路由设置问题 (该项设置在makeconfig.bin里)
3. 更新geoip.dat, geosite.dat

#### v2.9

2021.01.20

1. 默认禁止ipv6联网(不会影响wifi的ipv6)，可在 `xray.bin` 里设置 (建议直接在APN里设置仅ipv4)

2. 增加了对 `vless` 的支持，使用 `vless` 需要在配置文件中添加 `protocol="vless"`

3. 增加 `xtls` 设置，设置方法参考如下：

   ```
   method="tcp:xtls"
   protocol="vless"
   flow="xtls-rprx-direct"
   ```


#### v3.0

1. 默认关闭流量探测(`makeconfig.bin`里设置)
2. 新增保留上次生成的配置文件选项(需要用到这功能请添加 `keep=1`)
3. 修复一些内网未放行的问题
4. 更新了busybox(v1.31.1)
5. 重新设置了解析域名时的超时设置，防止停机卡等解析时等待较长的时间