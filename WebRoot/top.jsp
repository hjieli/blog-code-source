<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-lg-12 hidden-sm hidden-xs header">
    <form class="navbar-form navbar-right margin-right-20">
        <div class="form-group">
            <input type="text" class="form-control border-none" style="background-color: black; color: white;" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default border-none" style="background-color:black; color:white;">搜索</button>
    </form>
    <ul class="nav navbar-nav navbar-left margin-left-80">
        <li><a href="${pageContext.request.contextPath}/">首页</a></li>
        <li><a href="javascript:alert('正在编辑');">分类</a></li>
        <li><a href="javascript:alert('正在编辑');">项目</a></li>
        <li><a href="javascript:alert('正在编辑');">归档</a></li>
    </ul>
</div>