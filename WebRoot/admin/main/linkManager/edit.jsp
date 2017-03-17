<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/js/fileinput.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/js/fileinput_locale_fr.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/js/fileinput_locale_es.js" type="text/javascript"></script>

<div class="col-lg-12">
	<div class="col-lg-12">
		<div class="panel panel-default border-raduis-none">
			<div class="panel-heading">
				友链修改
			</div>
			<div class="panel-body">
				<div class="row">
				<form id="data">
					<div class="col-lg-12">
						<div class="row">
						
							<div class="col-lg-12">
								<div class="form-group ">
								    <label for="name">友链URL</label>
								    <input type="text" class="form-control border-raduis-none" id="title" name="lUrl" placeholder="请输入友链URL" value="${list.lUrl }">
								    <input type="hidden" name="id" value="${list.id }">
									
									
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
								    <label for="name">友链名称</label>
								     <input type="text" class="form-control border-raduis-none" id="title" name="lName" placeholder="请输入友链名称" value="${list.lName }">
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label for="name">友链排序</label>
							    	<div class="form-group">
							    		<input type="text" class="form-control border-raduis-none" id="name" name="lSort" placeholder="请输入友链排序" value="${list.lSort }">
							    		<!-- <form enctype="multipart/form-data">
							                <input id="file-0a" class="file" type="file" multiple data-min-file-count="1" data-show-upload="false">
							                <br>
							                <button type="submit" class="btn btn-primary">上传图片</button>
							                <button type="reset" class="btn btn-default">取消</button>
							            </form> -->
					                </div> 
								</div>
							</div>
							
						</div>
						<!-- 加载编辑器的容器 -->
						<script id="container" name="content" type="text/plain">
	 						
						</script>
						<br>
						<!-- <div class="row">
							<div class="col-lg-12">
								<div class="form-group">
								    <label for="name">文章标签</label>
								    <input type="text" class="form-control border-raduis-none" id="name" placeholder="请输入文章标签">
								</div>
							</div>
						</div> -->
						<!-- <button onclick="location.href='javascript:history.go(-1);'" type="button" class="btn btn-success border-raduis-none pull-left">返回列表</button> -->
						<button id="submitBtn" type="button" class="btn btn-success border-raduis-none pull-right">确认修改</button>
						
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 配置文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/ueditor/ueditor.all.js"></script>

<!-- 实例化编辑器 -->
<script type="text/javascript">
	var ue = UE.getEditor('container', {
	    autoHeightEnabled: true,
	    autoFloatEnabled: true,
	    //initialFrameWidth:1000,初始化编辑器宽度,默认1000
   		initialFrameHeight:320  //初始化编辑器高度,默认320
	});
</script>


<script>
	
	$("#submitBtn").click(function(){
					$.ajax({
						type: "POST",
						url: "${pageContext.request.contextPath}/back/link/edit.do",
				    	data: $("#data").serialize(),
						dataType:'json',
						cache: false,
						success: function(data){
							if("success"==data.result){
								alert("修改成功！");
								var url="${pageContext.request.contextPath}/back/link/list.do";  //修改成功后跳转到此地址
								$.get(url,function(data){
								  $(".layui-show").html(data);
								});
								//window.location.href="${pageContext.request.contextPath}/back/project/list.do";
							}else {
								//$("#msg").html(data.result);
								alert("修改失败！");  
							}
						}
					});
	});
</script>