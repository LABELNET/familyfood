<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/other.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="OtherContent" runat="server">

     <div id="content">

				<!-- BEGIN BLANK SECTION -->
				<section>
					<div class="section-header">
						<ol class="breadcrumb">
							<li><a href="#">家庭</a></li>
							<li class="active">创建家庭</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                      <section class="section-account">
			            <div class="img-backdrop" style="background-image: url('../../assets/img/img16.jpg')"></div>
			            <div class="spacer"></div>
                      </section>
 

                        <div class="section-body contain-lg">
                        	<!-- BEGIN VALIDATION FORM WIZARD -->
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-body ">
										<div id="rootwizard2" class="form-wizard form-wizard-horizontal">
											<form class="form floating-label form-validation" role="form" action="/user/FamilyCreateRequest" novalidate="novalidate">
												<div class="form-wizard-nav">
													<div class="progress"><div class="progress-bar progress-bar-primary"></div></div>
													<ul class="nav nav-justified">
														<li class="active"><a href="#step1" data-toggle="tab"><span class="step">1</span> <span class="title">家庭名称</span></a></li>
														<li><a href="#step2" data-toggle="tab"><span class="step">2</span> <span class="title">家庭签名</span></a></li>
														<li><a href="#step3" data-toggle="tab"><span class="step">3</span> <span class="title">家庭描述</span></a></li>
														<li><a href="#step4" data-toggle="tab"><span class="step">4</span> <span class="title">完成</span></a></li>
													</ul>
												</div><!--end .form-wizard-nav -->
												<div class="tab-content clearfix">
													<div class="tab-pane active" id="step1">
														<div class="form-group">
															<input type="text" name="name" id="occupation" class="form-control" data-rule-minlength="4" required>
															<label for="occupation" class="control-label">名称</label>
														</div>
													</div><!--end #step1 -->
													<div class="tab-pane" id="step2">
														<br/><br/>
														<div class="form-group">
															<input type="text" name="signature" class="form-control" data-rule-minlength="4" required>
															<label for="email" class="control-label">签名</label>
														</div>
														
													</div><!--end #step2 -->
													<div class="tab-pane" id="step3">
														<br/><br/>
														<div class="form-group">
															<input type="text" name="description" class="form-control" data-rule-minlength="4" required>
															<label for="email" class="control-label">描述</label>
														</div>
													</div><!--end #step3 -->
													<div class="tab-pane" id="step4">
														<br/><br/>
														<div class="form-group">
															<button type="submit" class="btn btn-default-bright btn-block">确认创建家庭</button>
														</div>
														
													</div><!--end #step4 -->
												</div><!--end .tab-content -->
												<ul class="pager wizard">
													<li class="previous first"><a class="btn-raised" href="javascript:void(0);">第一步</a></li>
													<li class="previous"><a class="btn-raised" href="javascript:void(0);">上一步</a></li>
													<li class="next last"><a class="btn-raised" href="javascript:void(0);">最后一步</a></li>
													<li class="next"><a class="btn-raised" href="javascript:void(0);">下一步</a></li>
												</ul>
											</form>
										</div><!--end #rootwizard -->
									</div><!--end .card-body -->
								</div><!--end .card -->
								<em class="text-caption">家庭食物管理小站温馨提醒：其他家人可以通过家庭ID加入家庭</em>
							</div><!--end .col -->
						</div><!--end .row -->
						<!-- END VALIDATION FORM WIZARD -->
                        </div>

                     

					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="otherHead" runat="server">
  <title>创建家庭</title>
  <link type="text/css" rel="stylesheet" href="../../assets/css/theme-default/material-design-iconic-font.min.css?1421434286" />
  <link type="text/css" rel="stylesheet" href="../../assets/css/theme-default/libs/wizard/wizard.css?1425466601" />
         <script src="../../assets/js/libs/jquery/jquery-1.11.2.min.js"></script>
		<script src="../../assets/js/libs/jquery/jquery-migrate-1.2.1.min.js"></script>
		<script src="../../assets/js/libs/bootstrap/bootstrap.min.js"></script>
		<script src="../../assets/js/libs/spin.js/spin.min.js"></script>
		<script src="../../assets/js/libs/autosize/jquery.autosize.min.js"></script>
		<script src="../../assets/js/libs/nanoscroller/jquery.nanoscroller.min.js"></script>
		<script src="../../assets/js/libs/jquery-validation/dist/jquery.validate.min.js"></script>
		<script src="../../assets/js/libs/jquery-validation/dist/additional-methods.min.js"></script>
		<script src="../../assets/js/libs/wizard/jquery.bootstrap.wizard.min.js"></script>
		<script src="../../assets/js/core/source/App.js"></script>
		<script src="../../assets/js/core/source/AppNavigation.js"></script>
		<script src="../../assets/js/core/source/AppOffcanvas.js"></script>
		<script src="../../assets/js/core/source/AppCard.js"></script>
		<script src="../../assets/js/core/source/AppForm.js"></script>
		<script src="../../assets/js/core/source/AppNavSearch.js"></script>
		<script src="../../assets/js/core/source/AppVendor.js"></script>
		<script src="../../assets/js/core/demo/Demo.js"></script>
		<script src="../../assets/js/core/demo/DemoFormWizard.js"></script>
</asp:Content>
