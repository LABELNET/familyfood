<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/other.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="OtherContent" runat="server">

<%
    FamilyFood.Models.family f = null;
    List<FamilyFood.Models.user_table> users = null;
   List<FamilyFood.Models.model.CommentModel> modes  = null;
    
    try
    {
        f = (FamilyFood.Models.family)ViewData["family"];
        users = (List<FamilyFood.Models.user_table>)ViewData["users"];
        modes = (List<FamilyFood.Models.model.CommentModel>)ViewData["modes"];
        
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
							<li class="active">家庭主页</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                     <!-- BEGIN PROFILE HEADER -->
				<section class="full-bleed">
					<div class="section-body style-default-dark force-padding text-shadow">
						<div class="img-backdrop" style="background-image: url('../../assets/img/img16.jpg')"></div>
						<div class="overlay overlay-shade-top stick-top-left height-3"></div>
						<div class="row">
							<div class="col-md-3 col-xs-5">
								<h3><%=f.name%><br/><small><%=f.description%></small></h3>
							</div><!--end .col -->
                            <div class="col-md-9 col-xs-7">
								<div class="width-3 text-center pull-right">
									<span class="text-light opacity-75">编辑<a href="/user/FamilyIfoUpdate" class="btn btn-icon-toggle"><i class="md md-colorize"></i></a></span>
								</div>
							</div><!--end .col -->

							
						</div><!--end .row -->



						<div class="overlay overlay-shade-bottom stick-bottom-left force-padding text-right">
                          
                           <small><%=f.signature %></small>

						</div>
					</div><!--end .section-body -->
				</section>
				<!-- END PROFILE HEADER  -->

				<section>
					<div class="section-body no-margin">
						<div class="row">
							<div class="col-md-8">
								<h2>留言/备忘</h2>

								<!-- BEGIN ENTER MESSAGE -->
								<form class="form" action="/user/FamilyPageRequest">
									<div class="card no-margin">
										<div class="card-body">
											<div class="form-group floating-label">
												<textarea name="content" id="status" class="form-control autosize" rows="1"></textarea>
												<label for="status">留言与备忘</label>
											</div>
										</div><!--end .card-body -->
										<div class="card-actionbar">
											<div class="card-actionbar-row">
												<button type="submit" class="btn btn-flat btn-accent ink-reaction">发布</a>
											</div><!--end .card-actionbar-row -->
										</div><!--end .card-actionbar -->
									</div><!--end .card -->
								</form>

								<!-- BEGIN ENTER MESSAGE -->

								<!-- BEGIN MESSAGE ACTIVITY -->
								<div class="tab-pane" id="activity">
									<ul class="timeline collapse-lg timeline-hairline">

                                    <%
                                        if (modes!=null){

                                            if (modes.Count > 0)
                                            {

                                                foreach (FamilyFood.Models.model.CommentModel c in modes)
                                                {
                                        
                                         %>

										<li class="timeline-inverted">
											<div class="timeline-circ circ-xl style-primary"><i class="md md-event"></i></div>
											<div class="timeline-entry">
												<div class="card style-default-light">
													<div class="card-body small-padding">
														<p>
															<span class="text-medium"><span class="text-primary"><%=c.U.nick%></span></span><br/>
															<span class="opacity-50">
															</span>
														</p>
														<%=c.C.comment1%>
													</div>
												</div>
											</div><!--end .timeline-entry -->
										</li>

                                        <%
                                                }
                                            }
                                            else
                                            {
                                          
                                              %>
                                          <li class="timeline-inverted">
											<div class="timeline-circ circ-xl style-primary"><i class="md md-event"></i></div>
											<div class="timeline-entry">
												<div class="card style-default-light">
													<div class="card-body small-padding">
                                                    	<p>
															<span class="text-medium"><span class="text-primary">家庭小站温馨提醒</span></span><br/>
															<span class="opacity-50">
															</span>
														</p>
														暂时没有数据哦
													</div>
												</div>
											</div><!--end .timeline-entry -->
										</li>
                                              <%
                                            }
                                            %>
                                            <%
                                            }else{
                                          
                                              %>
                                              	<li class="timeline-inverted">
											<div class="timeline-circ circ-xl style-primary"><i class="md md-event"></i></div>
											<div class="timeline-entry">
												<div class="card style-default-light">
													<div class="card-body small-padding">
                                                    	<p>
															<span class="text-medium"><span class="text-primary">家庭小站温馨提醒</span></span><br/>
															<span class="opacity-50">
															</span>
														</p>
														暂时没有数据哦
													</div>
												</div>
											</div><!--end .timeline-entry -->
										</li>
                                              <%
                                           
                                          } %>
										
										
									</ul>
								</div><!--end #activity -->
							</div><!--end .col -->
							<!-- END MESSAGE ACTIVITY -->

							<!-- BEGIN PROFILE MENUBAR -->
							<div class="col-lg-offset-1 col-lg-3 col-md-4">
								<div class="card card-underline style-default-dark">
									<div class="card-head">
										<header class="opacity-75"><small>家庭成员</small></header>
									</div><!--end .card-head -->
									<div class="card-body no-padding">
										<ul class="list">
                                           
                                           <% 
                                               
                                               foreach(FamilyFood.Models.user_table u in users){
                                               
                                                %>
											<li class="tile">
												<a class="tile-content ink-reaction" href="#2">
													<div class="tile-icon">
														<img src="../../assets/img/avatar2.jpg?1404026449" alt="" />
													</div>
													<div class="tile-text"><%=u.nick %><small><%=u.phone %></small></div>
												</a>
											</li>

                                            <%
                                                }
                                                 %>
											
										</ul>
									</div><!--end .card-body -->
								</div><!--end .card -->
								<div class="card card-underline style-default-dark">
									<div class="card-head">
										<header class="opacity-75"><small>维护联系方式</small></header>
									</div><!--end .card-head -->
									<div class="card-body no-padding">
										<ul class="list">
											<li class="tile">
												<a class="tile-content ink-reaction">
													<div class="tile-icon">
														<i class="md md-location-on"></i>
													</div>
													<div class="tile-text">
														河南理工大学
														<small>焦作市</small>
													</div>
												</a>
											</li>
											<li class="divider-inset"></li>
											<li class="tile">
												<a class="tile-content ink-reaction">
													<div class="tile-icon">
														<i class="fa fa-phone"></i>
													</div>
													<div class="tile-text">
														 0000-0000-0000-0000
														<small>联系方式</small>
													</div>
												</a>
											</li>
											
										</ul>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div><!--end .col -->
							<!-- END PROFILE MENUBAR -->

						</div><!--end .row -->
					</div><!--end .section-body -->
				</section>

					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="otherHead" runat="server">
  <title>家庭主页</title>
</asp:Content>
