<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%
    List<FamilyFood.Models.cate> cates  = null;
    try
    {
        cates = (List<FamilyFood.Models.cate>)ViewData["cates"];
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
							<li class="active">添加食物</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                        <div class="row">
							<div class="col-lg-12">
								<h4>添加食物信息</h4>
							</div><!--end .col -->
							<div class="col-lg-3 col-md-4">
								<article class="margin-bottom-xxl">
									<p>
                                       家庭食物管理小站温馨提醒：家庭成语均可以录入食物信息
										</p>
								</article>
							</div><!--end .col -->
							<div class="col-lg-offset-1 col-md-8">
								<form class="form-validate" action="/food/FoodAddRequest">
									<div class="card">
										<div class="card-head style-primary">
											<header>录入食物信息</header>
										</div>
										<div class="card-body floating-label">
                                           <div class="row">
											<div class="col-sm-10">
                                                <label>选择分类</label>
												<select id="select1" name="cid" class="form-control">
												    <%
                                                        if (cates != null)
                                                        {
                                                            if (cates.Count > 0)
                                                            {

                                                                foreach (FamilyFood.Models.cate c in cates) {
                                                                
                                                                %>
                                                                 <option value="<%=c.id %>"><%=c.catecontent %></option>
                                                                <%
                                                                
                                                                }

                                                            }
                                                            else { 
                                                            
                                                                %>
                                                                <option value="1">请先添加分类</option>
                                                                <%
                                                                
                                                            
                                                            }
                                                        }
                                                        else { 
                                                        
                                                            %>
                                                             <option value="1">请先添加分类</option>
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
                                                        <label >食物名称</label>
														<input type="text" name="name" class="form-control" id="Firstname2">
														
													</div>
												</div>
										
											</div>

                                            <div class="row">
                                            		<div class="col-sm-10">
													<div class="form-group">
                                                        <label>重量(kg)</label>
														<input type="text" class="form-control" name="kg" id="Lastname2">
														
													</div>
												</div>
                                            </div>
											
										</div><!--end .card-body -->
										<div class="card-actionbar">
											<div class="card-actionbar-row">
												<button type="submit" class="btn btn-flat btn-primary ink-reaction">提交食物信息</button>
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
  <title>添加食物</title>
</asp:Content>
