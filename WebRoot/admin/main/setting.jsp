<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="col-lg-12">
	<div class="col-lg-12">
		<div class="panel panel-default border-raduis-none">
			<div class="panel-heading">
				网站设置
			</div>
			<div class="panel-body">
				<table class="layui-table">
					<colgroup>
						<col width="100">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td>网站昵称</td>
							<td><input type="text" name="title" required  lay-verify="required" placeholder="输入网站昵称" autocomplete="off" class="layui-input" value="Blog's Leo"></td>
						</tr>
						<tr>
							<td>网站作者</td>
							<td><input type="text" name="title" required  lay-verify="required" placeholder="输入网站作者" autocomplete="off" class="layui-input" value="Leo"></td>
						</tr>
						<tr>
							<td>关键字</td>
							<td><input type="text" name="title" required  lay-verify="required" placeholder="输入网站作者" autocomplete="off" class="layui-input" value="Blog,Java技术"></td>
						</tr>
						<tr>
							<td>描述</td>
							<td><input type="text" name="title" required  lay-verify="required" placeholder="输入网站作者" autocomplete="off" class="layui-input" value="Blog,Java技术,Java技术开发"></td>
						</tr>
					</tbody>
				</table>
				
					<button type="button" class="btn bg-color-2 border-raduis-none">保存修改</button>
			</div>
		</div>
	</div>
</div>
