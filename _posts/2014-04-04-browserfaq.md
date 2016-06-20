---
layout: page
title: "国光浏览器"
category: faq
date: 2014-04-04 14:01:04
order: 1
---

### 一直停在“正在加载页面”：

1. 使用呼出键（见EIE配置，暂用123456），关闭浏览器，重新打开。
2. 清除ie缓存、清除flash缓存。

### 不加载Flex界面（类似白屏）：

1. 检查EIE界面左上角，应该有一个小方框和一个小圆框，代表加载flash和GGUtils.ocx成功。有异常请重新安装flash及GGUtils.ocx
2. 检查IE可信任站点等安全设置

### 延时加载白屏：

可以不用延时加载，写bat文件决定各进程启动顺序。

### 显示暂停服务

通常是与服务器连接中断，可以用ping检查网络状况，telnet检查端口状况。一般ping通表示到服务器之间的线路没有故障，telnet通表示到服务器特定端口的连接没有故障。

{% highlight bash %}
ping 服务器IP
telnet 服务器IP 8080
{% endhighlight %}

### 按键或页面呈现不完全，点击有死机现象：

通常是与服务器通讯终端，IE缓存导致，清理缓存测试。

### 正中flex框提示url错误等：

1. 检查可信任站点等安全设置
2. 检查C:/ZZAgent/ebagent.ini中VersionPath设置，可改为相对路径VersionPath = config/FlexVersion.json
