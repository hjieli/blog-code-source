<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/layui/laypage/skin/laypage.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/layui/laypage/laypage.js"></script>

<div class="col-lg-12">
	<div class="col-lg-12">
		<div class="panel panel-default border-raduis-none">
			<div class="panel-heading">
				文章管理
			</div>
			<div class="panel-body">
				<button type="button" ezmodal-target="#example1" class="btn bg-color-2 border-raduis-none">添加文章</button>
				<div style="float:right;">
					<form id="dataLike">
						<lable>项目昵称：</lable>
						<input type="text" name="title" placeholder="请输入标题" value="${title }"> 
						<a onclick="select_like()" class="btn btn-sm btn-success border-raduis-none ">查询</a>
					</form>
				</div>
				<table class="layui-table" style="text-align: center;">
					<colgroup>
						<col width="70">
						<col width="200">
						<col>
						<col width="150">
						<col width="150">

					</colgroup>
					<thead>
						<tr>
							<td>序号</td>
							<td>时间</td>
							<td>标题</td>
							<td>作者</td>
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
			添加文章
		</div>
		<div class="ezmodal-content" style="height:450px; overflow: auto;">

			<link href="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/js/fileinput.js" type="text/javascript"></script>
			<script src="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/js/fileinput_locale_fr.js" type="text/javascript"></script>
			<script src="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/js/fileinput_locale_es.js" type="text/javascript"></script>
            <script src="${pageContext.request.contextPath}/assets/bootstrap-fileinput-master/js/locales/zh.js" type="text/javascript"></script>
			<div class="row">
				<form id="data">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label for="name">文章标题</label>
									<input type="text" class="form-control border-raduis-none" id="title" name="title" placeholder="请输入文章标题">
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label for="name">文章分类</label>
									<select id="select" name="type" class="form-control border-raduis-none">
									</select>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label for="name">文章描述</label>
									<textarea class="form-control border-raduis-none" rows="3" name="descript"></textarea>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label for="name">文章封面</label>
									<div class="form-group">
	
										<form enctype="multipart/form-data">
											<input id="file-0a" class="file" type="file" multiple data-min-file-count="1" data-show-upload="false">
											<br>
											<!-- <button type="submit" class="btn btn-primary">上传图片</button>
											<button type="reset" class="btn btn-default">取消</button> -->
										</form>
									</div>
								</div>
							</div>
							
	
						</div>
						<!-- 加载编辑器的容器 -->
						<script id="container" name="content" type="text/plain">

					</script>
						<br>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label for="name">文章标签</label>
									<input type="text" class="form-control border-raduis-none"  id="tag" name="tag"  placeholder="请输入文章标签">
								</div>
							</div>
						</div>
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
			<script type="text/javascript">
				var ue = UE.getEditor('container', {
					autoHeightEnabled: true,
					autoFloatEnabled: true,
					//initialFrameWidth:1000,初始化编辑器宽度,默认1000
					initialFrameHeight: 320 //初始化编辑器高度,默认320
				});
			</script>

			<script>
			var jsontype = ${jsonType};
			for(i=0;i<jsontype.length;i++){
			  document.getElementById("select").options[i]=new Option(jsontype[i].tName,jsontype[i].id);
			}
				$("#submitBtn").click(function() {
					$("#contentId").val(ue.getContent());
					//alert($("#contentId").val()+"--");
					$.ajax({
						type: "POST",
						url: "${pageContext.request.contextPath}/back/article/add.do",
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
			str += '<tr id="hu">' +
				'	<td>' + data[i].id + '</td>' +
				'	<td>' + data[i].aDatetime + '</td>' +
				'	<td>' + data[i].aTitle + '</td>' +
				'	<td>Leo</td>' +
				'	<td>' +
				'		<div class="btn-group">' +
				'		  <button type="button" onclick="edit('+data[i].id+')" class="btn btn-success border-raduis-none ">编辑</button>' +
				'		  <button type="button" onclick="del('+data[i].id+',this)" class="btn btn-danger border-raduis-none">删除</button>' +
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
	});
	
	function del(id,k) {
	if(confirm('你确定要删除吗？')){
	 $.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/back/article/del.do",
			data : {id:id},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if ("success" == data.result) {
					alert("删除成功！");
					k.closest("#hu").remove();
				} else {
					//$("#msg").html(data.result);
					alert("删除失败！");
				}
			}
		});
	}
	};
	
	function edit(id) {
		$.get(
				"${pageContext.request.contextPath}/back/article/edit_list.do?id="
						+ id, function(data) {
					//alert(titleStr);
					$(".layui-show").html(data);
					element.init();
					$("#index").find("i").remove();

				});
	};
	
	 function select_like(){    //查询搜索
      $.ajax({
      type : "POST",
      url : "${pageContext.request.contextPath}/back/article/select_like.do",
      data : $("#dataLike").serialize(),
      //dataType : 'json',
      cache : false,
      success : function(data){
              $(".layui-show").html(data);
			  element.init();
			  $("#index").find("i").remove();
      }
      });
    };
	
	/* 上传文件 */
	
	//初始化fileinput控件（第一次初始化）
	function initFileInput(ctrlName, uploadUrl) {
		var control = $('#' + ctrlName);

		control.fileinput({
			language : 'zh', //设置语言
			uploadUrl : uploadUrl, //上传的地址
			//allowedPreviewTypes : [ 'image' ],   //上传文件类型
			maxFileCount: 1,  //上传文件数量
			allowedFileExtensions : [ 'jpg', 'png', 'gif' ],//接收的文件后缀
			showUpload : true, //是否显示上传按钮
			showCaption : false,//是否显示标题
			browseClass : "btn btn-primary", //按钮样式             
			maxFileSize : 2000,
		});
	};
	
	//初始化fileinput控件（第一次初始化）
	initFileInput("file-0a", "${pageContext.request.contextPath}/back/project/file.do");
</script>



<script type="text/javascript" src="${pageContext.request.contextPath}/assets/ezmodal/src/ezmodal.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/ezmodal/src/ezmodal.min.css" type="text/css"></link>