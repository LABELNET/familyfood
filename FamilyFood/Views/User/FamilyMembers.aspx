<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%
    List<FamilyFood.Models.user_table> users = null;
    FamilyFood.Models.user_table us= null;
    try
    {
        users = (List<FamilyFood.Models.user_table>)ViewData["users"];
        us = (FamilyFood.Models.user_table)Session["user"];
    }
    catch (Exception e)
    {
        //转500
    }
    
    %>

   <div id="content">

				<!-- BEGIN BLANK SECTION -->
				<section>
					<div class="section-header">
						<ol class="breadcrumb">
							<li><a href="#">家庭</a></li>
							<li class="active">家庭成员</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                      <section>
					
					<div class="section-body contain-lg">

						<!-- BEGIN RESPONSIVE TABLE 1 -->
						<div class="row">
							<div class="col-lg-12">
								<h4>家庭成员列表</h4>
							</div><!--end .col -->
							<div class="col-md-8">
								<article class="margin-bottom-xxl">
									<p>家庭食物管理小站温馨提醒：<code>如果是当前用户登录，则可以进行退出家庭操作！！</code></p>
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
														<th>联系方式</th>
														<th>昵称姓名</th>
                                                        <th>性别</th>
														<th>身体状况</th>
														<th>操作</th>
													</tr>
												</thead>
												<tbody>

                                                  <% 
                                                      int i=0;
                                                      for (; i < users.Count; i++)
                                                      {
                                                          FamilyFood.Models.user_table user = users[i];
                                                       %>
													<tr>
														<td><%=i+1 %></td>
														<td><%=user.phone%></td>
														<td><%=user.nick %></td>
														<td><%=user.sex==0?"男":"女" %></td>
														<td><%=user.heath==null?"未知":user.heath %></td>
														<td>
                                                         <%
                                                          if (user.id == us.id)
                                                          {
                                                              %>
                                                        <a href="/user/FamilyIdDeleteRequest?id=<%=user.id %>" class="btn btn-block ink-reaction btn-danger">退出家庭</button>
                                                         <%
                                                          }else{ %>
                                                             <button type="button" class="btn btn-block ink-reaction btn-success">没有权限</button>
                                                             <%}
                                                              %>
                                                        </td>
													</tr>

                                                    <%}
                                                        
                                                         %>

													
												</tbody>
											</table>
										</div><!--end .table-responsive -->
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div><!--end .col -->
						</div><!--end .row -->
						<!-- END RESPONSIVE TABLE 1 -->

					</div>
				</section>
                      



					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
  <title>家庭成员</title>
</asp:Content>
