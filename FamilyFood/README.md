# 家庭食物管理小站


# 2016.05.21
 * 用户登录： 手机，密码
 * 注册    ： 手机，密码，昵称
 * 用户资料卡 ：根据用户id查询用户资料卡，如果没有
 * 用户信息修改（昵称，密码，性别，健康）
 * 添加食物信息： 需要建立食物资料卡
 * 修改食物信息： 重量和分类可以修改
 * 删除食物信息： 同时删除食物资料卡
 * 查询食物信息： 根据用户uid查询,包括食物资料卡，分类信息，状态（当前时间与存储建立时间对比，超过2天提醒不新鲜了）
 * 用户添加食物搭配 ：以["黄瓜","西红柿"],格式显示；
 * 用户添加

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
	  ucard : 用户资料卡 ：id,taste(最喜欢的口味)，fruit(最喜欢的水果)，vegetables(最喜欢的蔬菜),dishes(最喜欢的菜品)，uid（用户id）

	```
 * 系统架构： asp.net mvc 2.0 ; sqlserver 2005 ;
