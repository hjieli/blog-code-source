<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="keywords" content="${set.sKeyword }">
		<meta name="description" content="${set.sDescripte }">
		<title>${set.sName }</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/layui/layui.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/layui/lay/modules/element.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/layui/css/layui.css" type="text/css"></link>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/sbadmin/vendor/jquery/jquery.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/leo-ui.css" type="text/css"></link>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/font-awesome-4.7.0/css/font-awesome.min.css" type="text/css"></link>
		<script type="text/javascript" src="http://www.runoob.com/try/bootstrap/twitter-bootstrap-v2/js/bootstrap-modal.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/ezmodal/src/ezmodal.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/ezmodal/src/ezmodal.min.css" type="text/css"></link>
	
	</head>

	<body>
		<div class="layui-layout-admin">
			<div class="layui-header layui-bg-black">
				<div class="layui-main">
					<a style="font-size: 20px; line-height: 55px;" id="topTitle">${set.sName } 后台管理</a>
				</div>
			</div>
			<div class="layui-side layui-bg-black">
				<ul class="layui-nav layui-nav-tree" id="larry-nav-side" lay-filter="demo">
					<!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
					<li class="layui-nav-item layui-nav-itemed">
						<a href="javascript:;">主菜单控制台</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" target="${pageContext.request.contextPath}/back/set/list.do">
									<i class="fa fa-gear">&nbsp;&nbsp;网站设置</i>
								</a>
							</dd>
							<dd>
								<a href="javascript:;" target="${pageContext.request.contextPath}/back/article/list.do">
									<i class="fa fa-file-text-o">&nbsp;&nbsp;文章管理</i>
								</a>
							</dd>
							<dd>
								<a href="javascript:;" target="${pageContext.request.contextPath}/back/project/list.do">
									<i class="fa fa-window-maximize">&nbsp;&nbsp;项目管理</i>
								</a>
							</dd>
							<dd>
								<a href="javascript:;" target="${pageContext.request.contextPath}/back/type/list.do">
									<i class="fa fa-th-list">&nbsp;&nbsp;类别管理</i>
								</a>
							</dd>
							<dd>
								<a href="javascript:;" target="${pageContext.request.contextPath}/back/tag/list.do">
									<i class="fa fa-tag">&nbsp;&nbsp;标签管理</i>
								</a>
							</dd>
							<dd>
								<a href="javascript:;"  target="${pageContext.request.contextPath}/back/link/list.do">
									<i class="fa fa-link">&nbsp;&nbsp;链接管理</i>
								</a>
							</dd>
							<dd>
								<a href="javascript:;" target="${pageContext.request.contextPath}/back/exit.do" id="exit">
									<i class="fa fa-power-off">&nbsp;&nbsp;退出系统</i>
								</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
			<div class="layui-body">
				<div class="layui-tab" lay-allowClose="true" lay-filter="demo">
					<!-- <ul class="layui-tab-title">
						<li class="layui-this fa fa-home" id="index"> &nbsp;首页</li>
					</ul> -->
					<div class="layui-tab-content">
						<div class="layui-tab-item layui-show">
								
						</div>
						
					</div>
				</div>
			</div>
			<div class="layui-footer">
				<p style="text-align: center; font-size: 18px !important; line-height: 40px; font-weight: normal !important;">
					${set.sBottomstr }
				</p>
			</div>
		</div>
		<script type="text/javascript">
			layui.use('element', function() {
				var element = layui.element();
				$.get("../admin/main/welcome.jsp", function(data) {
					 $(".layui-show").html(data);
					 $("#index").find("i").remove();
				});
				
				$(".layui-nav-child a").click(function(){
					var titleStr = $(this).html();
					var url = $(this).attr("target");
					$.get(url, function(data) {
						//alert(titleStr);
						if(titleStr.indexOf("退出系统")<=0){
							/* element.tabAdd('demo', {
								title: ""+titleStr
								,content: ""+data //支持传入html
							}); */
							$(".layui-show").html(data);
							element.init();
							$("#index").find("i").remove();
						}else{
							alert("退出系统");
							$(".layui-show").html(data);
						}
					});
				});
				
				
			});
			
			
			
		</script>
		
</body>
</html>
