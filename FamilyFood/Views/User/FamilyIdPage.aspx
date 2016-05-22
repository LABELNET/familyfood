<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/other.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="OtherContent" runat="server">

  <%
    FamilyFood.Models.family f = null;
    
    try
    {
        f = (FamilyFood.Models.family)ViewData["family"];
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
							<li class="active">家庭申请信息页面</li>
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
						</div><!--end .row -->
						<div class="overlay overlay-shade-bottom stick-bottom-left force-padding text-right">
                           <small><%=f.signature %></small>
						</div>
					</div><!--end .section-body -->
				</section>
                
				
					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="otherHead" runat="server">
 <title>申请加入家庭信息</title>
</asp:Content>
