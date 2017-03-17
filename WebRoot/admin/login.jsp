<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="Blog李豪杰">
	    <meta name="author" content="Leo">
	
	    <title>博客</title>
		
	    <!-- Bootstrap Core CSS -->
	    <link href="../assets/sbadmin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	    <!-- Custom CSS -->
	    <link href="../assets/sbadmin/dist/css/sb-admin-2.css" rel="stylesheet">

	 	<!--自定义css-->
	 	<link href="../assets/css/login.css" rel="stylesheet" type="text/css"/>
	 
	</head>
	<body>
        <!-- /.navbar-static-side -->
    	<div class="container">
	        <div class="row">
	            <div class="col-md-4 col-md-offset-4">
	                <div class="login-panel panel panel-default">
	                    <div class="panel-heading">
	                        <h3 class="panel-title">Blog Log In</h3>
	                    </div>
	                    <div class="panel-body">
	                        <form id="data">
	                            <fieldset>
	                                <div class="form-group">
	                                    <input class="form-control" placeholder="User Name" name="uname" id="uname" type="uname" autofocus>
	                                </div>
	                                <div class="form-group">
	                                    <input class="form-control" placeholder="Password" name="upwd" id="upwd" type="upwd" value="">
	                                </div>
	                                <div class="checkbox">
	                                    <label>
	                                        <input name="remember" type="checkbox" value="Remember Me">Remember Pwd
	                                        
	                                    </label>
	                                </div>
	                                <!-- Change this to a button or input when using this as a form -->
	                                <a id="loginBtn" class="btn btn-lg btn-success btn-block">Log In</a>
	                                <p id="msg" style="color:red;"></p>
	                            </fieldset>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
        <p style="text-align: center;">Copyright © 2017 - 李豪杰（Leo）</p>
	    <!-- /#wrapper -->
		
		<!-- jQuery -->
		<script src="../assets/sbadmin/vendor/jquery/jquery.min.js"></script>
		
	    <script>
	    	$("#loginBtn").click(function(){
	    		$.ajax({
					type: "POST",
					url: "${pageContext.request.contextPath}/back/login.do",
			    	data: $("#data").serialize(),
					dataType:'json',
					cache: false,
					success: function(data){
						if("success"==data.result){
							alert("登录成功!");
							window.location.href="${pageContext.request.contextPath}/back/index.do";
						}else {
							$("#msg").html(data.result);
						}
					}
				});
	    	});
	    	
	    	$(".form-group input").click(function(){
	    		if($("#msg").html()!=""){
	    			if($(this).val()!=""){
		    			$("#msg").html("");
		    		}
	    		}
	    	});
	    </script>
	</body>
</html>
