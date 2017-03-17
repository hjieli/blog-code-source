<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/js/fileinput.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/js/fileinput_locale_fr.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/js/fileinput_locale_es.js" type="text/javascript"></script>

<div class="col-lg-12">
	<div class="col-lg-12">
		<div class="panel panel-default border-raduis-none">
			<div class="panel-heading">
				文章修改
			</div>
			<div class="panel-body">
				<div class="row">
				<c:forEach var="x" items="${list }">
				<form id="data1">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group ">
								    <label for="name">文章标题</label>
								    <input type="hidden" name="id" value="${x.id }">
								    <input type="text" class="form-control border-raduis-none" id="name" name="title" placeholder="请输入文章标题" value="${x.aTitle }">
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
								    <label for="name">文章分类</label>
									  <select id="select" name="interest" class="form-control border-raduis-none">
								      </select>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
								    <label for="name">文章描述</label>
								     <textarea class="form-control border-raduis-none"  name="descripte" rows="3">${x.aDescripte }</textarea>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label for="name">文章封面</label>
							    	<div class="form-group">
							    		
							    		<form enctype="multipart/form-data">
							                <input id="file-0a" class="file" type="file" multiple data-min-file-count="1" data-show-upload="false">
							                <br>
							                <button type="submit" class="btn btn-primary">上传图片</button>
							                <button type="reset" class="btn btn-default">取消</button>
							            </form>
					                </div> 
								</div>
							</div>
							<%-- <div class="col-lg-12">
								<div class="form-group">
								    <label for="name">文章标签</label>
								    <input type="text" class="form-control border-raduis-none" id="name" name="tags" placeholder="请输入文章标签" value="${x.aTags }">
								</div>
							</div> --%>
							
						</div>
						<!-- 加载编辑器的容器 -->
						<script id="container1" name="content" type="text/plain">
	 						${x.aContent}
						</script>
						<br>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
								    <label for="name">文章标签</label>
								    <input type="text" class="form-control border-raduis-none" id="name" name="tags" placeholder="请输入文章标签" value="${x.aTags }">
								</div>
							</div>
						</div>
						
						<button id="submitBtn1" type="button" class="btn btn-success border-raduis-none pull-right">确认修改</button>
					</div>
					</form>
					</c:forEach>
				</div>
				
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
	var ue = UE.getEditor('container1', {
	    autoHeightEnabled: true,
	    autoFloatEnabled: true,
	    //initialFrameWidth:1000,初始化编辑器宽度,默认1000
   		initialFrameHeight:320  //初始化编辑器高度,默认320
	});
</script>


<script>
var str = ${str};
var jsontype = ${jsontype};
			for(i=0;i<jsontype.length;i++){
			    document.getElementById("select").options[i]=new Option(jsontype[i].tName,jsontype[i].id);
			  if(jsontype[i].id==str){
			    document.getElementById("select").options[i].selected=true;
			 }
			}
	$("#submitBtn1").click(function() {
					$("#contentId1").val(ue.getContent());
					//alert($("#contentId").val()+"--");
					$.ajax({
						type: "POST",
						url: "${pageContext.request.contextPath}/back/article/edit.do",
				    	data: $("#data1").serialize(),
						dataType:'json',
						cache: false,
						success: function(data){
							if("success"==data.result){
								alert("修改成功！");
								var url="${pageContext.request.contextPath}/back/article/list.do";  //修改成功后跳转到此地址
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