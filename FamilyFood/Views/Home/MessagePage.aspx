<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%
    
    List<FamilyFood.Models.user_table> users = null;
    List<FamilyFood.Models.food> foods = null;
    try
    {
        users = (List<FamilyFood.Models.user_table>)ViewData["users"];
        foods = (List<FamilyFood.Models.food>)ViewData["foods"];
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
                        %>

                                    <% 
                                        if (foods.Count > 0)
                                  {
                                      foreach (FamilyFood.Models.food f in foods)
                                      {
                                   %>
                               <div class="card">
									<div class="card-head">
										<header><code>食物处理操作</code></header>
									</div>
									<div class="card-body text-default-light">
										<p>家庭食物小站温馨提醒：<%=f.name %> 于<code> <%=f.dt %> </code> 时购进，已经不新鲜了，您可以进行丢弃操作。</p>
									</div><!--end .card-body -->
									<div class="card-actionbar">
										<div class="card-actionbar-row">
											<a href="/home/MessageDiuqi?id=<%=f.id %>" class="btn btn-flat btn-default ink-reaction">丢弃</a>
                                            <a href="/home/MessageEatAll?id=<%=f.id %>" class="btn btn-flat btn-default ink-reaction">吃完</a>
										</div>
									</div><!--end .card-actionbar -->
								</div>
                                <%
                                    
                                      }
                                  }
                             %>

                              <%
                          if (users.Count == 0 && foods.Count == 0)
                          {
                           %>

                           <h2>暂时没有消息通知哦</h2>

                           <%} %>

					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
  <title>收到的消息</title>
</asp:Content>
