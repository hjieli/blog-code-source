<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/layui/laypage/skin/laypage.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/layui/laypage/laypage.js"></script>

<div class="col-lg-12">
	<div class="col-lg-12">
		<div class="panel panel-default border-raduis-none">
			<div class="panel-heading">
				友链管理
			</div>
			<div class="panel-body">
				<button type="button" ezmodal-target="#example1" class="btn bg-color-2 border-raduis-none">添加友情链接</button>
				<table class="layui-table" style="text-align: center;">
					<colgroup>
						<col width="70">
						<col width="200">
						<col width="90">
						<col width="90">
						
						<col width="90">
					</colgroup>
					<thead>
						<tr>
							<td>序号</td>
							<td>url地址</td>
							<td>名称</td>
							<td>排序</td>
							
							<td>操作</td>
						</tr>
					</thead>
					<tbody id="biuuu_city_list">
						
					</tbody>
				</table>
				<div id="biuuu_city" class="pagination pull-right"></div>
				
			</div>
		</div>
	</div>

</div>

<div id="example1" class="ezmodal" ezmodal-width="900" >
	<div class="ezmodal-container" style="width:70%;">
		<div class="ezmodal-header" style="background-color: #eee; ">
			<div class="ezmodal-close" data-dismiss="ezmodal">x</div>
			添加友情链接
		</div>
		<div class="ezmodal-content" style="height:450px; overflow: auto;">

			<link href="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/js/fileinput.js" type="text/javascript"></script>
			<script src="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/js/fileinput_locale_fr.js" type="text/javascript"></script>
			<script src="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/js/fileinput_locale_es.js" type="text/javascript"></script>

			<div class="row">
				<form id="data">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label for="name">链接url</label>
									<input type="text" class="form-control border-raduis-none" id="title" name="lUrl" placeholder="请输入链接url">
								</div>
							</div>
							
							<div class="col-lg-12">
								<div class="form-group">
									<label for="name">链接名称</label>
									<input type="text" class="form-control border-raduis-none" id="title" name="lName" placeholder="请输入链接名称">
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label for="name">链接排名</label>
									<input type="text" class="form-control border-raduis-none" id="title" name="lSort" placeholder="请输入链接排名">
								</div>
							</div>
							
	
						</div>
						<!-- 加载编辑器的容器 -->
					 <!-- <script id="container" name="content" type="text/plain">

					</script>  -->
						
						<input type="text" name="content" id="contentId" hidden="true">
						<button id="submitBtn" type="button" class="btn btn-success border-raduis-none pull-right">确认添加</button>
					</div>
				</form>
			</div>

			<!-- 配置文件 -->
			<script type="text/javascript" src="${pageContext.request.contextPath}/assets/ueditor/ueditor.config.js"></script>
			<!-- 编辑器源码文件 -->
			<script type="text/javascript" src="${pageContext.request.contextPath}/assets/ueditor/ueditor.all.js"></script>

			<!-- 实例化编辑器 -->
			<!--  <script type="text/javascript">
				 var ue = UE.getEditor('container', {
					autoHeightEnabled: true,
					autoFloatEnabled: true,
					//initialFrameWidth:1000,//初始化编辑器宽度,默认1000
					initialFrameHeight: 320 //初始化编辑器高度,默认320
				}); 
			</script>  -->

			<script>
				$("#submitBtn").click(function() {
					/* $("#contentId").val(ue.getContent()); */
					//alert($("#contentId").val()+"--");
					$.ajax({
						type: "POST",
						url: "${pageContext.request.contextPath}/back/link/add.do",
				    	data: $("#data").serialize(),
						dataType:'json',
						cache: false,
						success: function(data){
							if("success"==data.result){
								alert("添加成功！");
							}else {
								//$("#msg").html(data.result);
								alert("添加失败！");  
							}
						}
					});
				});
				
			</script>
		</div>
		
		<div class="ezmodal-footer">
           <!-- <button type="button" class="btn" data-dismiss="ezmodal">Fechar</button> -->
		</div>
	</div>
</div>
<script>
	
	var data = ${jsondata};
	//alert(data.length);
	var nums = 5; //每页出现的数量
	
	var pages = Math.ceil(data.length / nums); //得到总页数
	
	var thisDate = function(curr) {
		//此处只是演示，实际场景通常是返回已经当前页已经分组好的数据
		var str = '',
			last = curr * nums - 1;
		last = last >= data.length ? (data.length - 1) : last;
		for(var i = (curr * nums - nums); i <= last; i++) {
			str += '<tr id="h">' +
				'	<td>' + data[i].id + '</td>' +
				'	<td>' + data[i].lUrl + '</td>' +
				'	<td>' + data[i].lName + '</td>' +
				'	<td>' + data[i].lSort + '</td>' +
				'	<td>' +
				'		<div class="btn-group">' +
				'		  <a href="javascript:;" onclick="edit('+data[i].id+')" class="btn btn-success border-raduis-none ">编辑</a>' +
				'		  <button type="button" onclick="delete2('+data[i].id+',this)" class="btn btn-danger border-raduis-none">删除</button>' +
				'		</div>' +
				'	</td>' +
				'</tr>';
		}
		return str;
	};
	
	//调用分页
	laypage({
		cont: 'biuuu_city',
		pages: pages,
		skip: true, //是否开启跳页
		groups: 3,
		jump: function(obj) {
			document.getElementById('biuuu_city_list').innerHTML = thisDate(obj.curr);
			
		}
	})
	
	function edit(id) {
		$.get("${pageContext.request.contextPath}/back/link/edit_list.do?id="+id, function(data) {
		//alert(titleStr);
		$(".layui-show").html(data);
		element.init();
		$("#index").find("i").remove();		
		});
	};
	
	function delete2(id,k) {
	alert("aa");
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/back/link/del.do",
			data : {id:id},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if ("success" == data.result) {
					alert("删除成功！");
					k.closest("#h").remove();
				} else {
					//$("#msg").html(data.result);
					alert("删除失败！");
				}
			}
		});
	};
	
</script>



<script type="text/javascript" src="${pageContext.request.contextPath}/assets/ezmodal/src/ezmodal.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/ezmodal/src/ezmodal.min.css" type="text/css"></link>