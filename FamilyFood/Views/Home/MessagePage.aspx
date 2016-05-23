<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%
    
    List<FamilyFood.Models.user_table> users = null;
    try
    {
        users = (List<FamilyFood.Models.user_table>)ViewData["users"];

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
							<li class="active">消息通知</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-botdy">

                            
                              <% 
                                  if (users.Count > 0)
                                  {
                                      foreach (FamilyFood.Models.user_table u in users)
                                      {
                                   %>
                               <div class="card">
									<div class="card-head">
										<header><code>用户申请</code></header>
									</div>
									<div class="card-body text-default-light">
										<p>你好！ 我是 <%=u.nick%> ,我的联系方式是 <%=u.phone%> ;我希望加入咱这个大家庭，共同围绕着健康而行！</p>
									</div><!--end .card-body -->
									<div class="card-actionbar">
										<div class="card-actionbar-row">
											<a href="/user/FamilyIdCancelRequest?id=<%=u.id %>" class="btn btn-flat btn-default ink-reaction">拒绝</a>
											<a href="/user/FamilyIdSureRequest?id=<%=u.id %>"   class="btn btn-flat btn-accent ink-reaction">同意</a>
										</div>
									</div><!--end .card-actionbar -->
								</div>
                                <%
                                    
                                      }
                                  }
                                  else
                                  {
                                  
                                   %>
                                    
                                    <h3>暂时没有数据</h3>

                                   <%} %>
					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
  <title>收到的消息</title>
</asp:Content>
