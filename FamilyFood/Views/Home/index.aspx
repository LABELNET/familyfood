<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
  <title>家庭食物管理小站</title>
   <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,600,900|Open+Sans+Condensed:300,300italic,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <script src="../../assets/js/prefixfree.min.js"></script>
       <style>
/* -- usable codes start -- */

html,
body,
div,
span,
object,
iframe,
h1,
h2,
h3,
h4,
h5,
h6,
p,
blockquote,
pre,
a,
abbr,
acronym,
address,
code,
del,
dfn,
em,
img,
q,
dl,
dt,
dd,
ol,
ul,
li,
fieldset,
form,
label,
legend,
table,
caption,
tbody,
tfoot,
thead,
tr,
th,
td,
article,
aside,
dialog,
figure,
footer,
header,
hgroup,
nav,
section {
    margin: 0;
    padding: 0;
    border: 0;
    font-weight: inherit;
    font-style: inherit;
    font-size: 100%;
    font-family: inherit;
    vertical-align: baseline;
    text-decoration: none;
    list-style: none;
}
img {
    width: 100%
}
.anim04c {
    -webkit-transition: all .4s cubic-bezier(.5, .35, .15, 1.4);
    transition: all .4s cubic-bezier(.5, .35, .15, 1.4);
}

html,
body {
    width: 100%;
    height: 100%;
    font-family: 'Source Sans Pro', sans-serif;
    background: #eee;
    color: #666;
}
body {
    overflow-x: hidden;
    overflow-y: auto;
}
/*-----*/

.outer {
    position: relative;
    top: 50%;
    z-index: 1;
    -webkit-transform: translateY(-50%);
    -moz-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    -o-transform: translateY(-50%);
    transform: translateY(-50%);
    cursor: pointer;
}
/*-----*/

.signboard {
    width: 100px;
    height: 100px;
    margin: auto;
    color: #fff;
    border-radius: 10px;
}
/*-----*/

.front {
    position: absolute;
    top: 0;
    left: 0;
    z-index: 3;
    background: #ff726b;
    text-align: center;
}
.right {
    position: absolute;
    right: : 0;
    z-index: 2;
    -webkit-transform: rotate(-10deg) translate(7px, 8px);
    -moz-transform: rotate(-10deg) translate(7px, 8px);
    -ms-transform: rotate(-10deg) translate(7px, 8px);
    -o-transform: rotate(-10deg) translate(7px, 8px);
    transform: rotate(-10deg) translate(7px, 8px);
    background: #EFC94C;
}
.left {
    position: absolute;
    left: 0;
    z-index: 1;
    -webkit-transform: rotate(5deg) translate(-4px, 4px);
    -moz-transform: rotate(5deg) translate(-4px, 4px);
    -ms-transform: rotate(5deg) translate(-4px, 4px);
    -o-transform: rotate(5deg) translate(-4px, 4px);
    transform: rotate(5deg) translate(-4px, 4px);
    background: #3498DB;
}
/*-----*/

.outer:hover .inner {
    -webkit-transform: rotate(0) translate(0);
    -moz-transform: rotate(0) translate(0);
    -ms-transform: rotate(0) translate(0);
    -o-transform: rotate(0) translate(0);
    transform: rotate(0) translate(0);
}
/*-----*/

.outer:active .inner {
    -webkit-transform: rotate(0) translate(0) scale(0.9);
    -moz-transform: rotate(0) translate(0) scale(0.9);
    -ms-transform: rotate(0) translate(0) scale(0.9);
    -o-transform: rotate(0) translate(0) scale(0.9);
    transform: rotate(0) translate(0) scale(0.9);
}
.outer:active .front .date {
    -webkit-transform: scale(2);
}
.outer:active .front .day,
.outer:active .front .month {
    visibility: hidden;
    opacity: 0;
    -webkit-transform: scale(0);
    -moz-transform: scale(0);
    -ms-transform: scale(0);
    -o-transform: scale(0);
    transform: scale(0);
}
.outer:active .right {
    -webkit-transform: rotate(-5deg) translateX(80px) scale(0.9);
    -moz-transform: rotate(-5deg) translateX(80px) scale(0.9);
    -ms-transform: rotate(-5deg) translateX(80px) scale(0.9);
    -o-transform: rotate(-5deg) translateX(80px) scale(0.9);
    transform: rotate(-5deg) translateX(80px) scale(0.9);
}
.outer:active .left {
    -webkit-transform: rotate(5deg) translateX(-80px) scale(0.9);
    -moz-transform: rotate(5deg) translateX(-80px) scale(0.9);
    -ms-transform: rotate(5deg) translateX(-80px) scale(0.9);
    -o-transform: rotate(5deg) translateX(-80px) scale(0.9);
    transform: rotate(5deg) translateX(-80px) scale(0.9);
}
/*-----*/

.outer:active .calendarMain {
    -webkit-transform: scale(1.8);
    opacity: 0;
    visibility: hidden;
}
.outer:active .clock {
    -webkit-transform: scale(1.4);
    opacity: 1;
    visibility: visible;
}
.outer:active .calendarNormal {
    bottom: -30px;
    opacity: 1;
    visibility: visible;
}
.outer:active .year {
    top: -30px;
    opacity: 1;
    visibility: visible;
    letter-spacing: 3px;
}
/*-----*/

.calendarMain {
    width: 100%;
    height: 100%;
    position: absolute;
    opacity: 1;
}
.month,
.day {
    font-size: 10px;
    line-height: 30px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 3px;
}
.date {
    font-size: 40px;
    line-height: 40px;
    font-weight: 300;
    text-transform: uppercase;
    letter-spacing: 3px;
}
/*-----*/

.clock {
    width: 100%;
    height: 100%;
    position: absolute;
    font-size: 40px;
    line-height: 100px;
    font-weight: 300;
    text-transform: uppercase;
    letter-spacing: 3px;
    text-align: center;
    opacity: 0;
    visibility: hidden;
}
/*-----*/

.year {
    width: 100%;
    position: absolute;
    top: 0;
    font-size: 14px;
    line-height: 30px;
    font-weight: 300;
    text-transform: uppercase;
    letter-spacing: 0;
    text-align: center;
    opacity: 0;
    visibility: hidden;
    color: #ff726b;
}
.calendarNormal {
    width: 100%;
    position: absolute;
    bottom: 0;
    font-size: 14px;
    line-height: 30px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 3px;
    text-align: center;
    opacity: 0;
    visibility: hidden;
}
.date2 {
    color: #ff726b;
}
.day2 {
    color: #3498DB;
}
.month2 {
    color: #EFC94C;
}
/* -- usable codes end -- */

/* -- unusable codes (text, logo, etc.) -- */

.info {
    width: 100%;
    height: 25%;
    position: absolute;
    top: 15%;
    text-align: center;
    opacity: 0;
}
.info li {
    width: 100%;
}
.hover,
.click,
.yeaa {
    font-size: 14px;
    line-height: 25px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 2px;
    text-align: center;
    bottom: 0;
    opacity: 1;
}
.dribbble {
    position: absolute;
    top: -60px;
    font-size: 14px;
    opacity: 0;
}
em {
    color: #ed4988;
}
.designer {
    width: 100%;
    height: 50%;
    position: absolute;
    bottom: 0;
    text-align: center;
    opacity: 0;
}
.designer li {
    width: 100%;
    position: absolute;
    bottom: 30%;
}
.designer a {
    width: 30px;
    height: 30px;
    display: block;
    position: relative;
    border-radius: 100%;
    margin: auto;
    color: rgba(46, 204, 113, 0.55);
}
.designer a:after {
    content: "see designs";
    position: absolute;
    top: 0;
    left: 40px;
    font-size: 14px;
    line-height: 33px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 2px;
    white-space: nowrap;
}
.designer a:hover:after {
    color: #2ecc71;
}
.designer img {
    display: block;
    border-radius: 100%;
}
body:hover .info,
body:hover .designer {
    opacity: 1;
}
::selection {
    background: transparent;
}
::-moz-selection {
    background: transparent;
}

</style>
   
    <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
  <script src="../../assets/js/index.js"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	         <div id="content">

				<!-- BEGIN BLANK SECTION -->
				<section>
					<div class="section-header">
						<ol class="breadcrumb">
							<li><a href="#">主页</a></li>
							<li class="active">家庭食物管理小站</li>
						</ol>
					</div><!--end .section-header -->
					<div class="section-botdy">
                      

                      <div class="row">

							<!-- BEGIN ALERT - REVENUE -->
							<div class="col-md-3 col-sm-6">
								<div class="card">
									<div class="card-body no-padding">
										<div class="alert alert-callout alert-info no-margin">
											<strong class="pull-right text-success text-lg">0.38% <i class="md md-trending-up"></i></strong>
											<strong class="text-xl">201kg</strong><br>
											<span class="opacity-50">食物总量</span>
										</div>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div><!--end .col -->
							<!-- END ALERT - REVENUE -->

							<!-- BEGIN ALERT - VISITS -->
							<div class="col-md-3 col-sm-6">
								<div class="card">
									<div class="card-body no-padding">
										<div class="alert alert-callout alert-warning no-margin">
											<strong class="pull-right text-warning text-lg">0.01% <i class="md md-swap-vert"></i></strong>
											<strong class="text-xl">21kg</strong><br>
											<span class="opacity-50">消耗的食物总量</span>
											<div class="stick-bottom-right">
												<div class="height-1 sparkline-visits" data-bar-color="#e5e6e6"><canvas width="228" height="40" style="display: inline-block; width: 228px; height: 40px; vertical-align: top;"></canvas></div>
											</div>
										</div>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div><!--end .col -->
							<!-- END ALERT - VISITS -->

							<!-- BEGIN ALERT - BOUNCE RATES -->
							<div class="col-md-3 col-sm-6">
								<div class="card">
									<div class="card-body no-padding">
										<div class="alert alert-callout alert-danger no-margin">
											<strong class="pull-right text-danger text-lg">0.18% <i class="md md-trending-down"></i></strong>
											<strong class="text-xl">180kg</strong><br>
											<span class="opacity-50">剩余的食物总量</span>
											<div class="stick-bottom-left-right">
												<div class="progress progress-hairline no-margin">
													<div class="progress-bar progress-bar-danger" style="width:43%"></div>
												</div>
											</div>
										</div>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div><!--end .col -->
							<!-- END ALERT - BOUNCE RATES -->

                            <div class="col-md-3 col-sm-6">
								<div class="card">
									<div class="card-body no-padding">
										<div class="alert alert-callout alert-success no-margin">
											<h1 class="pull-right text-success"><i class="md md-timer"></i></h1>
											<strong class="text-xl">8:45</strong><br>
											<span class="opacity-50">当前时间</span>
										</div>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div>

                            </div>


                      <div class="row">
                         <div class="card">
                                    <div class="card-head">
                                      <header>选择你今天要吃掉的食物与重量：</header>
                                    </div>
									<div class="card-body">
										<form class="form">
											<div class="form-group">
												<select id="select1" name="select1" class="form-control">
													<option value="30">花生</option>
													<option value="40">苹果</option>
												</select>
												<label for="select1">选择食物</label>
											</div>

                                            <div class="form-group">
												<select id="select2" name="select1" class="form-control">
													<option value="30">30</option>
													<option value="40">40</option>
													<option value="50">50</option>
													<option value="60">60</option>
													<option value="70">70</option>
												</select>
												<label for="select1">选择重量（kg）</label>
											</div>

                                            <div class="form-group">
                                              <button type="button" class="btn ink-reaction btn-raised btn-lg btn-primary">确定</button>
                                            </div>
										</form>
									</div><!--end .card-body -->
								</div>
                      </div>

                      <div class="row">
                         
                           <!-- BEGIN ALERT - TIME ON SITE -->
							<div class="col-md-6">
                            <div class="card">
                                    <h4 style="margin-left:20px;">当前时间</h4>
                                    <div class="signboard outer" style="margin-top:60px;">
                                                    <div class="signboard front inner anim04c">
                                                        <li class="year anim04c">
                                                            <span></span>
                                                        </li>
                                                        <ul class="calendarMain anim04c">
                                                            <li class="month anim04c">
                                                                <span></span>
                                                            </li>
                                                            <li class="date anim04c">
                                                                <span></span>
                                                            </li>
                                                            <li class="day anim04c">
                                                                <span></span>
                                                            </li>
                                                        </ul>
                                                        <li class="clock minute anim04c">
                                                            <span></span>
                                                        </li>
                                                        <li class="calendarNormal date2 anim04c">
                                                            <span></span>
                                                        </li>
                                                    </div>
                                                    <div class="signboard left inner anim04c">
                                                        <li class="clock hour anim04c">
                                                            <span></span>
                                                        </li>
                                                        <li class="calendarNormal day2 anim04c">
                                                            <span></span>
                                                        </li>
                                                    </div>
                                                    <div class="signboard right inner anim04c">
                                                        <li class="clock second anim04c">
                                                            <span></span>
                                                        </li>
                                                        <li class="calendarNormal month2 anim04c">
                                                            <span></span>
                                                        </li>
                                                    </div>
								</div><!--end .card -->
							</div> 
                           </div>


                            <div class="col-md-6">
								<div class="card">
									<div class="card-head">
										<div class="tools">
											<div class="btn-group">
												<div class="btn-group">
													<a href="#" class="btn btn-icon-toggle dropdown-toggle" data-toggle="dropdown"><i class="md md-colorize"></i></a>
												</div>
												<a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
												<a class="btn btn-icon-toggle btn-collapse"><i class="fa fa-angle-down"></i></a>
												<a class="btn btn-icon-toggle btn-close"><i class="md md-close"></i></a>
											</div>
										</div>
										<header>小站介绍</header>
									</div><!--end .card-head -->
									<div class="card-body style-primary">
										<p>食物管理小站是通过管理家庭及家庭成员，管理食物及食物搭配，为家庭成员提供优质的健康服务。
                                        该系统致力于以家庭为中心，以家庭食物管理为辅助，通过为家庭成员营造优质健康为行动。</p>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div>

                        
                      
                      </div>

                      <div class="row">
                      
                         <div class="col-md-6">
								<div class="card card-bordered style-primary">
									<div class="card-head">
										<div class="tools">
											<div class="btn-group">
												<div class="btn-group">
													<a href="#" class="btn btn-icon-toggle dropdown-toggle" data-toggle="dropdown"><i class="md md-colorize"></i></a>
												</div>
												<a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
												<a class="btn btn-icon-toggle btn-collapse"><i class="fa fa-angle-down"></i></a>
												<a class="btn btn-icon-toggle btn-close"><i class="md md-close"></i></a>
											</div>
										</div>
										<header><i class="fa fa-fw fa-tag"></i> 购买建议</header>
									</div><!--end .card-head -->
									<div class="card-body style-default-bright">
										<p>（1）根据你的健康，你需要购买 枸杞 2kg </p>
                                        <p>（2）根据你的健康，你需要购买 杏仁 1.5kg </p>
                                        <p>（3）根据你的食物搭配，你需要购买 西红柿 2.5kg </p>
                                        <p>（4）根据你的食物搭配，你需要购买 香蕉 4.5kg </p>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div>

                            <div class="col-md-6">
								<div class="card card-underline">
									<div class="card-head">
										<header>不新鲜的食物</header>
										<div class="tools">
											<div class="btn-group">
												<div class="btn-group">
													<a href="#" class="btn btn-icon-toggle dropdown-toggle" data-toggle="dropdown"><i class="md md-colorize"></i></a>
												</div>
												<a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
												<a class="btn btn-icon-toggle btn-collapse"><i class="fa fa-angle-down"></i></a>
												<a class="btn btn-icon-toggle btn-close"><i class="md md-close"></i></a>
											</div>
										</div>
									</div><!--end .card-head -->
									<div class="card-body">
										<p>（1）你于2016-05-20 12:00:01s时 购买的黄瓜，再不吃就不新鲜了。</p>
                                        <p>（2）你于2016-05-21 08:33:561时 购买的西红柿，再不吃就不新鲜了。</p>
                                        <p>（2）你于2016-05-21 13:51:36时 购买的菠萝，再不吃就不新鲜了。</p>
                                        <p>（2）你于2016-05-21 16:48:21时 购买的苹果，再不吃就不新鲜了。</p>
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div>
                      
                      </div>
                     

					</div><!--end .section-body -->
				</section>

				<!-- BEGIN BLANK SECTION -->
			</div><!--end #content-->
   

</asp:Content>
