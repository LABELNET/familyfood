<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%
    FamilyFood.Models.user_table user = null;
    double allCount=0.0,eatCount=0.0,shengCount=0.0,diuCount=0.0;
    try
    {
        allCount = (double)ViewData["AllFoodCount"];
        eatCount = (double)ViewData["AllEatCount"];
        shengCount =(double)ViewData["AllShengCount"];
        diuCount =(double)ViewData["AllDiuCount"];
        user = (FamilyFood.Models.user_table)Session["user"];

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
							<li class="active">相关统计</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                    <section>
					<div class="section-body">
						<div class="row">

							<!-- BEGIN ALERT - REVENUE -->
							<div class="col-md-3 col-sm-6">
								<div class="card">
									<div class="card-body no-padding">
										<div class="alert alert-callout alert-info no-margin">
											<strong class="text-xl"><%=allCount%>kg</strong><br>
											<span class="opacity-50">食物总量</span>
                                            <div class="stick-bottom-left-right">
												<div class="progress progress-hairline no-margin">
                                                   <div class="progress-bar progress-bar-success" style="width:100%"></div>
												</div>
											</div>
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
											<strong class="text-xl"><%=eatCount%>kg</strong><br>
											<span class="opacity-50">消耗的食物总量</span>
								            <div class="stick-bottom-left-right">
												<div class="progress progress-hairline no-margin">
                                                   <div class="progress-bar progress-bar-info" style="width:<%=(eatCount/allCount)*100%>%"></div>
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
											<strong class="text-xl"><%=shengCount%>kg</strong><br>
											<span class="opacity-50">剩余的食物总量</span>
											<div class="stick-bottom-left-right">
												<div class="progress progress-hairline no-margin">
                                                   <div class="progress-bar progress-bar-danger" style="width:<%=(shengCount/allCount)*100%>%"></div>
												</div>
											</div>
										</div>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div><!--end .col -->
							<!-- END ALERT - BOUNCE RATES -->

                            <!-- BEGIN ALERT - BOUNCE RATES -->
							<div class="col-md-3 col-sm-6">
								<div class="card">
									<div class="card-body no-padding">
										<div class="alert alert-callout alert-info no-margin">
											<strong class="text-xl"><%=diuCount%>kg</strong><br>
											<span class="opacity-50">丢弃的食物总量</span>
											<div class="stick-bottom-left-right">
												<div class="progress progress-hairline no-margin">
                                                   <div class="progress-bar progress-bar-danger" style="width:<%=(diuCount/allCount)*100%>%"></div>
												</div>
											</div>
										</div>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div><!--end .col -->
							<!-- END ALERT - BOUNCE RATES -->
						</div><!--end .row -->

                                 <div  class="card ">
									<div class="row">
										<div class="col-md-8">
											<div class="card-head">
												<header>统计总结报告</header>
											</div><!--end .card-head -->
											<div class="card-body height-8">
                                               总结：从建立家庭开始，一共添加食物总量：<%=allCount%>kg; 吃掉了<%=eatCount%>kg；剩余了<%=shengCount%>kg;丢弃了<%=diuCount %> kg; 总的来说，系统运行正常。
											</div><!--end .card-body -->
										</div><!--end .col -->
										<div class="col-md-4">
											<div class="card-head">
												<header>近期状况</header>
											</div>
											<div class="card-body height-8">
												<strong>今天添加食物总量：</strong> <%=ViewData["nowCount"] %> kg
												<div class="progress progress-hairline">
													<div class="progress-bar progress-bar-primary-dark" style="width:<%=(((double)ViewData["nowCount"])/allCount)*100%>%"></div>
												</div>
												近3天添加食物总量：<%=ViewData["threeCount"]%> kg
												<div class="progress progress-hairline">
													<div class="progress-bar progress-bar-primary-dark" style="width:<%=(((double)ViewData["threeCount"])/allCount)*100%>%"></div>
												</div>
												近一周添加食物总量：<%= ViewData["weekCount"]%> kg
												<div class="progress progress-hairline">
													<div class="progress-bar progress-bar-danger" style="width:<%=(((double)ViewData["weekCount"])/allCount)*100%>%"></div>
												</div>
												近一个月添加食物总量：<%= ViewData["monthCount"]%> kg
												<div class="progress progress-hairline">
													<div class="progress-bar progress-bar-primary-dark" style="width:<%=(((double)ViewData["monthCount"])/allCount)*100%>%"></div>
												</div>
												近一年添加食物总量：<%=ViewData["yearCount"] %> kg
												<div class="progress progress-hairline">
													<div class="progress-bar progress-bar-primary-dark" style="width:<%=(((double)ViewData["yearCount"])/allCount)*100%>%"></div>
												</div>
											</div><!--end .card-body -->
										</div><!--end .col -->
									</div><!--end .row -->
                                    </div>


					</div><!--end .section-body -->
				</section>

					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>统计</title>
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
