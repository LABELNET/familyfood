<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/other.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="OtherContent" runat="server">

     <div id="content">

				<!-- BEGIN BLANK SECTION -->
				<section>
					<div class="section-header">
						<ol class="breadcrumb">
							<li><a href="#">家庭</a></li>
							<li class="active">/状态</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                       <section class="section-account">
			            <div class="img-backdrop" style="background-image: url('../../assets/img/img16.jpg')"></div>
			            <div class="spacer"></div>
                      </section>

                      <div class="section-body contain-lg">

                         <div class="card-body">
										<div class="row">
											<div class="col-md-offset-3 col-md-6">
                                               <% FamilyFood.Models.user_table user = null;
                                                  try
                                                  {
                                                      user = (FamilyFood.Models.user_table)Session["user"];
                                                      if (user != null)
                                                      {

                                                          if (user.status == 0)
                                                          {
                                              %>

												<a id="toast-success" href="/user/FamilyPage" class="btn btn-block btn-raised btn-default-bright ink-reaction"><i class="md md-notifications pull-right text-success"></i>成功 创建/加入家庭,点击进入家庭主页</a>

                                              <%
                                                          } if (user.status == 2)
                                                          {
                                                   %>
                                                 <a id="toast-info" class="btn btn-block btn-raised btn-default-bright ink-reaction"><i class="md md-notifications pull-right text-default-dark"></i>已申请，正在审核中，请耐心等待</a>
                                                      <%
                                                          } if (user.status == 3)
                                                          {
                                                   %>
											 	<a id="toast-error"  class="btn btn-block btn-raised btn-default-bright ink-reaction"><i class="md md-notifications pull-right text-danger"></i>对不起，你申请的家庭，拒绝了你的申请</a>
                                                      <%
                                                          } if (user.status == 1)
                                                          {
                                                   %>

                                                   <a id="toast-warning"  class="btn btn-block btn-raised btn-default-bright ink-reaction" href="/user/familyadd"><i class="md md-notifications pull-right text-warning"></i>还没有加入家庭，点我申请/创建</a>
                                                        <%
                                                          }
                                                   %>

												
											  <%
                                                      }
                                                      else { 
                                                       %>
                                                  <a  href="/user/login" class="btn btn-block btn-raised btn-default-bright ink-reaction"><i class="md md-notifications pull-right text-danger"></i>对不起，你还没有登录，点我登录</a>
                                              
                                                       <%
                                                      }
                                                }
                                                  catch (Exception e)
                                                  {
                                                      //转500
                                                  }
                                                %>                            
                 

                                            </div>
										</div><!--end .row -->
						 </div>
                         

                      </div>

					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="otherHead" runat="server">
  
  <title>申请/创建家庭状态</title>
<script src="../../assets/js/core/demo/DemoUIMessages.js"></script>
<script type="text/javascript">

    function onToast(type) {
        if (type == 0) {
            toastr.success("成功 创建/加入家庭");
        } else if (type == 1) {
            toastr.warning("还没有加入家庭，请点申请/创建");
        } else if (type == 2) {
            toastr.info("已申请，正在审核中，请耐心等待");
        } else if (type == 3) {
            toastr.error("对不起，你申请的家庭，拒绝了你的申请");
        }
    }

</script>
</asp:Content>
