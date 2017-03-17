<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

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
                <p>网名：${set.sAuthor }</p>
                <p>职业：Java & .NET前后端开发工程师</p>
                <p>邮箱：2252487366@qq.com</p>
                <p>电话：18323987710</p>
                <p>网站：www.hjieli.com</p>
            </div>
        </div>

        <div class="col-lg-12">
            <div class="col-lg-8">

                <c:forEach items="${bloglist }" var ="blog">
					<div class="col-lg-12" >
						<div class="panel list-content">
							<div class="panel-heading">
								<a href="${pageContext.request.contextPath}/article/${blog.id }.do"><h4 style="color:black;">${blog.aTitle }</h4></a>
							</div>

							<div class="panel-body">
								${blog.aDescripte }   <br/>
								<span class="pull-right">
									<i class="fa fa-clock-o">&nbsp;&nbsp;2016-01-09 17:31</i>&nbsp;&nbsp;
									<i class="fa fa-eye">&nbsp;&nbsp;${blog.aViewnum }</i>&nbsp;&nbsp;
									<i class="fa fa-comments">&nbsp;&nbsp;770</i>&nbsp;&nbsp;
								</span>
							</div>
						</div>
					</div>
				</c:forEach>

                <div class="col-lg-12">
                    <div class="panel border-none">
                        <div class="panel-body">
                            <ul class="pager">
                                <!-- <li><a href="#">上一页</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">下一页</a></li> -->
                            </ul>
                            <ul class="pager">
                               <!--  <li>322条 共1页</li> -->
                            </ul>
                        </div>
                    </div>
                    
                </div>
                
            </div>
        </div>
    </div>
</div>