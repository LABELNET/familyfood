<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%
    List<FamilyFood.Models.food> foods = null;
    try
    {
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
							<li><a href="#">食物</a></li>
							<li class="active">添加食物资料</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                       <div class="row">
							<div class="col-lg-12">
								<h4>添加食物资料卡</h4>
							</div><!--end .col -->
							<div class="col-lg-3 col-md-4">
								<article class="margin-bottom-xxl">
									<p>
                                       家庭食物管理小站温馨提醒：家庭成语均可以录入对应食物的食物资料
										</p>
								</article>
							</div><!--end .col -->
							<div class="col-lg-offset-1 col-md-8">
								<form class="form-validate" method="post" action="/food/FoodIfoAddRequest">
									<div class="card">
										<div class="card-head style-primary">
											<header>添加食物资料卡</header>
										</div>
										<div class="card-body floating-label">
                                           <div class="row">
											<div class="col-sm-10">
                                                <label>选择食物添加资料卡</label>
												<select id="select1" name="fid" class="form-control">
												    <%
                                                        if (foods != null)
                                                        {
                                                            if (foods.Count > 0)
                                                            {

                                                                foreach (FamilyFood.Models.food c in foods)
                                                                {
                                                                
                                                                %>
                                                                 <option value="<%=c.id %>"><%=c.name %></option>
                                                                <%
                                                                
                                                                }

                                                            }
                                                            else { 
                                                            
                                                                %>
                                                                <option value="1">请先添加食物</option>
                                                                <%
                                                                
                                                            
                                                            }
                                                        }
                                                        else { 
                                                        
                                                            %>
                                                             <option value="1">请先添加食物</option>
                                                            <%
                                                        }
                                                %>
                                                	
												
												</select>
											</div>
                                            </div>
											<br>
											<div class="row">
												<div class="col-sm-10">
													<div class="form-group">
                                                        <label >食材描述</label>
														<textarea name="description" id="textarea1" class="form-control" rows="3"></textarea>
														
													</div>
												</div>
										
											</div>

                                            <div class="row">
                                            		<div class="col-sm-10">
													<div class="form-group">
                                                          <label >食材介绍</label>
														<textarea name="message" id="textarea2" class="form-control" rows="3"></textarea>
															
													</div>
												</div>
                                            </div>

                                             <div class="row">
                                            		<div class="col-sm-10">
													<div class="form-group">
                                                          <label >功效</label>
														<textarea name="summary" id="textarea3" class="form-control" rows="3"></textarea>
															
													</div>
												</div>
                                            </div>
											
										</div><!--end .card-body -->
										<div class="card-actionbar">
											<div class="card-actionbar-row">
												<button type="submit" class="btn btn-flat btn-primary ink-reaction">确认添加食物资料卡</button>
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
 <title>添加食物资料</title>
</asp:Content>
