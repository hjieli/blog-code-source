<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<!-- jsp文件头和头部 -->
		<jsp:include page="head.do" />
	</head>
  
	<body>
		<div id="wrapper" style="background-color: white !important; ">
			<!-- 顶部 -->
			<jsp:include page="top.do" />
		 	<!-- 左侧 -->
		 	<%-- <%@ include file="left.jsp"%> --%>
		 	<!-- 底部文件 -->
			<div id="page-wrapper">
				<div class="col-lg-12 contain-bg">
				    <div style="width:1050px; margin:0 auto;">
				        <div class="col-lg-12">
				            <div class="col-lg-8 banner-img" >
				                <div id="myCarousel" class="carousel slide" style="height:100%;overflow:hidden">
				                    <!-- 轮播（Carousel）项目 -->
				                    <div class="carousel-inner">
				                        <div class="item active">
				                            <img src="${pageContext.request.contextPath}/assets/images/banner2.jpg" style="width: 100%"/>
				                        </div>
				                        <div class="item">
				                            <img src="${pageContext.request.contextPath}/assets/images/banner1.jpg" style="width: 100%"/>
				                        </div>
				                        <div class="item">
				                            <img src="${pageContext.request.contextPath}/assets/images/banner2.jpg" style="width: 100%"/>
				                        </div>
				                    </div>
				                    <!-- 轮播（Carousel）导航 -->
				                    <a class="carousel-control left" href="#myCarousel"
				                       data-slide="prev">
				                        
				                    </a>
				                    <a class="carousel-control right" href="#myCarousel"
				                       data-slide="next">
				                       
				                    </a>
				                </div>
				                
				            </div>
				            <div class="col-lg-4 card">
				                <h4>我的名片</h4>
				                <p>网名：Leo</p>
				                <p>职业：Java & .NET前后端开发工程师</p>
				                <p>邮箱：2252487366@qq.com</p>
				                <p>电话：18323987710</p>
				                <p>网站：www.hjieli.com</p>
				            </div>
				        </div>
				
				        <div class="col-lg-12 " style="margin-top:20px;">
				            <div class="col-lg-8">
								<div class="panel border-none">
									<div class="panel-heading">
										<h4 style="text-align:center;">${article.aTitle }</h4>
									</div>
									<div class="panel-body" style="height:auto !important;">
										<p style="text-align:center; border:dashed 1px #4b4b4b;">
											<i class="fa fa-clock-o">&nbsp;&nbsp;2016-01-09 17:31</i>&nbsp;&nbsp;
											<i class="fa fa-eye">&nbsp;&nbsp;${article.aViewnum }</i>&nbsp;&nbsp;
										</p>
										<p>
											${article.aContent }
										</p>
										<!-- UY BEGIN -->
										<div id="uyan_frame"></div>
										<script type="text/javascript" src="http://v2.uyan.cc/code/uyan.js?uid=2125669"></script>
										<!-- UY END -->
									</div>
								</div>
				            </div>
				        </div>
				    </div>
				</div>
			</div>
	 	</div>
	 	<jsp:include page="bottom.do" />
	</body>
</html>
