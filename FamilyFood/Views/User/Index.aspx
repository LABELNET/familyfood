<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<% 
    FamilyFood.Models.user_table user = null;
    FamilyFood.Models.ucard ucard = null;
    try
    {
        user = (FamilyFood.Models.user_table)Session["user"];
        ucard = (FamilyFood.Models.ucard)ViewData["ucard"];

        if (user == null)
        {
            Response.Redirect("/user/login");
        }
        else
        {
            if (user.id == 0)
            {
                Response.Redirect("/user/login");
            }

            if (user.fid == 0 && user.status > 0)
            {
                Response.Redirect("/user/FamilyAdd"); //跳转到创建家庭和搜索家庭的页面
            }
        }
    }
    catch (Exception e)
    {
        Response.Redirect("/user/login");
    }
    
     %>

<div id="content">

				<!-- BEGIN BLANK SECTION -->
				<section>
					<div class="section-header">
						<ol class="breadcrumb">
							<li><a href="#">个人中心</a></li>
							<li class="active">主页</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                      <!-- BEGIN PROFILE HEADER -->
				<section class="full-bleed">
					<div class="section-body style-default-dark force-padding text-shadow">
						<div class="img-backdrop" style="background-image: url('../../assets/img/img16.jpg')"></div>
						<div class="overlay overlay-shade-top stick-top-left height-3"></div>
						<div class="row">
							<div class="col-md-3 col-xs-5">
								<img class="img-circle border-white border-xl img-responsive auto-width" src="../../assets/img/avatar1.jpg?1403934956" alt="" />
								<h3><%=user.nick %><br/><small><%=user.phone %></small></h3>
							</div><!--end .col -->
							<div class="col-md-9 col-xs-7">
								<div class="width-3 text-center pull-right">
									<strong class="text-xl"><%=user.heath==null?"未知":user.heath %></strong><br/>
									<span class="text-light opacity-75">健康</span>
								</div>
								<div class="width-3 text-center pull-right">
									<strong class="text-xl"><%=user.sex==0?"男":"女" %></strong><br/>
									<span class="text-light opacity-75">性别</span>
								</div>
							</div><!--end .col -->
                            <div class="overlay overlay-shade-bottom stick-bottom-left force-padding text-right">
                                <h4 style="color:#ffffff">编辑爱好<a href="/user/UpdateUserCard" class="btn btn-icon-toggle"><i class="md md-colorize"></i></a></h4>
                                <h4 style="color:#ffffff">编辑个人信息<a href="/user/UpdateUserIfo" class="btn btn-icon-toggle"><i class="md md-colorize"></i></a></h4>
                            </div>
						</div><!--end .row -->
           
                            <div class="col-md-6">
                                   <hr />
								    <div class="card">
									    <div class="card-head">
										    <div class="tools">
											    <div class="btn-group">
												    <a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
												    <a class="btn btn-icon-toggle btn-collapse"><i class="fa fa-angle-down"></i></a>
											    </div>
										    </div>
										    <header>最喜欢的口味</header>
									    </div><!--end .card-head -->
									    <div class="card-body style-primary" style="display: block;">
										    <p><%=ucard.taste==null?"还没内容哦":ucard.taste %></p>
									    </div><!--end .card-body -->
								    </div><!--end .card -->

                                     
					</div><!--end .section-body -->

                      <div class="col-md-6">
                                   <hr />
								    <div class="card">
									    <div class="card-head">
										    <div class="tools">
											    <div class="btn-group">
												    <a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
												    <a class="btn btn-icon-toggle btn-collapse"><i class="fa fa-angle-down"></i></a>
											    </div>
										    </div>
										    <header>最喜欢的水果</header>
									    </div><!--end .card-head -->
									    <div class="card-body style-primary" style="display: block;">
										    <p><%=ucard.fruit == null ? "还没有内容哦" : ucard.fruit%></p>
									    </div><!--end .card-body -->
								    </div><!--end .card -->

                                     
					</div><!--end .section-body -->  
                    <div class="col-md-6">
                                   <hr />
								    <div class="card">
									    <div class="card-head">
										    <div class="tools">
											    <div class="btn-group">
												    <a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
												    <a class="btn btn-icon-toggle btn-collapse"><i class="fa fa-angle-down"></i></a>
											    </div>
										    </div>
										    <header>最喜欢的蔬菜</header>
									    </div><!--end .card-head -->
									    <div class="card-body style-primary" style="display: block;">
										    <p><%=ucard.vegetables==null?"还没有内容哦":ucard.vegetables %></p>
									    </div><!--end .card-body -->
								    </div><!--end .card -->
                                    </div><!--end .section-body -->

                           <div class="col-md-6">
                                   <hr />
								    <div class="card">
									    <div class="card-head">
										    <div class="tools">
											    <div class="btn-group">
												    <a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
												    <a class="btn btn-icon-toggle btn-collapse"><i class="fa fa-angle-down"></i></a>
											    </div>
										    </div>
										    <header>最喜欢的菜品</header>
									    </div><!--end .card-head -->
									    <div class="card-body style-primary" style="display: block;">
										    <p><%=ucard.dishes==null?"还没有内容哦":ucard.dishes %></p>
									    </div><!--end .card-body -->
								    </div><!--end .card -->

                                     
					</div><!--end .section-body -->
				</section>
				<!-- END PROFILE HEADER  -->

					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>个人中心</title>
</asp:Content>
