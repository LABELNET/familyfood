<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <div id="content">

 <%
     FamilyFood.Models.family f = null;
     try
     {
         f = (FamilyFood.Models.family)ViewData["family"];
     }
     catch (Exception e)
     {
         //转500
     }
     
      %>
				<!-- BEGIN BLANK SECTION -->
				<section>
					<div class="section-header">
						<ol class="breadcrumb">
							<li><a href="#">家庭</a></li>
							<li class="active">修改家庭信息</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                        <div class="row">
							<div class="col-lg-12">
								<h4>修改家庭基本信息</h4>
							</div><!--end .col -->
							<div class="col-lg-3 col-md-4">
								<article class="margin-bottom-xxl">
									<p>
                                       家庭食物管理小站温馨提醒：再此家庭的名称、签名，描述
										</p>
								</article>
							</div><!--end .col -->
							<div class="col-lg-offset-1 col-md-8">
								<form class="form-validate" action="/user/FamilyIfoUpdateRequest">
									<div class="card">
										<div class="card-head style-primary">
											<header>家庭ID : <%=f.id %></header>
										</div>
										<div class="card-body floating-label">
											<br>
											<div class="row">
												<div class="col-sm-10">
													<div class="form-group">
                                                        <label >名称</label>
														<input type="text" name="name" class="form-control" id="Firstname2" value="<%=f.name %>">
														
													</div>
												</div>
										
											</div>

                                            <div class="row">
                                            		<div class="col-sm-10">
													<div class="form-group">
                                                        <label>签名</label>
														<input type="text" class="form-control" name="signature" id="Lastname2" value="<%=f.signature %>">
													</div>
												</div>
                                            </div>

                                               <div class="row">
                                            		<div class="col-sm-10">
													<div class="form-group">
                                                        <label>描述</label>
														<textarea name="description" id="textarea1" class="form-control" rows="3" placeholder=""><%=f.description%></textarea>
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
  <title>修改家庭信息</title>
</asp:Content>
