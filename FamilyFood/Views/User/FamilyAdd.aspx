<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/other.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="OtherContent" runat="server">
 <div id="content">

				<section>
					<div class="section-header">
						<ol class="breadcrumb">
							<li><a href="#">家庭</a></li>
							<li class="active"></li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                        <!-- BEGIN LOGIN SECTION -->
		<section class="section-account">
			<div class="img-backdrop" style="background-image: url('../../assets/img/img16.jpg')"></div>
			<div class="spacer"></div>
			<div class="card contain-sm style-transparent">
				<div class="card-body">
					<div class="row">
						<div class="col-sm-6">
							<br/>
							<span class="text-lg text-bold text-primary">家庭食物管理小站</span>
							<br/><br/>
							<form class="form floating-label" action="/home/index" accept-charset="utf-8" method="post">
								<div class="form-group">
									<input type="text" class="form-control" id="username" name="username">
									<label for="username">家庭名称</label>
								</div>
								
								<br/>
								<div class="row">
									<div class="col-xs-6 text-right">
										<button class="btn btn-primary btn-raised" type="submit">搜索</button>
									</div><!--end .col -->
								</div><!--end .row -->
							</form>
						</div><!--end .col -->
						<div class="col-sm-5 col-sm-offset-1 text-center">
							<br><br>
								<h3 class="text-light">
									没有家庭小站？
								</h3>
								<a class="btn btn-block btn-raised btn-primary" href="#">创建家庭小站</a>
								<br><br>
									
								</div><!--end .col -->
							</div><!--end .row -->
						</div><!--end .card-body -->
					</div><!--end .card -->
				</section>
				<!-- END LOGIN SECTION -->

					</div><!--end .section-body -->
				</section>

			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="otherHead" runat="server">
  <title>加入家庭</title>
</asp:Content>
