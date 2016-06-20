---
layout: default
title: "概述"
---

## 概述

### 简介
银医通项目是将类似银行ATM的自助终端安放在医院内，帮助就诊病人自主完成挂号、缴费、查询、打印等工作，从而大大减轻窗口工作人员的工作强度，减少人为错误发生的概率，并在一定程度上推动了就诊无纸化的进程。

我们所说的银医通，主要指运行在国光自助机上的软件。该软件为一个典型的Web App，一般包含几个方面：

- 服务端程序（Java，一般部署在Tomcat内，负责从医院、银行处获取和处理数据，供前台使用）
- 前台业务流程（Javascript）
- 展现层模板（Flex，一般由美工负责修改）
- 硬件操控（OCX和DLL，一般由硬件部负责开发）

### 开发环境

银医通开发环境需要安装以下这些工具：

0. [JDK 6.0](http://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-javase6-419409.html#jdk-6u45-oth-JPR)
1. IDE：[Eclipse 32位](https://www.eclipse.org/downloads/) (Kepler及以上版本)
2. 数据库：[MySQL 5.5](http://dev.mysql.com/downloads/mysql/5.5.html#downloads)
3. 服务器：[Tomcat 7.0](https://tomcat.apache.org/download-70.cgi)
4. 版本控制：[Git Bash 1.9.0](http://code.google.com/p/msysgit/downloads/list?q=full+installer+official+git)

### git仓库权限

安装完git bash之后，就可以打开并执行以下命令生成ssh key。

{% highlight bash %}
#注意将name@computer_name替换为 名字@计算机名
ssh-keygen -t rsa -C 'name@computer_name' 
{% endhighlight %}

然后将生成的~/.ssh/id_rsa.pub交给管理员，让他为你增加git仓库使用权限。id_rsa和id_rsa.pub请保存好，若不小心删除或丢失，必须使用ssh-keygen重新生成新key，并将新生成的.pub文件交给管理员。

### 客户端运行环境

由于国光提供的ocx只能在32位的系统上运行，所以如果你的操作系统是64位，那么你必须配置一个32位虚拟机来进行终端机的模拟运行。测试机需要安装的软件为：

1. Flash Player 11
2. 注册包括GGUtils (国光提供的一个ocx，用于记录日志和获取终端机MAC)在内的硬件ocx
