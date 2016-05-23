<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%
    FamilyFood.Models.user_table user = null;
    List<FamilyFood.Models.model.DapeiModel> dapeis = null;
    
    try
    {
        user = (FamilyFood.Models.user_table)Session["user"];
        dapeis = (List<FamilyFood.Models.model.DapeiModel>)ViewData["dapeis"];

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
							<li><a href="#">食物</a></li>
							<li class="active">食物搭配</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                      <div class="row">
							<div class="col-lg-12">
								<h4>家庭成员的食物搭配列表</h4>
							</div><!--end .col -->
							<div class="col-md-8">
								<article class="margin-bottom-xxl">
									<p>
                                      家庭食物管理小站温馨提醒：<code> 食物搭配不可修改，如果需要修改，则删除旧的；然后重新添加食物搭配，谢谢 </code>
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
														<th>搭配内容</th>
														<th>录入成员</th>
														<th>联系方式</th>
														<th>删除</th>
													</tr>
												</thead>
												<tbody>

                                                <%
                                                    if (dapeis != null)
                                                    {

                                                        if (dapeis.Count > 0)
                                                        {

                                                            for (int i = 0; i < dapeis.Count; i++)
                                                            {
                                                                FamilyFood.Models.model.DapeiModel c = dapeis[i];
                                                     %>

													    <tr>
														    <td><%=i+1 %></td>
														    <td><%=c.D.dp %></td>
														    <td><%=c.U.nick %></td>
														    <td><%=c.U.phone %></td>
                                                            <%
                                                                if (c.U.id == user.id)
                                                                {
                                                                 %>
														    <td>
                                                             
                                                                <a href="/food/FoodDapeiPageDeleteRequest?id=<%=c.D.id %>" class="btn btn-info btn-block">删除重新录入</a>

                                                            </td>
                                                            <%}
                                                                else
                                                                {
                                                                 %>

														    <td>
                                                             
                                                                <a href="#" class="btn btn-success btn-block">没有权限</a>

                                                            </td>

                                                                 <%} %>

													    </tr>


                                                    <%}
                                                        }
                                                        else
                                                        {
                                                        
                                                        %>
                                                        <tr>
														<td colspan="5">暂无数据</td>
													    </tr>
                                                        
                                                        <%
                                                        
                                                        }

                                                    }
                                                    else
                                                    { %>

                                                    <tr>
														<td colspan="5">暂无数据</td>
													</tr>

                                                    <%} %>

													
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
  <title>食物搭配</title>
</asp:Content>
