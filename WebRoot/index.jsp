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
				<jsp:include page="bloglist.do" />
			</div>
	 	</div>
	 	<jsp:include page="bottom.do" />
	</body>
</html>
