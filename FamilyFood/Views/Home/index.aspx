<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
  <title>家庭食物管理小站</title>
   <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,600,900|Open+Sans+Condensed:300,300italic,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <script src="../../assets/js/prefixfree.min.js"></script>
       <style>
/* -- usable codes start -- */

html,
body,
div,
span,
object,
iframe,
h1,
h2,
h3,
h4,
h5,
h6,
p,
blockquote,
pre,
a,
abbr,
acronym,
address,
code,
del,
dfn,
em,
img,
q,
dl,
dt,
dd,
ol,
ul,
li,
fieldset,
form,
label,
legend,
table,
caption,
tbody,
tfoot,
thead,
tr,
th,
td,
article,
aside,
dialog,
figure,
footer,
header,
hgroup,
nav,
section {
    margin: 0;
    padding: 0;
    border: 0;
    font-weight: inherit;
    font-style: inherit;
    font-size: 100%;
    font-family: inherit;
    vertical-align: baseline;
    text-decoration: none;
    list-style: none;
}
img {
    width: 100%
}
.anim04c {
    -webkit-transition: all .4s cubic-bezier(.5, .35, .15, 1.4);
    transition: all .4s cubic-bezier(.5, .35, .15, 1.4);
}

html,
body {
    width: 100%;
    height: 100%;
    font-family: 'Source Sans Pro', sans-serif;
    background: #eee;
    color: #666;
}
body {
    overflow-x: hidden;
    overflow-y: auto;
}
/*-----*/

.outer {
    position: relative;
    top: 50%;
    z-index: 1;
    -webkit-transform: translateY(-50%);
    -moz-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    -o-transform: translateY(-50%);
    transform: translateY(-50%);
    cursor: pointer;
}
/*-----*/

.signboard {
    width: 100px;
    height: 100px;
    margin: auto;
    color: #fff;
    border-radius: 10px;
}
/*-----*/

.front {
    position: absolute;
    top: 0;
    left: 0;
    z-index: 3;
    background: #ff726b;
    text-align: center;
}
.right {
    position: absolute;
    right: : 0;
    z-index: 2;
    -webkit-transform: rotate(-10deg) translate(7px, 8px);
    -moz-transform: rotate(-10deg) translate(7px, 8px);
    -ms-transform: rotate(-10deg) translate(7px, 8px);
    -o-transform: rotate(-10deg) translate(7px, 8px);
    transform: rotate(-10deg) translate(7px, 8px);
    background: #EFC94C;
}
.left {
    position: absolute;
    left: 0;
    z-index: 1;
    -webkit-transform: rotate(5deg) translate(-4px, 4px);
    -moz-transform: rotate(5deg) translate(-4px, 4px);
    -ms-transform: rotate(5deg) translate(-4px, 4px);
    -o-transform: rotate(5deg) translate(-4px, 4px);
    transform: rotate(5deg) translate(-4px, 4px);
    background: #3498DB;
}
/*-----*/

.outer:hover .inner {
    -webkit-transform: rotate(0) translate(0);
    -moz-transform: rotate(0) translate(0);
    -ms-transform: rotate(0) translate(0);
    -o-transform: rotate(0) translate(0);
    transform: rotate(0) translate(0);
}
/*-----*/

.outer:active .inner {
    -webkit-transform: rotate(0) translate(0) scale(0.9);
    -moz-transform: rotate(0) translate(0) scale(0.9);
    -ms-transform: rotate(0) translate(0) scale(0.9);
    -o-transform: rotate(0) translate(0) scale(0.9);
    transform: rotate(0) translate(0) scale(0.9);
}
.outer:active .front .date {
    -webkit-transform: scale(2);
}
.outer:active .front .day,
.outer:active .front .month {
    visibility: hidden;
    opacity: 0;
    -webkit-transform: scale(0);
    -moz-transform: scale(0);
    -ms-transform: scale(0);
    -o-transform: scale(0);
    transform: scale(0);
}
.outer:active .right {
    -webkit-transform: rotate(-5deg) translateX(80px) scale(0.9);
    -moz-transform: rotate(-5deg) translateX(80px) scale(0.9);
    -ms-transform: rotate(-5deg) translateX(80px) scale(0.9);
    -o-transform: rotate(-5deg) translateX(80px) scale(0.9);
    transform: rotate(-5deg) translateX(80px) scale(0.9);
}
.outer:active .left {
    -webkit-transform: rotate(5deg) translateX(-80px) scale(0.9);
    -moz-transform: rotate(5deg) translateX(-80px) scale(0.9);
    -ms-transform: rotate(5deg) translateX(-80px) scale(0.9);
    -o-transform: rotate(5deg) translateX(-80px) scale(0.9);
    transform: rotate(5deg) translateX(-80px) scale(0.9);
}
/*-----*/

.outer:active .calendarMain {
    -webkit-transform: scale(1.8);
    opacity: 0;
    visibility: hidden;
}
.outer:active .clock {
    -webkit-transform: scale(1.4);
    opacity: 1;
    visibility: visible;
}
.outer:active .calendarNormal {
    bottom: -30px;
    opacity: 1;
    visibility: visible;
}
.outer:active .year {
    top: -30px;
    opacity: 1;
    visibility: visible;
    letter-spacing: 3px;
}
/*-----*/

.calendarMain {
    width: 100%;
    height: 100%;
    position: absolute;
    opacity: 1;
}
.month,
.day {
    font-size: 10px;
    line-height: 30px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 3px;
}
.date {
    font-size: 40px;
    line-height: 40px;
    font-weight: 300;
    text-transform: uppercase;
    letter-spacing: 3px;
}
/*-----*/

.clock {
    width: 100%;
    height: 100%;
    position: absolute;
    font-size: 40px;
    line-height: 100px;
    font-weight: 300;
    text-transform: uppercase;
    letter-spacing: 3px;
    text-align: center;
    opacity: 0;
    visibility: hidden;
}
/*-----*/

.year {
    width: 100%;
    position: absolute;
    top: 0;
    font-size: 14px;
    line-height: 30px;
    font-weight: 300;
    text-transform: uppercase;
    letter-spacing: 0;
    text-align: center;
    opacity: 0;
    visibility: hidden;
    color: #ff726b;
}
.calendarNormal {
    width: 100%;
    position: absolute;
    bottom: 0;
    font-size: 14px;
    line-height: 30px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 3px;
    text-align: center;
    opacity: 0;
    visibility: hidden;
}
.date2 {
    color: #ff726b;
}
.day2 {
    color: #3498DB;
}
.month2 {
    color: #EFC94C;
}
/* -- usable codes end -- */

/* -- unusable codes (text, logo, etc.) -- */

.info {
    width: 100%;
    height: 25%;
    position: absolute;
    top: 15%;
    text-align: center;
    opacity: 0;
}
.info li {
    width: 100%;
}
.hover,
.click,
.yeaa {
    font-size: 14px;
    line-height: 25px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 2px;
    text-align: center;
    bottom: 0;
    opacity: 1;
}
.dribbble {
    position: absolute;
    top: -60px;
    font-size: 14px;
    opacity: 0;
}
em {
    color: #ed4988;
}
.designer {
    width: 100%;
    height: 50%;
    position: absolute;
    bottom: 0;
    text-align: center;
    opacity: 0;
}
.designer li {
    width: 100%;
    position: absolute;
    bottom: 30%;
}
.designer a {
    width: 30px;
    height: 30px;
    display: block;
    position: relative;
    border-radius: 100%;
    margin: auto;
    color: rgba(46, 204, 113, 0.55);
}
.designer a:after {
    content: "see designs";
    position: absolute;
    top: 0;
    left: 40px;
    font-size: 14px;
    line-height: 33px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 2px;
    white-space: nowrap;
}
.designer a:hover:after {
    color: #2ecc71;
}
.designer img {
    display: block;
    border-radius: 100%;
}
body:hover .info,
body:hover .designer {
    opacity: 1;
}
::selection {
    background: transparent;
}
::-moz-selection {
    background: transparent;
}

</style>
   
    <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
  <script src="../../assets/js/index.js"></script>
  <script type="text/javascript">

      window.onload = function () {

          systemTime();
      };

      //获取系统时间，将时间以指定格式显示到页面。  
      function systemTime() {
          //获取系统时间。  
          var dateTime = new Date();
          var hh = dateTime.getHours();
          var mm = dateTime.getMinutes();
          var ss = dateTime.getSeconds();

          //分秒时间是一位数字，在数字前补0。  
          mm = extra(mm);
          ss = extra(ss);

          //将时间显示到ID为time的位置，时间格式形如：19:18:02  
          document.getElementById("time").innerHTML = hh + ":" + mm + ":" + ss;

          //每隔1000ms执行方法systemTime()。  
          setTimeout("systemTime()", 1000);
      }

      //补位函数。  
      function extra(x) {
          //如果传入数字小于10，数字前补一位0。  
          if (x < 10) {
              return "0" + x;
          }
          else {
              return x;
          }
      }  
</script> 
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%
    FamilyFood.Models.user_table user = null;
    double allCount=0.0, eatCount=0.0, shengCount=0.0, diuCount=0.0;
    List<FamilyFood.Models.food> foods = null;
    List<string> cards = null;
    List<FamilyFood.Models.food> eatFoods = null;
    List<FamilyFood.Models.food> eatNowFood = null;
    try
    {
        allCount = (double)ViewData["AllFoodCount"];
        eatCount = (double)ViewData["AllEatCount"];
        shengCount = (double)ViewData["AllShengCount"];
        diuCount=(double)ViewData["AllDiuCount"];
        
        user = (FamilyFood.Models.user_table)Session["user"];
        foods = (List<FamilyFood.Models.food>)ViewData["NoFrashFood"];
        cards = (List<string>)ViewData["cards"];
        eatFoods = (List<FamilyFood.Models.food>)ViewData["eatFoods"];
        eatNowFood = (List<FamilyFood.Models.food>)ViewData["eatNowFood"];

    }
    catch (Exception e)
    {
    }
    
     %>
	         <div id="content">

				<!-- BEGIN BLANK SECTION -->
				<section>
					<div class="section-header">
						<ol class="breadcrumb">
							<li><a href="#">主页</a></li>
							<li class="active">家庭食物管理小站</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-botdy">
                      

                      <div class="row">

							<!-- BEGIN ALERT - REVENUE -->
							<div class="col-md-3 col-sm-6">
								<div class="card">
									<div class="card-body no-padding">
										<div class="alert alert-callout alert-info no-margin">
											<strong class="text-xl"><%=allCount %> kg</strong><br>
											<span class="opacity-50">食物总量</span>
										</div>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div><!--end .col -->
							<!-- END ALERT - REVENUE -->

							<!-- BEGIN ALERT - VISITS -->
							<div class="col-md-3 col-sm-6">
								<div class="card">
									<div class="card-body no-padding">
										<div class="alert alert-callout alert-warning no-margin">
											<strong class="text-xl"><%=eatCount %> kg</strong><br>
											<span class="opacity-50">消耗的食物总量</span>
											<div class="stick-bottom-left-right">
												<div class="progress progress-hairline no-margin">
													<div class="progress-bar progress-bar-success" style="width:<%=(eatCount/allCount)*100 %>%"></div>
												</div>
											</div>
										</div>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div><!--end .col -->
							<!-- END ALERT - VISITS -->

							<!-- BEGIN ALERT - BOUNCE RATES -->
							<div class="col-md-3 col-sm-6">
								<div class="card">
									<div class="card-body no-padding">
										<div class="alert alert-callout alert-danger no-margin">
											<strong class="text-xl"><%=shengCount %> kg</strong><br>
											<span class="opacity-50">剩余的食物总量</span>
											<div class="stick-bottom-left-right">
												<div class="progress progress-hairline no-margin">
													<div class="progress-bar progress-bar-danger" style="width:<%=(shengCount/allCount)*100 %>%"></div>
												</div>
											</div>
										</div>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div><!--end .col -->
							<!-- END ALERT - BOUNCE RATES -->

                            <div class="col-md-3 col-sm-6">
								<div class="card">
									<div class="card-body no-padding">
										<div class="alert alert-callout alert-success no-margin">
											<h1 class="pull-right text-success"><i class="md md-timer"></i></h1>
											<strong class="text-xl"><%=diuCount %></strong><br>
											<span class="opacity-50">丢弃的食物总量</span>
                                            <div class="stick-bottom-left-right">
												<div class="progress progress-hairline no-margin">
													<div class="progress-bar progress-bar-danger" style="width:<%=(diuCount/allCount)*100 %>%"></div>
												</div>
											</div>
										</div>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div>

                            </div>


                      <div class="row">
                      <div class="col-md-6">
                         <div class="card">
                                    <div class="card-head">
                                      <header>选择你今天要吃掉的食物与重量：</header>
                                    </div>
									<div class="card-body">

                                          <%
                                                      if (eatFoods != null)
                                                      {

                                                          if (eatFoods.Count > 0)
                                                          {
                                                          
                                                       %>
													
                                                 
										<form class="form" action="/home/indexPageRequest" method="post">
											<div class="form-group">
												<select id="id" name="id" class="form-control">
                                                <%
                                                              foreach (FamilyFood.Models.food f in eatFoods)
                                                              {
                                                     %>
                                                     <option value="<%=f.id%>"><%=f.name %></option>
                                                     <%} %>
												</select>
												<label for="select1">选择食物</label>
											</div>

                                            <div class="form-group">
												<select id="kg" name="kg" class="form-control">
                                                    <option value="0.1">0.1</option>
                                                    <option value="0.2">0.2</option>
                                                    <option value="0.3">0.3</option>
                                                    <option value="0.4">0.4</option>
													<option value="0.5">0.5</option>
                                                    <option value="0.8">0.8</option>
													<option value="1.0">1.0</option>
													<option value="1.5">1.5</option>
													<option value="2.0">2.0</option>
													<option value="2.5">2.5</option>
                                                    <option value="3.0">3.0</option>
                                                    <option value="3.5">3.5</option>
                                                    <option value="4.0">4.0</option>
                                                    <option value="5.0">5.0</option>
												</select>
												<label for="select1">选择重量（kg）</label>
											</div>

                                            <div class="form-group">
                                              <button type="submit" class="btn ink-reaction btn-raised btn-lg btn-primary">确定</button>
                                            </div>
										</form>
                                           <%}
                                                          else
                                                          { %>
                                            <p>请先添加食物，才可以选择食物</p>
                                           <%
                                                          }             
                                                      }
                                                      else
                                                      {
                                                      
                                                       %>
                                                        <p>请先添加食物，才可以选择食物</p>
                                                       <%} %>
									</div><!--end .card-body -->
                                    </div>
                          </div>

                          <!-- BEGIN ALERT - TIME ON SITE -->
							<div class="col-md-6">
                            <div class="card">
                                  	<div class="card-head">
										<div class="tools">
											<div class="btn-group">
												<a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
												<a class="btn btn-icon-toggle btn-collapse"><i class="fa fa-angle-down"></i></a>
												<a class="btn btn-icon-toggle btn-close"><i class="md md-close"></i></a>
											</div>
										</div>
										<header>今天的菜单</header>
									</div><!--end .card-head -->
									<div class="card-body style-primary">

                                    <%
                                        if (eatNowFood != null)
                                        {
                                            if (eatNowFood.Count > 0)
                                            {
                                                foreach (FamilyFood.Models.food f in eatNowFood)
                                                {
                                         %>
                                           <p><%=f.name%> ，<%=f.kg %>kg</p>
                                       <%
                                                }
                                            }
                                            else
                                            { %>
                                         <p>暂时没有信息</p>
                                       <%
                                            }
                                        }
                                        else
                                        { %>
                                         <p>暂时没有信息</p>
                                       <%} %>

									</div><!--end .card-body -->
							</div> 
                           </div>
                      </div>

                      <div class="row">
                         
                           <!-- BEGIN ALERT - TIME ON SITE -->
							<div class="col-md-6">
                            <div class="card">
                                  	<div class="card-head">
										<div class="tools">
											<div class="btn-group">
												<a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
												<a class="btn btn-icon-toggle btn-collapse"><i class="fa fa-angle-down"></i></a>
												<a class="btn btn-icon-toggle btn-close"><i class="md md-close"></i></a>
											</div>
										</div>
										<header>当前时间</header>
									</div><!--end .card-head -->
									<div class="card-body style-primary">
										<h1 style="text-align:center;"> <div id="time"></div> </h1>
									</div><!--end .card-body -->
							</div> 
                           </div>


                            <div class="col-md-6">
								<div class="card">
									<div class="card-head">
										<div class="tools">
											<div class="btn-group">
												<a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
												<a class="btn btn-icon-toggle btn-collapse"><i class="fa fa-angle-down"></i></a>
												<a class="btn btn-icon-toggle btn-close"><i class="md md-close"></i></a>
											</div>
										</div>
										<header>小站介绍</header>
									</div><!--end .card-head -->
									<div class="card-body style-primary">
										<p>食物管理小站是通过管理家庭及家庭成员，管理食物及食物搭配，为家庭成员提供优质的健康服务。
                                        该系统致力于以家庭为中心，以家庭食物管理为辅助，通过为家庭成员营造优质健康为行动。</p>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div>

                        
                      
                      </div>

                      <div class="row">
                      
                         <div class="col-md-6">
								<div class="card card-bordered style-primary">
									<div class="card-head">
										<div class="tools">
											<div class="btn-group">
												<a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
												<a class="btn btn-icon-toggle btn-collapse"><i class="fa fa-angle-down"></i></a>
												<a class="btn btn-icon-toggle btn-close"><i class="md md-close"></i></a>
											</div>
										</div>
										<header><i class="fa fa-fw fa-tag"></i> 购买建议</header>
									</div><!--end .card-head -->
									<div class="card-body style-default-bright">

                                       <%
                                           if (cards != null)
                                           {
                                           
                                               if(cards.Count>0){
                                                   
                                                   foreach(string str in cards){
                                               
                                            %>
                                        <p>根据你的食物搭配，你需要购买 <%=str %> !</p>

                                        <%
                                            }
                                            }else{
                                                %>
                                                   <p> 暂时没有购买建议，建议添加食物搭配哦 </p>
                                                <%
                                               }
                                            }
                                           else
                                           {  %>

                                        <p> 暂时没有购买建议，建议添加食物搭配哦 </p>
                                           

                                           <%}%>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div>

                            <div class="col-md-6">
								<div class="card card-underline">
									<div class="card-head">
										<header>不新鲜的食物</header>
										<div class="tools">
											<div class="btn-group">
												<a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
												<a class="btn btn-icon-toggle btn-collapse"><i class="fa fa-angle-down"></i></a>
												<a class="btn btn-icon-toggle btn-close"><i class="md md-close"></i></a>
											</div>
										</div>
									</div><!--end .card-head -->
									<div class="card-body">

                                     <%
                                         if (foods != null)
                                         {
                                             if (foods.Count > 0)
                                             {

                                                 foreach (FamilyFood.Models.food f in foods)
                                                 {
                                             
                                          %>
										<p> 
                                             你于 <%=f.dt %> 时 购买的 <%=f.name %>，再不吃就不新鲜了.
                                            <a href="/home/MessageDiuqi?id=<%=f.id %>" class="btn btn-flat btn-default ink-reaction">丢弃</a>
                                            <a href="/home/MessageEatAll?id=<%=f.id %>" class="btn btn-flat btn-default ink-reaction">吃完</a>
                                        </p>
                                        <%
                                                 }
                                             }
                                             else
                                             {
                                             %>    
                                         <p>嘿嘿，你的食物均新鲜。趁着新鲜，加紧食用哦</p>
                                           <%
                                             }
                                            }
                                         else
                                         { %>
                                         <p>嘿嘿，你的食物均新鲜。趁着新鲜，加紧食用哦</p>
                                        <%} %>

									</div><!--end .card-body -->
								</div><!--end .card -->
							</div>
                      
                      </div>
                     

					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->
   

</asp:Content>
