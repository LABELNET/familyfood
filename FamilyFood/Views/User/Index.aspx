<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div id="content">

				<!-- BEGIN BLANK SECTION -->
				<section>
					<div class="section-header">
						<ol class="breadcrumb">
							<li><a href="#">个人中心</a></li>
							<li class="active">主页</li>
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
								<img class="img-circle border-white border-xl img-responsive auto-width" src="../../assets/img/avatar1.jpg?1403934956" alt="" />
								<h3>Daniel Johnson<br/><small>Consultant at CodeCovers</small></h3>
							</div><!--end .col -->
							<div class="col-md-9 col-xs-7">
								<div class="width-3 text-center pull-right">
									<strong class="text-xl">643</strong><br/>
									<span class="text-light opacity-75">followers</span>
								</div>
								<div class="width-3 text-center pull-right">
									<strong class="text-xl">108</strong><br/>
									<span class="text-light opacity-75">following</span>
								</div>
							</div><!--end .col -->
						</div><!--end .row -->
						<div class="overlay overlay-shade-bottom stick-bottom-left force-padding text-right">
							<a class="btn btn-icon-toggle" data-toggle="tooltip" data-placement="top" data-original-title="Contact me"><i class="fa fa-envelope"></i></a>
							<a class="btn btn-icon-toggle" data-toggle="tooltip" data-placement="top" data-original-title="Follow me"><i class="fa fa-twitter"></i></a>
							<a class="btn btn-icon-toggle" data-toggle="tooltip" data-placement="top" data-original-title="Personal info"><i class="fa fa-facebook"></i></a>
						</div>
					</div><!--end .section-body -->
				</section>
				<!-- END PROFILE HEADER  -->

					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>个人中心</title>
</asp:Content>
