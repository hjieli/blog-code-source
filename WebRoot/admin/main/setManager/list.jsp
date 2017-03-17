<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="col-lg-12">
	<div class="col-lg-12">
		<div class="panel panel-default border-raduis-none">
			<div class="panel-heading">
				网站设置
			</div>
			<div class="panel-body">
				<form id="data">
					<table class="layui-table">
						<colgroup>
							<col width="100">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<td>网站昵称</td>
								<td><input type="text" id="name" name="name" required  lay-verify="required" placeholder="输入网站昵称" autocomplete="off" class="layui-input" value="${set.sName }"></td>
							</tr>
							<tr>
								<td>网站作者</td>
								<td><input type="text" id="author" name="author" required  lay-verify="required" placeholder="输入网站作者" autocomplete="off" class="layui-input" value="${set.sAuthor }"></td>
							</tr>
							<tr>
								<td>关键字</td>
								<td><input type="text" id="keywords" name="keywords" required  lay-verify="required" placeholder="输入网站作者" autocomplete="off" class="layui-input" value="${set.sKeyword }"></td>
							</tr>
							<tr>
								<td>描述</td>
								<td><input type="text" id="descript" name="descript" required  lay-verify="required" placeholder="输入网站作者" autocomplete="off" class="layui-input" value="${set.sDescripte }"></td>
							</tr>
							<tr>
								<td>底部文字</td>
								<td><input type="text" id="bottomStr" name="bottomStr" required  lay-verify="required" placeholder="输入网站作者" autocomplete="off" class="layui-input" value="${set.sBottomstr }"></td>
							</tr>
						</tbody>
					</table>
				</form>
				<button id="updateBtn" type="button" class="btn btn-success border-raduis-none">保存修改</button>&nbsp;<span id="msg" style="color: red;"></span>
			</div>
		</div>
	</div>
</div>

<script>
	$("#updateBtn").click(function(){
		if($("#name").val()==""){
			layui.use('layer', function(){
				var layer = layui.layer;
				layer.msg('更新失败，网站昵称不能为空', {icon: 2}, {time: 5000});
			});
			return;
		}
		if($("#author").val()==""){
			layui.use('layer', function(){
				var layer = layui.layer;
				layer.msg('更新失败，网站作者不能为空', {icon: 2}, {time: 5000});
			});
			return;
		}
		if($("#bottomStr").val()==""){
			layui.use('layer', function(){
				var layer = layui.layer;
				layer.msg('更新失败！网站底部文字不能为空', {icon: 2}, {time: 5000});
			});
			return;
		}
		$("#msg").html("");
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/back/set/update.do",
	    	data: $("#data").serialize(),
			dataType:'json',
			cache: false,
			success: function(data){
				if("success"==data.result){
					layui.use('layer', function(){
						var layer = layui.layer;
						layer.msg('更新成功', {icon: 1}, {time: 2000});
						$("#topTitle").html($("#name").val()+" 后台管理");
					});    
				}else {
					//$("#msg").html(data.result);
					layui.use('layer', function(){
						var layer = layui.layer;
						layer.msg(data.result, {icon: 1}, {time: 2000});
					});   
				}
			}
		});
		
	});
</script>
