<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
                      


                      <div class="row">
							<div class="col-lg-12">
								<h2 class="text-primary">Styling options</h2>
							</div><!--end .col -->
							<div class="col-lg-8">
								<article class="margin-bottom-xxl">
									<p>
										Cards can be formatted in different ways so that it best suits its content.
										There are different styles available for this purpose which can be combined with each other.
									</p>
								</article>
							</div><!--end .col -->
						</div>

                       <div class="card">
									<div class="card-head">
										<header>Card with actions</header>
									</div>
									<blockquote>介绍<small>card-head-xs, card-head-sm, regular, card-head-lg</small></blockquote>
                                    <blockquote>功效<small>card-head-xs, card-head-sm, regular, card-head-lg</small></blockquote>

									<div class="card-actionbar">
										<div class="card-actionbar-row">
											<a href="javascript:void(0);" class="btn btn-flat btn-default ink-reaction">删除</a>
											<a href="javascript:void(0);" class="btn btn-flat btn-accent ink-reaction">修改</a>
										</div>
									</div><!--end .card-actionbar -->
						</div>





					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
 <title>食物资料卡</title>
</asp:Content>
