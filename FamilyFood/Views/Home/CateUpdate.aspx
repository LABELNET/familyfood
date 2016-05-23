<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%
    FamilyFood.Models.cate cate = null;
    try
    {
        cate = (FamilyFood.Models.cate)ViewData["cate"];
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
							<li class="active">修改分类</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                        <div class="row">
							<div class="col-lg-12">
								<h4>修改食物分类信息</h4>
							</div><!--end .col -->
							<div class="col-lg-3 col-md-4">
								<article class="margin-bottom-xxl">
									<p>
                                       家庭食物管理小站温馨提醒：<code>家庭成员均可以录入食物分类信息，但成员只可以修改自己的录入的信息</code>
										</p>
								</article>
							</div><!--end .col -->
							<div class="col-lg-offset-1 col-md-8">
								<form class="form-validate" action="/home/CateUpdateRequest">
									<div class="card">
										<div class="card-head style-primary">
											<header>修改食物分类</header>
										</div>
										<div class="card-body floating-label">
                                            <div class="row">
												<div class="col-sm-6">
													<div class="form-group">
                                                        <label >分类内容</label>
                                                        <input type="hidden" name="id" value="<%=cate.id %>"  />
														<input type="text" name="content" class="form-control" id="Firstname2" value="<%=cate.catecontent %>" />
														
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
  <title>修改分类</title>
</asp:Content>
