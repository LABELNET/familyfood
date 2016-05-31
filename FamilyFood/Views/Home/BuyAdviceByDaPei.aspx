<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%
    FamilyFood.Models.user_table user = null;
    List<FamilyFood.Models.model.CardModel> cards = null;
    try
    {
        user = (FamilyFood.Models.user_table)Session["user"];
        cards =(List<FamilyFood.Models.model.CardModel>)ViewData["cards"];
        
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
							<li class="active">购买建议</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                      <div class="row">
                         
                        <div class="row">

                           <%
                               if (cards != null)
                               {

                                   if (cards.Count > 0)
                                   {
                               
                                       for(int i=0;i<cards.Count;i++){
                                       FamilyFood.Models.model.CardModel cm=cards[i];
                                %>

							<!-- BEGIN LAYOUT RIGHT ALIGNED -->
							<div class="col-md-6">
								<div class="card card-underline">
									<div class="card-head">
										<ul class="nav nav-tabs pull-right" data-toggle="tabs">
											<li class="active"><a href="#Div<%=(i+1)*1 %>">描述</a></li>
											<li><a href="#Div<%=(i+1)*10 %>">介绍</a></li>
											<li><a href="#Div<%=(i+1)*100 %>">功效</a></li>
										</ul>
										<header><%=cm.F.name %></header>
									</div>
									<div class="card-body tab-content">
										<div class="tab-pane active" id="Div<%=(i+1)*1 %>">
                                        <p><%=cm.C.description %></p>
										</div>
										<div class="tab-pane" id="Div<%=(i+1)*10 %>">
                                        <p>
                                          <%=cm.C.message %>
                                        </p>
										</div>
										<div class="tab-pane" id="Div<%=(i+1)*100 %>">
                                        <p>
                                          <%=cm.C.summary %>
                                        </p>
										</div>
									</div>
								</div><!--end .card -->
							</div><!--end .col -->
							<!-- END LAYOUT RIGHT ALIGNED -->

							<%
                                      }
           
                                   }else{
                                       %>
                                         <h1>暂时没有购买建议哦，建议添加食物搭配信息！<a class="btn btn_danger btn_block" href="/food/FoodDapeiPageAdd">添加食物搭配信息</a></h1>

                                       <%}
                                       
                             }
                               else
                               { %>

                               <h1>暂时没有购买建议哦，建议添加食物搭配信息！<a class="btn btn_danger btn_block" href="/food/FoodDapeiPageAdd">添加食物搭配信息</a></h1>

                            <%} %>

						</div>
                      </div>


                      


					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
 <title>购买建议</title>
</asp:Content>
