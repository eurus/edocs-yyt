---
layout: page
title: "项目约定"
category: standard
date: 2014-04-04 09:17:03
order: 2
---

### 文件命名规则

pages目录中，必须按照“卡类型缩写-操作”这样的规则命名文件。例如：

* pub-register.js 公用挂号步骤
* mi-purchase.js 医保缴费流程

其中，一般一个流程（比如挂号，会有这两部分的文件）：

#### 公用文件

* pub-register.js 通用挂号步骤
* mc-login.js 诊疗卡登录
* bc-login.js 银行卡登录

#### 特有文件

* mc-register.js 诊疗卡登录、自费挂号流程（依赖pub-register.js 和 mc-login.js）
* bc-register.js 银行卡登录、自费挂号流程（依赖pub-register.js 和 bc-login.js）

### 变量命名规则

#### Step

要求按照“前缀_类型_步骤名称”的方式进行，前缀和类型全部统一小写，例如，合格的命名示例为：

* pub_ajax_enroll
* bc_flex_dev_readBankCard （注意此处由于融合了flex和dev所以类型列出了两个）
* pub_js_afterPurPosReverse 

不合格的命名示例为：

* xj_purchase (拼音、英文混用)
* MedCard_Purchase_step (开头大写，大小写混搭)
* flex_fkjIssueMin1 (没有使用规范的统一标准)

#### Pipeline

要求按照"卡类型_流程名"的方式进行，卡类型和流程名都采用CamelWord的形式(每个变量名最后必须加上_pipeline)，合格的命名示例为：

* MedCard_Purchase_pipeline
* Public_Reprint_pipeline
* IdCard_Register_pipeline

不合格的命名示例为：

* id_puchase (没有使用驼峰格式，拼写不正确)
* bc_jf (不应该使用缩写，没有使用驼峰格式，拼音英文混搭)
* xjgh (全拼音缩写)

- - - 

### 术语字典

#### 卡类型缩写

||||
|:---:|:---:|:--:|
|id|身份证|idCard|
|bc|银行卡|bankCard|
|mc|诊疗卡/就诊卡|mcCard|
|mi|医保卡|miCard|
|si|社保卡|siCard|
|rc|农保卡|rcCard|
|ip|住院号|ipNo|

#### 步骤类型

|||
|:--:|:--:|
|flex|FlexStep|
|ajax|AjaxStep|
|js|JsStep|
|dev|DeviceStep|
|flex_dev|FlexStep中运用了硬件调用|

#### 医院操作

|||
|:--:|:--:|
|登录|login|
|挂号|register|
|缴费|purchase|
|缴费记录|purchaseHistory|
|签约|enroll|
|解约|revoke|
|补打凭条|reprint|
|预交金|prepay|
|预交金充值记录|prepayHistory|
|打印检验单|testReport|

#### 银行交易

|||
|:--:|:--:|
|银行交易|trade|
|查余额|balance|
|扣费|sale|
|冲正|reverse|