<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%
    FamilyFood.Models.user_table user = null;
    List<FamilyFood.Models.model.CardModel> cardsModels = null;
    
    int count = 0;
    try
    {
        user = (FamilyFood.Models.user_table)Session["user"];
        cardsModels = (List<FamilyFood.Models.model.CardModel>)ViewData["cardsModels"];
        count=(int)ViewData["count"];
        
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
							<li class="active">食物资料卡</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                      <%
                          if (cardsModels != null)
                          {

                              if (cardsModels.Count > 0)
                              {

                                  foreach (FamilyFood.Models.model.CardModel card in cardsModels)
                                  {
                           %>

                      <div class="row">
							<div class="col-lg-12">
								<h2 class="text-primary"><%=card.F.name %></h2>
							</div><!--end .col -->
							<div class="col-lg-8">
								<article class="margin-bottom-xxl">
									<p>
										信息录入成员 ：<code> <%=card.U.nick %>  </code> / 联系方式：<code> <%=card.U.phone %></code>
									</p>
								</article>
							</div><!--end .col -->
						</div>

                       <div class="card">
									<div class="card-head">
										<header><%=card.F.name %></header>
									</div>
                                    <blockquote>描述<small>
                                      <%=card.C.description%>
                                    </small></blockquote>
									<blockquote>介绍<small>
                                      <%=card.C.message %>
                                    </small></blockquote>
                                    <blockquote>功效<small>
                                      <%=card.C.summary %>
                                    </small></blockquote>

									<div class="card-actionbar">
									
                                     
                                         <%
                                      if (card.C.uid != user.id)
                                      { 
                                              %>

                                              	<div class="card-actionbar-row">
											        <a href="javascript:void(0);" class="btn btn-flat btn-default ink-reaction">没有权限</a>
											        <a href="javascript:void(0);" class="btn btn-flat btn-accent ink-reaction">没有权限</a>
										        </div>

                                              <%
                                                  
                                      }
                                      else
                                      { %>

                                      	<div class="card-actionbar-row">
											<a href="/food/FoodIfoDeleteRequest?cid=<%=card.C.id %>" class="btn btn-flat btn-default ink-reaction">删除</a>
											<a href="/food/FoodIfoUpdate?id=<%=card.C.id %>" class="btn btn-flat btn-accent ink-reaction">修改</a>
										</div>


                                      <%
                                      } %>
                                     

									</div><!--end .card-actionbar -->
						</div>

                        <%
                                  }
                              }
                              else { 
                              
                              %>

                              
                          <div class="row">
							<div class="col-lg-12">
								<h2 class="text-primary">还没有数据哦</h2>
							</div><!--end .col -->
							<div class="col-lg-8">
								<article class="margin-bottom-xxl">
									<p>
										<a href="/food/foodifoadd" class="btn btn-flat btn-block">点击添加</a>
									</p>
								</article>
							</div><!--end .col -->
						</div>


                              <%
                              
                              }
                          }
                          else
                          {
                            
                             %>

                          <div class="row">
							<div class="col-lg-12">
								<h2 class="text-primary">还没有数据哦</h2>
							</div><!--end .col -->
							<div class="col-lg-8">
								<article class="margin-bottom-xxl">
									<p>
										<a href="/food/foodifoadd" class="btn btn-flat btn-block">点击添加</a>
									</p>
								</article>
							</div><!--end .col -->
						</div>

                             <%
                                 
                          } %>



					</div><!--end .section-body -->

                            <%
                                    if (count > 10)
                                    {
                                    
                                     %>

                                <ul class="pagination pagination-lg" style="float:right;">
									 <%
                                        for (int i = 0; i <= count%10; i++)
                                        { 
                                         %>

                                          <li><a href="/food/foodifolist?p=<%=i+1 %>"><%=i+1 %></a></li>


                                         <%} %> 
                                        
								</ul>
                                <%
                                    }
                                     %>


				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
 <title>食物资料卡</title>
</asp:Content>
