<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<!-- jQuery -->
<script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<!-- Bootstrap -->
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<td>#</td>
						<td>姓名</td>
						<td>性别</td>
						<td>邮箱</td>
						<td>所属部门</td>
						<td>操作</td>
					</tr>
					<c:forEach items="${pageInfo.list}" var="emp">
					
						<tr>
							<td>${emp.empId}</td>
							<td>${emp.empName}</td>
							<td>${emp.gender}</td>
							<td>${emp.email}</td>
							<td>${emp.department.deptName}</td>
							<td>
								<button class="btn btn-primary btn-sm">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								新增</button>
								<button class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								删除</button>
							</td>
						</tr>
					
					</c:forEach>
					
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				当前${pageInfo.pageNum }页，总${pageInfo.pages }页，总${pageInfo.total}条记录
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	
				  	<li>
				      <a href="${APP_PATH }/emps?pn=1" aria-label="Previous">首页</a>
				    </li>
				  
				  	<c:if test="${pageInfo.hasPreviousPage }">
				  	<li>
						<a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
				    </li>
				  	</c:if>
				  	
				    
				    <c:forEach items="${pageInfo.navigatepageNums}" var="num">
				    	<c:if test="${pageInfo.pageNum == num}">
				    		<li class="active"><a href="#">${num }</a></li>
				    	</c:if>
				    	<c:if test="${pageInfo.pageNum != num}">
				    		<li><a href="${APP_PATH }/emps?pn=${num}">${num }</a></li>
				    	</c:if>
				    </c:forEach>
				    
				    <c:if test="${pageInfo.hasNextPage }">
				    <li>
				      <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				    </c:if>
				    
				    <li>
				      <a href="${APP_PATH }/emps?pn=${pageInfo.pages}" aria-label="Next">末页</a>
				    </li>
				  </ul>
				</nav>
			</div>
			
		</div>
	</div>
</body>
</html>