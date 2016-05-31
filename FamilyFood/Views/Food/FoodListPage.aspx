<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%
    FamilyFood.Models.user_table user = null;
    List<FamilyFood.Models.model.FoodModel> foods = null;
    int count = 0;
    try
    {
        user = (FamilyFood.Models.user_table)Session["user"];
        foods =(List<FamilyFood.Models.model.FoodModel>)ViewData["foods"];
        count = (int)ViewData["count"];
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
							<li class="active">食物列表</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                        <div class="row">
							<div class="col-lg-12">
								<h4>食物信息列表</h4>
							</div><!--end .col -->
							<div class="col-md-8">
								<article class="margin-bottom-xxl">
									<p>
                                      家庭食物管理小站温馨提醒：<code> 食物信息 ： 家庭成员均可录入，但不是登录成员，不可进行修改和删除操作 </code>
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
														<th>食物名称</th>
                                                        <th>食物分类</th>
                                                        <th>总重量</th>
                                                        <th>以消耗</th>
                                                        <th>剩余</th>
														<th>录入成员</th>
														<th>联系方式</th>
                                                        <th>录入时间</th>
														<th>修改</th>
														<th>删除</th>
													</tr>
												</thead>
												<tbody>

                                                <%
                                                    if (foods != null)
                                                    {

                                                        if (foods.Count > 0)
                                                        {

                                                            for (int i = 0; i < foods.Count; i++)
                                                            {
                                                                FamilyFood.Models.model.FoodModel f = foods[i];
                                                     %>

													    <tr>
														    <td><%=i+1 %></td>
														    <td><%=f.F.name %></td>
                                                              <td><%=f.C.catecontent %></td>
														    <td><%=f.F.kg %> kg</td>
                                                            <td><%=f.EatCount %> kg</td>
                                                            <td><%=f.F.kg.Value-f.EatCount %> kg</td>
                                                             <td><%=f.U.nick %></td>
                                                              <td><%=f.U.phone %></td>
                                                               <td><%=f.F.dt %></td>
                                                            <%
                                                                if (f.F.uid == user.id)
                                                                {
                                                                 %>
														    <td>

                                                             <a href="/food/foodupdate?id=<%=f.F.id %>" class="btn btn-info btn-block">修改信息</a>

                                                            </td>
														    <td>
                                                             
                                                                <a href="/food/FoodDeleteRequest?id=<%=f.F.id%>" class="btn btn-danger btn-block">删除信息</a>

                                                            </td>
                                                            <%}
                                                                else
                                                                {
                                                                 %>

                                                              <td>

                                                             <a href="#" class="btn btn-info btn-block">没有权限</a>

                                                            </td>
														    <td>
                                                             
                                                                <a href="#" class="btn btn-danger btn-block">没有权限</a>

                                                            </td>

                                                                 <%} %>

													    </tr>


                                                    <%}
                                                        }
                                                        else
                                                        {
                                                        
                                                        %>
                                                        <tr>
														<td colspan="9">暂无数据</td>
													    </tr>
                                                        
                                                        <%
                                                        
                                                        }

                                                    }
                                                    else
                                                    { %>

                                                    <tr>
														<td colspan="9">暂无数据</td>
													</tr>

                                                    <%} %>

													
												</tbody>
											</table>
										</div><!--end .table-responsive -->

                                        


									</div><!--end .card-body -->
								</div><!--end .card -->

                                <%
                                    if (count > 10)
                                    {
                                    
                                     %>

                                <ul class="pagination pagination-lg" style="float:right;">
									 <%
                                        for (int i = 0; i <= count%10; i++)
                                        { 
                                         %>

                                          <li><a href="/food/foodlistpage?p=<%=i+1 %>"><%=i+1 %></a></li>


                                         <%} %> 
                                        
								</ul>
                                <%
                                    }
                                     %>

							</div><!--end .col 

						</div>

					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
  <title>食物列表</title>
</asp:Content>
