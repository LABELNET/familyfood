<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript">

    function sure() {
        var va = getValues();
        console.log(va);
        $.ajax({
            type: 'POST',
            url: '/food/FoodDapeiPageAddRequest',
            data: { "dp": va },
            dataType: 'json',
            success: function (data) {
                if (data == 1) {
                    window.location = "/food/FoodDapeiPage";
                } else {
                    window.location = "/food/FoodDapeiPageAdd";
                }
                console.log(data);
            }

        });
    }

   

   function getValues() {

       var arr = "[";
       for (var i = 0; i < 9; i++) {
           var v1 = $("form input")[i].value;
           if (v1.trim().length > 0) {
               arr += v1+",";
           }
       }
       arr=arr.substr(0, arr.length - 1);
       arr += "]";
       return arr;
   }

</script>

  <div id="content">


				<!-- BEGIN BLANK SECTION -->
				<section>
					<div class="section-header">
						<ol class="breadcrumb">
							<li><a href="#">食物</a></li>
							<li class="active">添加食物搭配</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-body">
                      
                        <div class="row">
							<div class="col-lg-12">
								<h4>构建食物搭配</h4>
							</div><!--end .col -->
							<div class="col-lg-3 col-md-4">
								<article class="margin-bottom-xxl">
									<p>
                                       家庭食物管理小站温馨提醒：家庭成员都可以构建食物搭配，通过食物搭配可以给你推荐出更好地购买的建议哦！
                                       <code> 最多构建 8 项食物搭配内容，并非 8项 ，而是最多8项食物 </code>
									</p>
								</article>
							</div><!--end .col -->
							<div class="col-lg-offset-1 col-md-8">
								<div class="card">
									<div class="card-head style-primary">
										<header>构建食物搭配</header>
									</div>
									<div class="card-body">
										<form class="dropzone dz-clickable" id="my-awesome-dropzone">
											<div class="dz-message">
												  
                                             <div class="form-group has-warning">
                                             <label>第一项食物</label>
												<input type="text" class="form-control" id="success7">
											</div>

                                            <div class="form-group has-success">
                                            <label>第二项食物</label>
												<input type="text" class="form-control" id="Text1">
												
											</div>

                                            <div class="form-group has-error">
                                            <label>第三项食物</label>
												<input type="text" class="form-control" id="Text2">
												
											</div>

                                            <div class="form-group has-success">
                                            <label >第四项食物</label>
												<input type="text" class="form-control" id="Text3">
											</div>

                                            <div class="form-group has-error">
                                            <label>第五项食物</label>
												<input type="text" class="form-control" id="Text4">
											</div>

                                            <div class="form-group has-warning">
                                            <label>第六项食物</label>
												<input type="text" class="form-control" id="Text5">
											</div>

                                             <div class="form-group has-success">
                                             <label>第七项食物</label>
												<input type="text" class="form-control" id="Text6">
												
											</div>

                                              <div class="form-group has-error">
                                                <label >第八项食物</label>
												<input type="text" class="form-control" id="Text7">
											</div>

                                            <div class="form-group has-success">
											</div>

											</div>

                                            <button type="button" onclick="sure()" class="btn btn-block ink-reaction btn-primary">确认构建</button>

										</form>
									</div><!--end .card-body -->
								</div><!--end .card -->
								<em class="text-caption"> 家庭食物管理小站温馨提醒:好好构建，<code>最多添加　8　项食物哦</code> </em>
							</div><!--end .col -->
						</div>

					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
   <title>添加食物搭配</title>
</asp:Content>
