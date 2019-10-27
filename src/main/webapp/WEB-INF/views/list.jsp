<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
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
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<td>${emp.empId }</td>
							<td>${emp.empName }</td>
							<td>${emp.gender=="M"?"男":"女" }</td>
							<td>${emp.email }</td>
							<td>${emp.department.deptName }</td>
							<td>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil"></span>&nbsp;编辑
								</button>
								<button class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash"></span>&nbsp;删除
								</button>
							</td>			
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 导航条 -->
		<div class="row">
			<div class="col-md-12 text-center">
				<nav aria-label="Page navigation">
					  <ul class="pagination">
					  <li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
					    <c:if test="${pageInfo.hasPreviousPage }">
						    <li>
						      <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
					    </c:if>
					    <c:if test="${!pageInfo.hasPreviousPage }">
						    <li class="disabled">
						      <span>
						        <span aria-hidden="true">&laquo;</span>
						      </span>
						    </li>
					    </c:if>
					    <c:forEach items="${pageInfo.navigatepageNums }" var="page_num">
					    	<c:if test="${page_num==pageInfo.pageNum }">
					    		<li class="active"><a href="#">${page_num }</a></li>
					    	</c:if>
					    	<c:if test="${page_num!=pageInfo.pageNum }">
							    <li><a href="${APP_PATH }/emps?pn=${page_num }">${page_num }</a></li>
					    	</c:if>
					    </c:forEach>
					    <li>
					      <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					    <li><a href="${APP_PATH }/emps?pn=${pageInfo.pages }">末页</a></li>
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