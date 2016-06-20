---
layout: page
title: "硬件概述"
category: hardware
date: 2014-04-04 10:41:41
order: 1
---

### 简介

国光硬件一般采用COM口作为连接口，软件通过DLL驱动与其进行通信。一个DLL函数对应一条到多条的硬件指令，可以通过监听串口（详见Access Port）来查看。

### 硬件型号及对应清单（未完成）

**已验证**

|类型|型号|适用项目|
|:--:|:--:|:--:|
|磁卡机|{% driver_path V2BF+电子闸门 %}| 宣城、无锡 |
|二代证|{% driver_path GGT+B-NH-READER(银安RS232) %} 兼容 国腾| 宣城 |
|二代证|{% driver_path GTICR100B02 %}| 无锡 |
|凭条机|{% driver_path PT30111B %}| 无锡 |
|条码枪|{% driver_path MK4312 %}| 宣城 |
|密码键盘|{% driver_path SNK088A-JSGG-E12 %}| 无锡 |

**未验证**

|类型|型号|适用项目|
|:--:|:--:|:--:|
|GGUtils| {% driver_path GGUtils %} | |
|磁卡机|{% driver_path ICT3K7-3R694Q %}| |
|发卡机|{% driver_path TTCE-K100-C %}| |
|发卡机|{% driver_path TTCE-K710 %}| |
|密码键盘|{% driver_path SNK088A-JSGG-E12-A02 %}| |
|现金|{% driver_path MSM-R3024CN %}| |
|现金|{% driver_path TBV-200 %} | |

**通用版本(2016汇总新增)**

|类型|型号|
|:---:|:---:|
磁卡机|{% driver_path 国光通用/磁卡机_通用_1.00.00 %}
二代证阅读仪|{% driver_path 国光通用/二代证阅读仪_通用_1.00.01 %}
密码键盘|{% driver_path 国光通用/密码键盘_通用_1.00.00 %}
凭条打印机(1.0)|{% driver_path 国光通用/凭条打印机_通用_1.00.00 %}
凭条打印机(2.0)|{% driver_path 国光通用/凭条打印机_通用_2.00.00 %}
刷卡器|{% driver_path 国光通用/刷卡器_通用_1.00.00 %}
读卡器(CJ201)|{% driver_path 国光通用/CJ201读卡器_1.00.01 %}
现金模块(uba)|{% driver_path 国光通用/现金模块_uba_1.00.00 %}
现金模块(cashCode)|{% driver_path 国光通用/现金模块_CashCode_1.00.00 %}




### 硬件排查流程

1. 确认NB2000可以正常使用硬件
	* 如果NB2000无法调用硬件，一般问题为COM口错误或者硬件未上电
2. 确认测试网页可以正常使用硬件
	* 如果NB2000可以使用，但是测试页面无法使用，一般为COM口设置错误
3. 确认程序内可以正常使用硬件
	* 若前两步成功，只有程序内无法使用，一般为浏览器配置或者输入参数有误
	* 如果配置了浏览器并确认输入无误，可以使用Access Port监听串口后汇报至硬件组求援


### 新硬件处理流程

1. 报告至硬件部请求辅助开发驱动和ocx
2. 配合硬件部相关人员在现场调试
3. 请求总部配合书写相应的step文件
4. 将调试完成后的文件打包发至[update@eurus.cn](mailto:update@eurus.cn)，打包名称为“型号.zip”，并在邮件中说明是在哪个项目中使用了相应的文件，以及该硬件对应的类型。zip包中必须包括：
	* 驱动及ocx
	* ocx的注册辅助bat（install.bat）
	* 国光硬件测试页面
	* 硬件js及step js
	* 硬件step js
	* 硬件配置文件
	* 一个简单的使用说明

一个简单的bat文件（install.bat）内容应类似：

{% highlight bat %}
@echo on
copy IDCard.ocx C:\WINDOWS\system32\
regsvr32 IDCard.ocx
pause
{% endhighlight %}