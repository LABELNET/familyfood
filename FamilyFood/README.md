# 家庭食物管理小站


# 2016.05.20
 * 工程初始化
 * 安装SqlServer2005图形化界面
 * 新建数据库 family_food ; 登陆名 ： sa ,密码 ：tong
 * 数据库设计
	```
	  user : 用户       ：id,nick(昵称),head（头像）,phone（手机）,pass（密码）,sex（性别）,heath（健康）;
	  food : 食物       ：id,name（姓名）,kg（重量）,dt(时间),uid(用户id),cid（资料卡id）,caid(分类)，status(状态)；
	  card : 食物资料卡  :id,description(描述),message(食材介绍),summary(功效);
	  cate : 食物分类    :id,content(分类内容),uid;
	  dapei: 食物搭配    :id,dp(搭配内容),uid;

	```
 * 系统架构： asp.net mvc 2.0 ; 
