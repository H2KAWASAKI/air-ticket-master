#图片读不出来取img里面找吧

# 民航订票管理系统

​									  

------

​       姓名-班级-学号

[TOC]





## 要求

### 基本要求

民航订票系统主要分为机场、航空公司和客户三方的服务。

1. 航空公司提供航线和飞机的资料；

2. 机场则对在本机场起飞和降落的航班和机票进行管理；

3. 客户能得到的服务应该有查询路线和剩余票数，以及网上订票等功能；

4. 客户可以分为两类：一类是普通客户，对于普通客户只有普通的查询功能和订票功能，没有相应的机票优惠；另一类是经常旅客，需要办理注册手续，但增加了里程积分功能和积分优惠政策；

5. 机场还要有紧急应对措施，在航班出现延误时，要发送相应的信息；

### 拓展要求

1. 用户可以对系统进行反馈留言，促进开发者改良系统

2. 可以在前台添加广告，是前台展示功能更加丰富
3. 后台具有信息功能，可以生成对可视化图标和表格展示
4. 管理员除最高管理员之外，其他人不可访问更改管理员

## 需求分析

### 系统功能分析

- [x] 后台航班信息管理：主要是指添加航班信息，删除航班信息，查询航班信息和航班信息详细情况查看等。

- [x] 后台订单信息管理：后台订单信息管理主要包括订单列表，查询订单信息，订单信息的删除等

- [x] 后台用户信息管理：主要指注册用户的展示与按条件查询注册用户。

- [x] 后台广播信息管理：主要指添加广播信息，删除广播信息等。

- [x] 后台广告信息管理：主要指添加广告信息，删除广告信息等。

- [x] 后台管理员管理：主要指最高管理员可以进行授权管理员和删除管理员

- [x] 后台信息统计：统计订单量，用户量，及一些其他信息。

  

- [x] 前台登录与注册管理：包括前台系统用户的注册于登录。

- [x] 前台首页信息展示：主要是指航班信息展示、航班信息查询、航班信息详情、登录用户信息展示、留言板和 个人信息详情与修改等。

- [x] 前台订单页面：主要是订单内容的填写和订单详情。

- [x] 前台订单支付：订单支付成功界面。

### 系统用列图

#### 前台功能

<img src="/img/im1.png" alt="image-20211223095723454" style="zoom:67%;" />

#### 后台功能

<img src="\img\im2.png" alt="image-20211223115929689" style="zoom:67%;" />

### 数据流图

<img src="\img\im3.png" style="zoom:90%;" />



![](\img\im4.svg)

### 数据字典

#### 数据存储

- 用户数据表
| 数据存储 | 用户数据表   |
| -------- | ------------ |
| 输入     | 用户数据     |
| 输出     | 账户信息     |
| 说明     | 记录用户数据 |



- 会员数据表
| 数据存储 | 会员数据表                 |
| -------- | -------------------------- |
| 输入     | 会员信息（姓名，身份证号） |
| 输出     | 订单积分优惠               |
| 说明     | 记录会员数据，计算积分优惠 |

- 订单数据表
| 数据存储 | 订单数据表   |
| -------- | ------------ |
| 输入     | 订单信息     |
| 输出     | 管理界面     |
| 说明     | 记录订单数据 |

- 航班数据表
| 数据存储 | 航班数据表   |
| -------- | ------------ |
| 输入     | 管理员添加   |
| 输出     | 用户界面     |
| 说明     | 记录航班数据 |

- 留言数据表
| 数据存储 | 留言数据表       |
| -------- | ---------------- |
| 输入     | 用户留言信息     |
| 输出     | 管理员界面       |
| 说明     | 记录留言反馈信息 |

- 广播数据表
| 数据存储 | 广播数据表   |
| -------- | ------------ |
| 输入     | 管理员添加   |
| 输出     | 用户界面     |
| 说明     | 记录广播数据 |

- 广告数据表
| 数据存储 | 广告数据表   |
| -------- | ------------ |
| 输入     | 管理员添加   |
| 输出     | 用户界面     |
| 说明     | 记录广告数据 |

#### 处理过程

用户登录

| 功能 | 用户登录           |
| :--- | :----------------- |
| 输入 | 用户信息           |
| 输出 | 登陆成功，登陆失败 |

- 用户注册

| 功能 | 用户注册               |
| :--- | :--------------------- |
| 输入 | 用户名密码             |
| 输出 | 成功，失败，用户已存在 |

- 会员注册
| 功能 | 会员注册             |
| :--- | :--------------------- |
| 输入 | 会员信息           |
| 输出 | 成功，失败，用户已存在 |

-  订单生产

| 功能 | 机票预订       |
| :--- | :------------- |
| 输入 | 订单信息       |
| 输出 | 预定成功或失败 |

- 留言生产

| 功能 | 留言生产       |
| :--- | :------------- |
| 输入 | 留言内容       |
| 输出 | 留言成功或失败 |

- 广播信息添加

| 功能 | 广播信息添加                   |
| :--- | :----------------------------- |
| 输入 | 广播信息                       |
| 输出 | 添加成功或失败                 |
| 其他 | 如广播信息为航班延误则修改航班 |

- 广告信息添加

| 功能 | 广告信息添加   |
| :--- | :------------- |
| 输入 | 广告信息       |
| 输出 | 添加成功或失败 |

- 航班信息添加

| 功能 | 航班信息添加   |
| :--- | :------------- |
| 输入 | 航班信息       |
| 输出 | 添加成功与失败 |

- 管理员登陆

| 功能 | 管理员登录         |
| :--- | :----------------- |
| 输入 | 账号密码           |
| 输出 | 登陆成功与登录失败 |

- 管理员添加

| 功能 | 管理员添加     |
| :--- | :------------- |
| 输入 | 账号，密码     |
| 输出 | 添加成功或失败 |

## 数据库设计

### 概念结构设计

![ER模型](\img\im5.svg)

### 逻辑结构设计

**管理员（admin）：**

> ​	<u>用户名（user）</u>，密码（pwd）


> ​	<u>留言id（id）</u>，日期（Time），留言用户（userName），内容（message）

**航班（Filght）：**

> <u>航班id（flightId），航班号（flightNumber）</u>，航班起点（flightStart），航班终点（flightEnd），始发机场（flightStartAir），到达机场（flightEndAir），起飞时间（flightStartTime），到达时间（flightEndTime），头等舱价格（flightHighPrice），头等舱座位数（flightHighNumber），商务舱价格（flightMidPrice），商务舱座位数（flightMidNumber），经济舱价格（flightLowPrice），经济舱座位数（filghtLowNumber），延误（delay）

**订单（order）：**

> <u>订单id（orderId）</u>,订单名称（orderName）,下单用户(orderUser),航班id（flightId），乘客姓名（personName），订单日期（orderDate），仓别（Grade），乘客身份证号（persionid），订单金额（orderMoney1），实付金额（oederMoney2），联系人（contcatName），联系人电话（contactPhone）

**用户（user）：**

> <u>用户名（userName）</u>，用户密码（userPwd）

**会员（person）**

><u>用户名（username）</u>，会员姓名（personName），会员身份证号（personId），会员积分（userScore）

**广播（radio）**


### 数据表设计

管理员：

| 列名 | 类型    | 长度 | 小数点 | 是否为空 | 说明 |
| :--- | :------ | :--- | :----- | :------- | :--- |
| user | varchar | 16   | 0      | 否       | 账号 |
| pwd  | varchar | 32   | 0      | 否       | 密码 |

留言评论：

| 列名     | 类型    | 长度 | 小数点 | 是否为空 | 说明     |
| :------- | :------ | :--- | :----- | :------- | :------- |
| id       | int     | 11   | 0      | 否       | 留言id   |
| time     | date    | 0    | 0      | 否       | 日期     |
| userName | varchar | 32   | 0      | 否       | 留言用户 |
| message  | text    | 0-   | 0      | 否       | 内容     |

航班实体：

| 列名             | 类型     | 长度 | 小数点 | 是否为空 | 说明              |
| ---------------- | -------- | ---- | ------ | -------- | ----------------- |
| flightId         | varchar  | 225  | 0      | 否       | 航班id            |
| flightNumber     | varchar  | 225  | 0      | 否       | 航班号            |
| flightStart      | varchar  | 225  | 0      | 否       | 航班起点          |
| flightEnd        | varchar  | 225  | 0      | 否       | 航班终点          |
| flightStartAir   | varchar  | 225  | 0      | 否       | 航班始发机场      |
| flightEndAir     | varchar  | 225  | 0      | 否       | 航班终点机场      |
| flightStartTime  | datatime | 0    | 0      | 否       | 航班始发时间      |
| flightEndTime    | datatime | 0-   | 0      | 否       | 航班那到达时间    |
| flightHighPrice  | double   | 10   | 2      | 是       | 航班头等舱价格    |
| flightHighNumber | int      | 11   | 0      | 是       | 航班头等舱 座位数 |
| flightMidPrice   | double   | 10   | 2      | 是       | 航班商务舱价格    |
| flightMidNumber  | int      | 11-  | 0      | 是       | 航班商务舱座位数  |
| flightLowPrice   | double   | 10   | 2      | 是       | 航班经济舱价格    |
| filghtLowNumber  | int      | 11   | 0      | 是       | 航班经济舱座位数  |
| delay            | bool     |      |        |          | 是否延误          |

订单实体

| 列名         | 类型    | 长度 | 小数点 | 是否为空 | 说明         |
| ------------ | ------- | ---- | ------ | -------- | ------------ |
| orderId      | varchar | 225  | 0      | 否       | 订单id       |
| orderName    | varchar | 225  | 0      | 否       | 订单id       |
| orderUser    | varchar | 16   | 0      | 否       | 下单用户     |
| flightId     | varchar | 225  | 0      | 否       | 航班号       |
| personName   | varchar | 16   | 0      | 否       | 乘客姓名     |
| orderDate    | date    | 0    | 0      | 否       | 下单时间     |
| Grade        | varchar | 3    | 0      | 否       | 舱别         |
| persionid    | varchar | 225  | 0      | 否       | 乘客身份证号 |
| orderMoney1  | double  | 20   | 2      | 否       | 订单金额     |
| orderMoney2  | double  | 20   | 2      | 否       | 实付金额     |
| contcatName  | varchar | 16   | 0      | 否       | 联系人姓名   |
| contactPhone | varchar | 11   | 0      | 否       | 联系人电话   |

用户实体

| 列名     | 类型    | 长度 | 小数点 | 是否为空 | 说明 |
| -------- | ------- | ---- | ------ | -------- | ---- |
| userName | varchar | 16   | 0      | 否       | 账号 |
| userPwd  | varchar | 225  | 0      | 否       | 密码 |

会员实体

| 列名        | 类型    | 长度 | 小数点 | 是否为空 | 说明         |
| ----------- | ------- | ---- | ------ | -------- | ------------ |
| userName    | varchar | 16   | 0      | 否       | 账号         |
| personName  | varchar | 16   | 0      | 否       | 会员姓名     |
| personId    | varchar | 225  | 0      | 否       | 会员身份证号 |
| personScore | int     | 11   | 0      | 否       | 会员积分     |


广播实体

广播id(radionId),广播描述（radiodescribe）

| 列名          | 类型    | 长度 | 小数点 | 是否为空 | 说明     |
| ------------- | ------- | ---- | ------ | -------- | -------- |
| radionId      | varchar | 225  | 0      | 否       | 广播id   |
| radiodescribe | varchar | 225  | 0      | 否       | 广播描述 |

广告

| 列名           | 类型    | 长度 | 小数点 | 是否为空 | 说明     |
| -------------- | ------- | ---- | ------ | -------- | -------- |
| advertId       | varchar | 225  | 0      | 否       | 广告id   |
| advertDescribe | varchar | 225  | 0      | 否       | 广告描述 |
| url            | varchar | 225  | 0      | 否       | 广告链接 |
| picture        | varchar | 225  | 0      | 否       | 图片     |



### 创建表代码

```sql
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
-- admin
CREATE TABLE `admin`  (
  `user` varchar(16) CHARACTER  NOT NULL COMMENT '管理员用户名',
  `pwd` varchar(32) CHARACTER  NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`user`) 
) ;

-- discuss
CREATE TABLE `discuss`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` date NOT NULL,
  `userName` varchar(32) CHARACTER  NOT NULL,
  `message` text CHARACTER  NOT NULL,
  PRIMARY KEY (`id`) ,
  INDEX `userName`(`userName`) 
) ;

-- flight
CREATE TABLE `flight`  (
  `flightId` varchar(255) CHARACTER  NOT NULL COMMENT '航班ID',
  `flightNumber` varchar(255) CHARACTER  NOT NULL COMMENT '航班号',
  `flightStart` varchar(255) CHARACTER  NOT NULL COMMENT '航班起点',
  `flightEnd` varchar(255) CHARACTER  NOT NULL COMMENT '航班终点',
  `flightStartAir` varchar(255) CHARACTER  NOT NULL COMMENT '航班始发机场',
  `flightEndAir` varchar(255) CHARACTER  NOT NULL COMMENT '航班到达机场',
  `flightStartTime` datetime(0) NOT NULL COMMENT '航班起飞时间',
  `flightEndTime` datetime(0) NOT NULL COMMENT '航班到达时间',
  `flightHighPrice` double(10, 2) NULL DEFAULT NULL COMMENT '头等舱价格',
  `flightHighNumber` int(11) NULL DEFAULT NULL COMMENT '头等舱座位数',
  `flightMidPrice` double(10, 2) NULL DEFAULT NULL COMMENT '商务舱价格',
  `flightMidNumber` int(10) NULL DEFAULT NULL COMMENT '商务舱座位数',
  `flightLowPrice` double(10, 2) NULL DEFAULT NULL COMMENT '经济舱价格',
  `flightLowNumber` int(11) NULL DEFAULT NULL COMMENT '经济舱座位数',
  PRIMARY KEY (`flightId`, `flightNumber`) 
) ;

-- order
CREATE TABLE `order`  (
  `orderId` varchar(255) CHARACTER  NOT NULL COMMENT '订单id',
  `orderName` varchar(255) CHARACTER  NOT NULL COMMENT '订单名称',
  `orderUser` varchar(16) CHARACTER  NOT NULL COMMENT '下单用户',
  `flightNumber` varchar(255) CHARACTER  NOT NULL COMMENT '航班号',
  `personName` varchar(16) CHARACTER  NOT NULL COMMENT '乘客姓名',
  `orderDate` date NOT NULL COMMENT '订单日期',
  `grade` varchar(3) CHARACTER  NOT NULL COMMENT '舱别',
  `personId` varchar(225) CHARACTER  NOT NULL COMMENT '乘客身份证号',
  `orderMoney1` double(20, 2) NOT NULL COMMENT '原价',
  `orderMoney2` double(20, 2) NOT NULL COMMENT '折扣后价钱',
  `contactName` varchar(16) CHARACTER  NOT NULL COMMENT '联系人',
  `contactPhone` varchar(11) CHARACTER  NOT NULL COMMENT '联系人电话',
  PRIMARY KEY (`orderId`) 
) ;

-- user
CREATE TABLE `user`  (
  `userName` varchar(16) CHARACTER  NOT NULL COMMENT '用户名',
  `userPwd` varchar(225) CHARACTER  NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`userName`) 
) ;


-- person
CREATE TABLE `person`  (
  `userName` varchar(16) CHARACTER  NOT NULL COMMENT '用户名',
  `personName` varchar(16) CHARACTER  NOT NULL COMMENT '乘客姓名',
  `personId` varchar(225) CHARACTER  NOT NULL COMMENT '乘客身份证号',
  `userScore` int(11) NULL DEFAULT NULL COMMENT '用户积分',
  PRIMARY KEY (`userName`) 
) ;

-- radio
CREATE TABLE `radio`  (
  `radioId` varchar(225) CHARACTER  NOT NULL COMMENT '广播id',
  `radioDescribe` varchar(255) CHARACTER  NOT NULL COMMENT '广播内容',
  PRIMARY KEY (`radioId`) 
) ;

-- advert
CREATE TABLE `advert`  (
  `advertId` varchar(225) CHARACTER  NOT NULL COMMENT '广告id',
  `advertDescribe` varchar(255) CHARACTER  NOT NULL COMMENT '广告内容',
  `url` varchar(255) CHARACTER  NOT NULL COMMENT 'url',
  `picture` varchar(255) CHARACTER  NOT NULL COMMENT 'picture',
  PRIMARY KEY (`advertId`) 
);
```



## 系统总设计

本系统分为前台子系统和后台子系统，具体功能如下

**前台：**

1. 用户登录 
2. 用户注册 
3. 航班查询 
4. 机票详情 
5. 机票预订 
6. 订单支付 
7. 订单查看 
8. 用户留言 
9. 个人信息查看与修改，积分变更

**后台：**

1. 航班信息管理 
2. 订单信息管理 
3. 用户信息管理 
4. 留言评论管理 
5. 广播信息管理
6. 广告信息管理
7. 个人信息管理
8. 信息统计

详细子功能如下图：

![机票预订系统](\img\im6.png)

## 代码开发

### 开发环境相关

开发后台服务语言：openjdk version "11.0.10" 2021-01-19

服务器：Apache Tomcat/8.5.73

数据库：MySql 5.7.36

操作系统：Windows10

开发工具：intelliJ IEDA  2021.3、Navicat permium15

### 开发所用技术

Web前端：HTML，CSS，JavaScript，Bootstrap

Web后端：jsp+servlet

版本控制工具：git version 2.33.1.windows.1

### 源代码目录简介

- airTicket   项目文件夹

  - src

    - main    项目主文件夹

      - java  项目java部分文件夹
        - com.
          - admin   admin管理部分后端代码
            - bean   admin后端各实体定义
            - dao     admin后端各实体操作
            - filter   过滤器，防止未登录访问
            - servlet  admin部分主要功能代码
            - util  存放工具类，定义数据库连接
          - user
            - bean  用户部分的各实体定义
            - dao    用户部分的各实体操作
            - filter  过滤器，防止未登录访问
            - servlet 用户部分功能主要代码
      - webapp
        - admin   admin部分的jsp前端代码
        - css
        - default  用户部分的jsp前端代码
        - fonts
        - images
        - js
        - WEB-INF  
          - web.xml  各servlet和filter的配置位置
        - index.jsp  主页
        - list.jsp     飞机查询列表页
        - login.jsp   前台登录页
        - register.jsp 前台注册页

      test

  - target  编译后的.class文件

<img src="\img\im7.png" alt="image-20220105162415469" style="zoom:67%;" />



### 项目代码

由于代码过多，这里不便放置，这里提供源码地址

[机票管理系统:](https://gitee.com/gao_x/air-ticket)

https://gitee.com/gao_x/air-ticket

## 系统展示

### 后台

后台主页：

![](\img\back\i1.png)

航班添加页面：

![](\img\back\i2.png)

航班列表页：

<img src="\img\back\i3.png" alt="后台航班信息查看" style="zoom:90%;" />

管理员添加页：只有最高权限可以访问

<img src="\img\back\i4.png" alt="管理员信息添加" style="zoom:90%;" />

管理员列表页：只有最高权限可以访问

<img src="\img\back\i5.png" alt="管理员查看" style="zoom:90%;" />

权限不足页面：普通管理员无法进行管理员授权等等

<img src="\img\back\i6.png" alt="管理员无权限" style="zoom:90%;" />

### 前台
前台主页：
<img src="\img\front\i1.png" alt="主页" style="zoom:90%;" />
前台列表页：
<img src="\img\front\i2.png" alt="列表页" style="zoom:90%;" />
订单生成页：
<img src="\img\front\i3.png" alt="订单生成页" style="zoom:90%;" />
个人订单管理页面
<img src="\img\front\i4.png" style="zoom:90%;" />
注册页：
<img src="\img\front\i5.png" alt="注册页" style="zoom:90%;" />



因为部分页面相似，在这里不做图片展示。因部署在云服务器可通过以下连接查看。

主页：   http://110.42.210.89:8080/airticket_war/

管理端：http://110.42.210.89:8080/airticket_war/admin/

​		账号：admin

​		密码：admin

## 个人感想

通过学习数据库原理这门课，我不仅学习了许多之前没有学过的新知识，如许多闻所未闻的sql功能更加重要的学会了如何做一个项目，在做项目之前首先要进行需求分析，然后进行数据库设计，然后才可以进行编码。而前期设计做的越完备，那么后面工作就会越来越简单。

最后感觉到还是非常很幸苦的，整整九天的编码工作，96次提交，数不清次数的代码更改，直到做完，还是很让人感到兴奋。

最后虽然感觉到技术还是欠缺很多，很多知识还是一直半解，在未来还会继续努力。

![image-20220105104509549](\图片\图4.png)
