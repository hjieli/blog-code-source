<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="col-lg-12">
	<div class="col-lg-12">
		<div class="panel panel-default border-raduis-none">
			<div class="panel-heading">
				文章编辑
			</div>
			<div class="panel-body">
				
				<!-- 加载编辑器的容器 -->
				<script id="container" name="content" type="text/plain">
	 				这里写你的初始化内容
				</script>
				<!-- 配置文件 -->
				<script type="text/javascript" src="${pageContext.request.contextPath}/assets/ueditor/ueditor.config.js"></script>
				<!-- 编辑器源码文件 -->
				<script type="text/javascript" src="${pageContext.request.contextPath}/assets/ueditor/ueditor.all.js"></script>
				<!-- 实例化编辑器 -->
				<script type="text/javascript">
					var ue = UE.getEditor('container', {
					    toolbars: [
					        ['fullscreen', 'source', 'undo', 'redo', 'bold']
					    ],
					    autoHeightEnabled: true,
					    autoFloatEnabled: true,
					      //initialFrameWidth:1000,初始化编辑器宽度,默认1000
       				 	initialFrameHeight:320  //初始化编辑器高度,默认320
					});
				    var ue = UE.getEditor('container');
				    //,initialFrameWidth:1000  //初始化编辑器宽度,默认1000
       				 //,initialFrameHeight:320  //初始化编辑器高度,默认320
				</script>
				<br>
				<button type="button" class="btn btn-success border-raduis-none pull-right">提交</button>
			</div>
		</div>
	</div>
</div>

