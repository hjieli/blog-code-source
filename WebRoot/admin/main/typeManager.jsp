<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="col-lg-12">
	<div class="col-lg-12">
		<div class="panel panel-default border-raduis-none">
			<div class="panel-heading">
				分类管理
			</div>
			<div class="panel-body">
				<button type="button" class="btn bg-color-2 border-raduis-none">添加类别</button>
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
					<tbody>
						<tr>
							<td>1</td>
							<td>Java</td>
							<td>
								<div class="btn-group">
								  <button type="button" class="btn btn-success border-raduis-none ">编辑</button>
								  <button type="button" class="btn btn-danger border-raduis-none">删除</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>C#</td>
							<td>
								<div class="btn-group">
								  <button type="button" class="btn btn-success border-raduis-none">编辑</button>
								  <button type="button" class="btn btn-danger border-raduis-none">删除</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Python</td>
							<td>
								<div class="btn-group">
								  <button type="button" class="btn btn-success border-raduis-none">编辑</button>
								  <button type="button" class="btn btn-danger border-raduis-none">删除</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Golang</td>
							<td>
								<div class="btn-group">
								  <button type="button" class="btn btn-success border-raduis-none">编辑</button>
								  <button type="button" class="btn btn-danger border-raduis-none">删除</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>jQuery</td>
							<td>
								<div class="btn-group">
								  <button type="button" class="btn btn-success border-raduis-none">编辑</button>
								  <button type="button" class="btn btn-danger border-raduis-none">删除</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<ul class="pagination pull-right">
				    <li><a href="#">上一页</a></li>
				    <li class="active"><a href="#">1</a></li>
				    <li class="disabled"><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				     <li><a href="#">...</a></li>
				    <li><a href="#">下一页;</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>