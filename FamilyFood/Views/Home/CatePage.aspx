<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div id="content">

				<!-- BEGIN BLANK SECTION -->
				<section>
					<div class="section-header">
						<ol class="breadcrumb">
							<li><a href="#">主页</a></li>
							<li class="active">分类</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      

                     <div class="row">
							<div class="col-lg-12">
								<h4>食物分类信息</h4>
							</div><!--end .col -->
							<div class="col-md-8">
								<article class="margin-bottom-xxl">
									<p>
                                      家庭食物管理小站温馨提醒：<code> 分类管理，家庭成员均可录入，但不是登录成员，不可进行修改和删除操作 </code>
										</p>
								</article>
							</div><!--end .col -->
							<div class="col-lg-12">
								<div class="card">
									<div class="card-body">
										<div class="table-responsive">
											<table class="table no-margin">
												<thead>
													<tr>
														<th>#</th>
														<th>分类内容</th>
														<th>录入成员</th>
														<th>联系方式</th>
														<th>修改</th>
														<th>删除</th>
													</tr>
												</thead>
												<tbody>

													<tr>
														<td>1</td>
														<td>Table cell</td>
														<td>Table cell</td>
														<td>Table cell</td>
														<td>Table cell</td>
														<td>Table cell</td>
													</tr>
													
												</tbody>
											</table>
										</div><!--end .table-responsive -->
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div><!--end .col -->
						</div>

                      

					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->
   

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
  <title>分类管理</title>
</asp:Content>
