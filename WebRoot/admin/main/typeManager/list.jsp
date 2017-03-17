<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/layui/laypage/skin/laypage.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/layui/laypage/laypage.js"></script>
<div class="col-lg-12">
	<div class="col-lg-12">
		<div class="panel panel-default border-raduis-none">
			<div class="panel-heading">
				分类管理
			</div>
			<div class="panel-body">
				<button type="button" onclick="add()" class="btn bg-color-2 border-raduis-none">添加类别</button>
				<table class="layui-table" style="text-align: center;">
					<colgroup>
						<col width="70">
						<col>
						<col width="150">
						
					</colgroup>
					<thead>
						<tr>
							<td>序号</td>
							<td>类别昵称</td>
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
				'	<td>' + data[i].tName + '</td>' +
				'	<td>' +
				'		<div class="btn-group">' +
				'		  <a href="javascript:;" onclick="edit('+data[i].id+')" class="btn btn-success border-raduis-none ">编辑</a>' +
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
	
	
	function add() {
		layui.use('layer', function() {
			layer.open({
              type: 1, 
              area: ['500px', '150px'],
             title:'添加类别',
  content: '<form id="data"><table class="layui-table" lay-even lay-skin="nob"><colgroup><col width="100"><col><col width="100"></colgroup><tr><td>分类名称：</td><td><input type="type" name="name" required  lay-verify="required" placeholder="请输入分类名称" autocomplete="off" class="layui-input"/ ></td><td><button type="button" id="submitBtn" onclick="add1()" class="layui-btn">确认添加</button></td></tr></table></from>' //这里content是一个普通的String
});
		});
	}
     
    function add1(){
      if(confirm('你确定要添加吗？')){
      var str=$(".layui-input").val();
      if(str=="" || str==null){
       alert("分类名称不能为空！");
      }else{
          $.ajax({
        type : "POST",
         url : "${pageContext.request.contextPath}/back/type/add.do",
        data : $("#data").serialize(),
    dataType : 'json',
       cache : false,
     success : function(data){
         if("success"==data.result){
            alert("添加成功");
            $("#data")[0].reset();
         }else{
            alert("添加失败");
         }
        }
        });
      }
       
      };
    };
    
	function del(id, k) {
		if (confirm('确定要删除吗？')) {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/back/type/del.do",
				data : {
					id : id
				},
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
	$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/back/type/edit_list.do",
				data : {id : id},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
					var id1=data.id;
						layui.use('layer', function() {
			layer.open({
              type: 1, 
              area: ['500px', '150px'],
             title:'编辑类别',
  content: '<form id="data1"><table class="layui-table" lay-even lay-skin="nob"><colgroup><col width="100"><col><col width="100"></colgroup><tr><td>分类名称：</td><td><input type="type" name="name" required  lay-verify="required" placeholder="请输入分类名称" autocomplete="off" class="layui-input"/ value="'+id1+'"></td><td><button type="button" id="submitBtn" onclick="edit1('+id+')" class="layui-btn">确认修改</button></td></tr></table></from>' //这里content是一个普通的String
});
		});
					} else {
						//$("#msg").html(data.result);
						alert("编辑失败！");
					}
					
				}
			});
	};
		function edit1(id){
	 $.ajax({
	   type : "POST",
	    url : "${pageContext.request.contextPath}/back/type/edit.do?id="+id,
	   data : $("#data1").serialize(),
   dataType : 'json',
	  cache : false,
	success : function(data){
	     if("success"==data.result){
	       alert("修改成功！");
	     }else{
	        alert("修改失败！");
	     }
	   }
	 });
	};
</script>