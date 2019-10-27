<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>员工列表</title>
	<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
	<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
		rel="stylesheet">
	<script type="text/javascript"
		src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>员工信息</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 col-md-offset-9">
				<button class="btn btn-primary">新增员工</button>
				<button class="btn btn-danger">批量删除</button>	
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>ID</th>
						<th>姓名</th>
						<th>性别</th>
						<th>邮箱</th>
						<th>部门</th>
						<th>操作</th>				
					</tr>
					<tr>
						<td>1</td>
						<td>qiang</td>
						<td>男</td>
						<td>qiang@126.com</td>
						<td>开发部</td>
						<td>
							<button class="btn btn-primary btn-sm">
								<span class="glyphicon glyphicon-pencil"></span>&nbsp;编辑
							</button>
							<button class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-trash"></span>&nbsp;删除
							</button>
						</td>			
					</tr>
				</table>
			</div>
		</div>
		<!-- 导航条 -->
		<div class="row">
			<div class="col-md-12 text-center">
				<nav aria-label="Page navigation">
					  <ul class="pagination">
					  <li><a href="#">首页</a></li>
					    <li>
					      <a href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li><a href="#">1</a></li>
					    <li><a href="#">2</a></li>
					    <li><a href="#">3</a></li>
					    <li><a href="#">4</a></li>
					    <li><a href="#">5</a></li>
					    <li>
					      <a href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					    <li><a href="#">末页</a></li>
					  </ul>
				</nav>
			</div>
		</div>
		<!-- 页码信息条 -->
		<div class="row">
			<div class="col-md-12 text-center">当前第5页，共21页，总计101条记录</div>
		</div>
	</div>
</body>
</html>