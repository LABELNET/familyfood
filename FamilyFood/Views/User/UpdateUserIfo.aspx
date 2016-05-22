<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%
    
       FamilyFood.Models.user_table user=null;
    try
    {
        user = (FamilyFood.Models.user_table)Session["user"];
       
            if (user == null)
            {
                Response.Redirect("/user/login");
            }
            else {
                if (user.id == 0) {
                    Response.Redirect("/user/login");
                }

                if (user.fid == 0 && user.status>0) {
                    Response.Redirect("/user/FamilyAdd"); //跳转到创建家庭和搜索家庭的页面
                }
            } 
    }catch(Exception e){
         Response.Redirect("/user/login");
    }
    
 %>

 	<!-- BEGIN BLANK SECTION -->
				<section>
					<div class="section-header">
						<ol class="breadcrumb">
							<li><a href="#"></a></li>
							<li class="active"></li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                       <div class="row">
							<div class="col-lg-12">
								<h4>修改用户信息</h4>
							</div><!--end .col -->
							<div class="col-lg-3 col-md-4">
								<article class="margin-bottom-xxl">
									<p>
                                       家庭食物管理小站温馨提醒：再此可以修改你的昵称，性别和健康状况
										</p>
								</article>
							</div><!--end .col -->
							<div class="col-lg-offset-1 col-md-8">
								<form class="form-validate" action="/user/UpdateUserRequest">
									<div class="card">
										<div class="card-head style-primary">
											<header>账户：<%=user.phone%></header>
										</div>
										<div class="card-body floating-label">
											<div>
												<label class="radio-inline radio-styled">
													<input type="radio" name="gendre" value="0"><span>男</span>
												</label>
												<label class="radio-inline radio-styled">
													<input type="radio" name="gendre" value="1" checked=""><span>女</span>
												</label>
											</div>
											<br>
											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
                                                        <label >昵称</label>
														<input type="text" name="nick" class="form-control" id="Firstname2" value="<%=user.nick%>">
														
													</div>
												</div>
										
											</div>

                                            <div class="row">
                                            		<div class="col-sm-6">
													<div class="form-group">
                                                        <label>身体状况</label>
														<input type="text" class="form-control" name="heath" id="Lastname2" value="<%=user.heath==null?"未知":user.heath%>">
														
													</div>
												</div>
                                            </div>
											
										</div><!--end .card-body -->
										<div class="card-actionbar">
											<div class="card-actionbar-row">
												<button type="submit" class="btn btn-flat btn-primary ink-reaction">确认修改</button>
											</div>
										</div>
									</div><!--end .card -->
								</form>
							</div><!--end .col -->
						</div>



					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
  <title>修改用户资料</title>
</asp:Content>
