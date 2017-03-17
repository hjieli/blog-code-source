<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--footer-->

<div class="col-lg-12" style="background-color: black; border-top:solid 4px ">
    <div style="width:1020px; height:auto; margin:0 auto; color:#ebebeb">
        <h4>友情链接</h4>
        <ul class="friend-link">
        	<c:forEach items="${linklist }" var ="link">
				<li><a href="${link.lUrl }" target="_blank" alt="${link.lName }">${link.lName }</a></li>	
			</c:forEach>
            
            
        </ul>
        <br />
        <p style="margin-top:20px; padding-bottom:5px; text-align:center">${set.sBottomstr }</p>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap-3.3.7-dist/js/jquery-1.8.2.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
