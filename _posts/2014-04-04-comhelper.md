---
layout: page
title: "串口调试助手"
category: tool
date: 2014-04-04 10:43:40
order: 2
---

### 简介

用于向COM口硬件发送指令的测试辅助工具

### 界面

{% asset_path com_helper.png %}

### 使用说明

1. 打开软件后，在左上红框选择对应的COM口
2. 确认已选择字符框上红框内的“HEX发送”选项
3. 确认已选择右上红框的“HEX显示”选项
4. 输入硬件指令，一般为类似"1b 99 00 0d 0a"之类以1b开头，0d 0a结尾的
5. 点击发送
