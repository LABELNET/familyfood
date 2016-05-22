<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%
    FamilyFood.Models.ucard ucard = null;
    try
    {
        ucard = (FamilyFood.Models.ucard)ViewData["ucard"];
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
							<li><a href="#">用户</a></li>
							<li class="active">修改用户爱好</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      <section>
					<div class="section-body contain-lg">

						<!-- BEGIN BASIC VALIDATION -->
						<div class="row">
							<div class="col-lg-12">
								<h1 class="text-primary">你最喜爱的食物</h1>
							</div><!--end .col -->
							<div class="col-lg-3 col-md-4">
								<article class="margin-bottom-xxl">
									<p>
										家庭食物管理小站温馨提醒：
                                        认真填写你喜爱的食物，有助于你的健康；
									</p>
									
								</article>
							</div><!--end .col -->
							<div class="col-lg-offset-1 col-md-8">
								<form class="form form-validate floating-label" action="/user/UpdateUserCardRequest" novalidate="novalidate">
									<div class="card">
										<div class="card-body">
                                            <input type="hidden"  name="id" value="<%=ucard.id %>" />
											<div class="form-group">
												<input type="text" class="form-control" id="Name1" name="taste" required="" data-rule-minlength="2" aria-required="true" value="<%=ucard.taste==null?"无":ucard.taste %>">
												<label for="Name1">最喜欢的口味</label>
											</div>

                                            <div class="form-group">
												<input type="text" class="form-control" id="Text1" name="fruit" required="" data-rule-minlength="2" aria-required="true" value="<%=ucard.fruit == null ? "无" : ucard.fruit%>">
												<label for="Text1">最喜欢的水果</label>
											</div>

                                            <div class="form-group">
												<input type="text" class="form-control" id="Text2" name="vegetables" required="" data-rule-minlength="2" aria-required="true" value="<%=ucard.vegetables==null?"无":ucard.vegetables %>">
												<label for="Text2">最喜欢的蔬菜</label>
											</div>

                                            <div class="form-group">
												<input type="text" class="form-control" id="Text3" name="dishes" required="" data-rule-minlength="2" aria-required="true" value="<%=ucard.dishes==null?"无":ucard.dishes %>">
												<label for="Text3">最喜欢的菜品</label>
											</div>
											
										</div><!--end .card-body -->
										<div class="card-actionbar">
											<div class="card-actionbar-row">
												<button type="submit" class="btn btn-flat btn-primary ink-reaction">确认修改</button>
											</div>
										</div><!--end .card-actionbar -->
									</div><!--end .card -->
								</form>
							</div><!--end .col -->
						</div><!--end .row -->
						<!-- END BASIC VALIDATION -->


					</div><!--end .section-body -->
				</section>


					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
  <title>
     修改用户爱好
  </title>
</asp:Content>
