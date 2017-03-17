<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/layui/laypage/skin/laypage.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/layui/laypage/laypage.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css" type="text/css"></link>
<div class="col-lg-12">
	<div class="col-lg-12">
		<div class="panel panel-default border-raduis-none">
			<div class="panel-heading">
				 项目管理 
			</div>
			<div class="panel-body">
				<button type="button" ezmodal-target="#example1" class="btn bg-color-2 border-raduis-none">添加项目</button>
				<div style="float:right;">
					<form id="dataLike">
						<lable>项目昵称：</lable>
						<input type="text" name="title" placeholder="请输入标题"
							value="${title }"> <a onclick="select_like()"
							class="btn btn-sm btn-success border-raduis-none ">查询</a>
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
							<td>项目昵称</td>
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

<div id="example1" class="ezmodal" ezmodal-width="900" >   <!-- 添加项目的弹出层 -->
	<div class="ezmodal-container" style="width:70%;">
		<div class="ezmodal-header" style="background-color: #eee; ">
			<div class="ezmodal-close" data-dismiss="ezmodal">x</div>
			添加项目
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
									<label for="name">项目昵称*</label>
									<input type="text" class="form-control border-raduis-none" id="title" name="title" placeholder="请输入项目昵称">
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label for="name">项目分类*</label>
									<select id="select" name="type" class="form-control border-raduis-none">
									</select>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label for="name">项目文件</label>
									<div class="form-group">
											<input id="file-0a" type="file">
										</form>
									</div>
								</div>
							</div>
							
	
						</div>
						<label for="name">项目内容*</label>
						<script id="container" name="content" type="text/plain">

					    </script>
						<br>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label for="name">项目标签*</label>
									<input type="text" class="form-control border-raduis-none"  id="tag" name="tag"  placeholder="请输入项目标签">
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
					//initialFrameWidth:1000,//初始化编辑器宽度,默认1000
					initialFrameHeight: 320 //初始化编辑器高度,默认320
				});
			</script>

			<script>
			var jsontype = ${jsontype};
			for(i=0;i<jsontype.length;i++){
			  document.getElementById("select").options[i]=new Option(jsontype[i].tName,jsontype[i].id);
			}
				$("#submitBtn").click(function() {
					$("#contentId").val(ue.getContent());
					var title=$("#title").val();
					var container=UE.getEditor('container').getContent();
					var tag=$("#tag").val();
					if(title==""){
					 alert("项目名称不能为空");
					 $("#title").focus();
					 return false;
					}else if(container==""){
					alert("项目内容不能为空"+container);
					 UE.getEditor('container').focus();
					 return false;
					}else if(tag==""){
					  alert("项目标签内容不能为空");
					  $("#tag").focus();
					  return false;
					}
					$.ajax({
						type: "POST",
						url: "${pageContext.request.contextPath}/back/project/add.do",
				    	data: $("#data").serialize(),
						dataType:'json',
						cache: false,
						success: function(data){
							if("success"==data.result){
								alert("添加成功！");
								$("#data")[0].reset();
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
				'	<td>' + data[i].pTime + '</td>' +
				'	<td>' + data[i].pName + '</td>' +
				'	<td>' + data[i].pAuthor + '</td>' +
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
			url : "${pageContext.request.contextPath}/back/project/del.do",
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
					$.get("${pageContext.request.contextPath}/back/project/edit_list.do?id="+id, function(data) {
						//alert(titleStr);
							$(".layui-show").html(data);
							element.init();
							$("#index").find("i").remove();
						
					});
	};
	
    function select_like(){    //查询搜索
      $.ajax({
      type : "POST",
      url : "${pageContext.request.contextPath}/back/project/select_like.do",
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
	/* layui.use('upload', function() {   
		layui.upload({
		  url:"${pageContext.request.contextPath}/back/project/file.do"
		  ,unwrap:true
		  ,success:function(res){
		   //console.log(res+'上传完毕');   //上传成功后返回值，必须为json格式
		   alert(res.result);
		  }
		});
	}); */
	
	/* 上传文件 */
	
	//初始化fileinput控件（第一次初始化）
	function initFileInput(ctrlName, uploadUrl) {
		var control = $('#' + ctrlName);

		control.fileinput({
			language : 'zh', //设置语言
			uploadUrl : uploadUrl, //上传的地址
			allowedFileExtensions : [ 'jpg', 'png', 'gif', 'zip'],//接收的文件后缀
			showUpload : false, //是否显示上传按钮
			showCaption : false,//是否显示标题
			browseClass : "btn btn-primary", //按钮样式             
			previewFileIcon : "<i class='glyphicon glyphicon-king'>上传图片</i>",
		});
	};
	
	//初始化fileinput控件（第一次初始化）
	initFileInput("file-0a", "${pageContext.request.contextPath}/back/project/file.do");
</script>


<script type="text/javascript" src="${pageContext.request.contextPath}/assets/ezmodal/src/ezmodal.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/ezmodal/src/ezmodal.min.css" type="text/css"></link>