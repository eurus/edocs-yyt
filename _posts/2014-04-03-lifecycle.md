---
layout: page
title: "开发流程"
category: standard
date: 2014-04-03 17:10:25
order: 1
---

### 沟通技巧

* 沟通注意技巧，不要被职务、年龄等标签迷惑，但是要表达出足够的尊重。
* 每一个人都是独立的个体，不要因为自己觉得没问题就不注意控制分寸，要考虑别人的感受，看看在别人眼里，这件事是不是会有负面的影响。
* 尽量客观描述事实，不要在客户面前说合作者的不是（有点像告状）。但是可以描述实际情况，请客户帮助协调。自觉维护国光形象。
* 如果发现无法影响某人的决断（比如信息科科长或银行管理人员），可以尝试联系可以影响这个人决断的人（对，就是这么绕）
* 适当示弱，有些工作并非我方可以决定，可以答复不清楚，或咨询办事处，但注意在和办事处沟通时把握尺度。
* 对于客户提出的更改要求，无需直接给出答复，可让客户先行和办事处书面确认之后，由总部统一安排工作。
* 适当回撤，引起对方重视。如果沟通时间超过工作时间，可以考虑回撤。前提是非我方原因造成项目停滞。
* 按时反馈（自己和他人），如果某个子开发任务超出预期比较久（如计划三天，五天还未完成），尽快找原因，沟通请求帮助，考虑是否回撤。有的时候卡在一个点较长时间，就可以请求别人帮助。

### 问题咨询流程

1. 风豪银医通负责人
2. 风豪团队内部其他开发人员
3. 国光
	* 硬件问题，或者现场协调问题：国光办事处
	* 硬件驱动问题：国光硬件部
	* 界面修改问题：国光软件部美工组


**如果按照下列的项目进展状况，一般一个银医通项目需控制在30-50个工作日（即6-10周）**

### 接口商定阶段（3-5个工作日）

**必须由有开发经验的人负责**

该阶段需要有经验的人，与医院、银行、办事处以协调会或者碰头会的形式讨论具体的需求，尽量在前期暴露用户的所有需求，以防到项目收尾再出现新增的意外而导致项目状况不可控。

该阶段要点：讨论以下问题，避免后期不必要的麻烦

1. 医院和银行的对账如何处理？让医院和银行直接对账；
2. 医保接口由谁封装？让HIS工程师封装，以便后续维护；
3. 医院的接口形式？推荐web service和socket，拒绝存储过程和视图
4. 是否有特殊硬件的使用？

对于问题1的一些说明：

* 现金账一般由国光提供机器日结功能，每天有专人到机器前执行日结操作并取钞箱到银行统一对账
* 银行卡消费，一般由银行或医院提供一个明细文件，FTP传送到另一方直接对账，国光不参与

对于问题2的一些说明：

* 医保接口由我们做，可能会引起不必要的对账困难，前期省了HIS的时间，但是后续隐性浪费了双方的精力；
* 医保有一些接口，比如慢性病或者费用明细上报，开发较为困难，HIS封装可以直接使用开发人员的经验，避免重走不必要的弯路；
* 医保接口由HIS公司开发，后续做修改时，时效性较高，能力也更强；

### 接口测试（10-15个工作日）

此阶段主要分为三块：

* 银行接口测试（1周） - 需要银行准备测试卡、测试库、测试商户号、测试终端号
* 医院接口测试（1周） - 需要医院准备测试卡、测试库、测试操作员号、辅助排班、辅助开药
* 医保接口测试（2周） - 需要医院辅助准备测试卡、联系医保中心准备医保测试库

该阶段要点：

* 尽量节约我方时间，压缩联调时间。若HIS接口在开发过程中，要求我方帮助测试并严重超出预期时间的，应当先回到总部，再议下次联调时间。
* 需要相关人士配合的，比如准备测试卡、测试库等动作，应该在开发人员到场前就确认准备完毕。

### 硬件测试（2-3个工作日）

该阶段要点：

* 确认硬件型号及其对应的ocx，端口号
* 使用测试页面确认各个硬件可以正常工作
* 特殊的硬件，一经发现，立即汇报，并安排相应人员开发相关接口

### 回程开发（5-10个工作日）

该阶段要点：

* 必须提前准备好模拟运行所需的所有素材：硬件模拟js、银行接口模拟、医院接口模拟、医保接口模拟
* 提前联系HIS和银行开发人员准备测试库，一般这个准备过程需要时间较长，尤其是银行
* 每周必须进行一次code review

### 测试库联调（4-8个工作日）

在流程、接口都准备停当后，可以到现场联接医院、银行测试库进行统一的测试，包含流程及页面显示。在这个阶段开始、结束的时候，都必须让医院信息科和银行相关人员知晓进度。

该阶段要点：

* 在该阶段结束时，需要有一个可以交付的软件产品，具体的要求可以查看验收标准
* 在该阶段开始时，必须有一位有较多开发经验的人到现场去指导和安排
* 要让医院和银行的人多体验并给出修改意见，并提前告知一旦切换正式库，改动量应压缩在最小状态
* 该阶段必须确认对账策略，并最好在测试库上试验对账

### 正式库试运行（3-4个工作日）

该阶段要点：

* 必须通知银行和医院并获得确认才可以开始
* 准备尽可能少的机器投入试运行，以防止修改过多导致重复装机
* 观察期内，开发人员必须一直在现场

### 装机（1-2个工作日）

可以联系办事处负责装机，在此之前，必须把装机手册和所需的所有软件、ocx、配置文件备齐。

主要的配置包括：

* IE设置
* Flash安装
* 密码键盘灌秘钥（一般应为银行或软POS厂商的工作）
* 操作员号/终端号/商户号
* ocx注册及配置
* 国光浏览器
* 开机启动项（例如：医保前置等）

该阶段要点：

* 在办事处人员安装完成后，一定要抽检

### 上线（2-3个工作日）

该阶段要点：

* 必须保证所有机器开机即可使用，无需再做任何改动
* 必须保证所有机器在观察期内完全没有问题，如果有，必须在现场就将其改正