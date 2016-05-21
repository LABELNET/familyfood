<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%  %>

<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="utf-8">
        <title>家庭食物管理小站</title>
		<meta name="keywords" content="家庭食物小站" />
		<meta name="description" content="家庭食物小站" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="../assets/css/reset.css">
        <link rel="stylesheet" href="../assets/css/supersized.css">
        <link rel="stylesheet" href="../assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
          <style type="text/css">
           #register{float:right;margin-top:10px;margin-right:10px;font-size:x-small; text-decoration:none;color:White;}
           #register:hover{ cursor:pointer;color:#ff730e;}
        </style>

        <script type="text/javascript">

            function check() {
                var phone = $("#phone").val();
                return validatemobile(phone);
            }

            function validatemobile(mobile) {
                if (mobile.length == 0) {
                    alert('请输入手机号码！');
                    document.form1.mobile.focus();
                    return false;
                }
                if (mobile.length != 11) {
                    alert('请输入有效的手机号码！');
                    document.form1.mobile.focus();
                    return false;
                }

                var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
                if (!myreg.test(mobile)) {
                    alert('请输入有效的手机号码！');
                    document.form1.mobile.focus();
                    return false;
                }

                return true;
            } 

        </script>

    </head>

    <body>

        <div class="page-container">
            <h1>登录</h1>
            <form action="/user/LoginRequest" method="post" onsubmit="return check();">
                <input type="text" name="phone" id="phone"  class="username" placeholder="手机号码">
                <input type="password" name="pass" class="password" placeholder="密码">
                <button type="submit">提交</button>
                 <a id="register" href="/user/register">没有账户？注册</a>
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect">
                <p>家庭食物管理小站欢迎你</p>
                <p>
             
                </p>
            </div>
        </div>
		
        <!-- Javascript -->
        <script src="../assets/js/jquery-1.8.2.min.js"></script>
        <script src="../assets/js/supersized.3.2.7.min.js"></script>
        <script src="../assets/js/supersized-init.js"></script>
        <script src="../assets/js/scripts.js"></script>

    </body>

</html>


