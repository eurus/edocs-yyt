---
layout: page
title: "转键盘输入"
category: hardware
date: 2014-04-04 11:08:16
order: 2
---

### 刷卡器

使用工具{% driver_path ComSwiperToKeyPress %}，开启软件之前，请配置端口号，确保正确后开启即可。

测试方式：打开记事本，然后直接刷卡。如果一切配置正常，应该会直接显示数字。


### 条码枪

使用工具{% driver_path ComScanerToKeyPress %}，开启软件之前，请配置端口号，确保正确后开启即可。

测试方式：打开记事本，然后直接刷卡。如果一切配置正常，应该会直接显示数字。


### 常见问题

#### 刷卡器转键盘输入，无任何数据

1. 请使用串口调试助手或Access Port侦听串口，并确保刷卡器刷卡时输入的数据符合ComSwiperToKeyPress的要求
2. 如果不符合要求，刷卡器有8个跳线，请配合办事处的设置使输入的数据符合规格
3. 如上述步骤无效，请尝试将所有ComSwiperToKeyPress的进程关闭，有时可能出现多个进程失效的情况
4. 实在不行，可以重启电脑试试key