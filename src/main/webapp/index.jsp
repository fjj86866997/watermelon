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
				<button class="btn btn-primary" id="btn_emp_add" data-toggle="modal">新增</button>
				<button class="btn btn-danger" id="btn_delEmps">删除</button>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
					<tr>
						<td><input type="checkbox" id="checkAll" /></td>
						<td>#</td>
						<td>姓名</td>
						<td>性别</td>
						<td>邮箱</td>
						<td>所属部门</td>
						<td>操作</td>
					</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6" id="page_info">
				
			</div>
			<div class="col-md-6" id="page_nav">
				
			</div>
			
		</div>
		
	</div>
	<!-- 员工修改Modal -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="">员工修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	          <div class="form-group">
			    <label for="empName_add"  class="col-sm-2 control-label">员工姓名</label>
			    <div class="col-sm-10">
			      <input type="text" name="empName" class="form-control" id="empName_Update" >
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="email_add"  class="col-sm-2 control-label">Email</label>
			    <div class="col-sm-10">
			      <input type="email" name="email" class="form-control" id="email_Update" >
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			  	<label for="email_add" class="col-sm-2 control-label">性别</label>
			  	<div class="col-sm-10">
				    <label class="radio-inline">
					  <input type="radio" name="gender" id="gender1_Update" value="男" checked="checked"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="gender2_Update" value="女"> 女
					</label>
				</div>
			  </div>
			  <div class="form-group">
			  	<label for="email_add" class="col-sm-2 control-label">所属部门</label>
			    <div class="col-sm-4">
				    <select class="form-control" name="dId" id="dept_Update_select">

					</select>
				</div>
			  </div>
			  
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="btn_Update_save">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 员工添加Modal -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	          <div class="form-group">
			    <label for="empName_add"  class="col-sm-2 control-label">员工姓名</label>
			    <div class="col-sm-10">
			      <input type="text" name="empName" class="form-control" id="empName_add" placeholder="张三">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="email_add"  class="col-sm-2 control-label">Email</label>
			    <div class="col-sm-10">
			      <input type="email" name="email" class="form-control" id="email_add" placeholder="Email@fjj.com">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			  	<label for="email_add" class="col-sm-2 control-label">性别</label>
			  	<div class="col-sm-10">
				    <label class="radio-inline">
					  <input type="radio" name="gender" id="gender1_add" value="男" checked="checked"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="gender2_add" value="女"> 女
					</label>
				</div>
			  </div>
			  <div class="form-group">
			  	<label for="email_add" class="col-sm-2 control-label">所属部门</label>
			    <div class="col-sm-4">
				    <select class="form-control" name="dId" id="dept_add_select">

					</select>
				</div>
			  </div>
			  
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="btn_add_save">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- js -->
	<script type="text/javascript">
	
		var empTotal,nowPage;
	
		$(function() {
			sendRequest(1);
		});
		//到哪一页
		function sendRequest(pn) {
			//alert(pn)
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"pn="+pn,
				type:"GET",
				success:function(res){
					//console.log(res.extend.pageInfo.list)
					build_emps_table(res);
					build_page_info(res);
					build_page_nav(res);
				}
			});
		}
		
		function build_emps_table(res) {
			$("#emps_table tbody").empty();
			var emps = res.extend.pageInfo.list;
			$.each(emps,function(index,item){
				//alert(item.empName)
				var checkBoxTd = $($("<td><input type='checkbox' class='check_item_my' /></td>"));
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var gender = item.gender=='男'?"男":"女";
				var genderTd = $("<td></td>").append(gender);
				var emailTd = $("<td></td>").append(item.email);
				var deptNameTd = $("<td></td>").append(item.department.deptName);
					var editBtn = $("<button></button>")
						.addClass("btn btn-primary btn-sm edit_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
						.append("编辑");
					editBtn.attr("edit-id",item.empId);
					var delBtn = $("<button></button>")
						.addClass("btn btn-danger btn-sm delete_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-remove"))
						.append("删除");
					delBtn.attr("del-id",item.empId);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn)
				$("<tr></tr>").append(checkBoxTd)
					.append(empIdTd)
					.append(empNameTd)
					.append(genderTd)
					.append(emailTd)
					.append(deptNameTd)
					.append(btnTd)
					.appendTo("#emps_table tbody");
				
			})
		}
		
		function build_page_info(res) {
			//console.log(res.extend.pageInfo.pageNum)
			$("#page_info").empty();
			$("#page_info").append("当前页："+res.extend.pageInfo.pageNum
					+"，总页数："+res.extend.pageInfo.pages
					+"，总记录："+res.extend.pageInfo.total+"。");
			empTotal = res.extend.pageInfo.total;
			nowPage = res.extend.pageInfo.pageNum;
		}
		
		function build_page_nav(res) {
			$("#page_nav").empty();
			////////////////////////////////////
			var nav_ul		= $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi   = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
			if(res.extend.pageInfo.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				firstPageLi.click(function(){sendRequest(1)});
				prePageLi.click(function(){sendRequest(res.extend.pageInfo.pageNum-1)});
			}
			var nextPageLi  = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
			var lastPageLi  = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if(res.extend.pageInfo.hasNextPage==false){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else{
				nextPageLi.click(function(){sendRequest(res.extend.pageInfo.pageNum+1)});
				lastPageLi.click(function(){sendRequest(res.extend.pageInfo.pages)});
			}
			////////////////////////////////////	
			nav_ul.append(firstPageLi).append(prePageLi);
			var navigatepageNums = res.extend.pageInfo.navigatepageNums;
			$.each(navigatepageNums,function(index,item){
				var numLi	= $("<li></li>").append($("<a></a>").append(item));
				if(res.extend.pageInfo.pageNum==item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					sendRequest(item);
				});
				nav_ul.append(numLi);
			});
			nav_ul.append(nextPageLi).append(lastPageLi);
			////////////////////////////////////
			var navBody  	=$("<nav></nav>").append(nav_ul);
			navBody.appendTo("#page_nav");
		}
		
		function resetForm(formName){
			$(formName)[0].reset();
			//清空表单样式
			$(formName).find("*").removeClass("has-error has-success");
			$(formName).find(".help-block").text("");
			
		}
			
		$("#btn_emp_add").click(function(){
			//清除表单数据、表单样式
			resetForm("#empAddModal form");
			//获取部门信息
			getDepts("#dept_add_select");
			//弹出模态框
			$("#empAddModal").modal({
				backdrop:'static'
			});
		});	
		
		function getDepts(who) {
			$(who).empty();
			$.ajax({
				url:"${APP_PATH}/depts",
				type:"GET",
				success:function(res){
					//console.log(res.extend.depts)
					$.each(res.extend.depts,function(){
						var optionSon = $("<option></option>").append(this.deptName).attr("value",this.deptId);
						optionSon.appendTo(who);
					});
				}
			});
		}
		
		function validate_add_form(){
			//表单数据
			var empName = $("#empName_add").val();
			var rEmpName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if(!rEmpName.test(empName)){
				//alert("用户名必须为2-5个汉字或者6-16个英文和数字组合");
				show_validate_msg("#empName_add","error","用户名必须为2-5个汉字或者6-16个英文和数字组合");
				return false
			}else{
				//用户名在数据库中已经存在
				if($("#btn_add_save").attr("ajax-va")=="error"){
					show_validate_msg("#empName_add","error","用户名不可用");
				}else{
					show_validate_msg("#empName_add","success","");
				}
			}
			var email = $("#email_add").val();
			var rEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!rEmail.test(email)){
				//alert("邮箱不正确");
				show_validate_msg("#email_add","error","邮箱格式不正确");
				return false
			}else{
				show_validate_msg("#email_add","success","");
			}
			return true
		}
		
		function show_validate_msg(who,status,msg){
			$(who).parent().removeClass("has-success has-error");
			$(who).next("span").text("");
			if("success"==status){
				$(who).parent().addClass("has-success");
				$(who).next("span").text("");
			}else if("error"==status){
				$(who).parent().addClass("has-error");
				$(who).next("span").text(msg);
			}
		}
		$("#btn_add_save").click(function() {
			//校验表单数据
			if(!validate_add_form()){
				return false;
			}
			//判断用户名是否存在
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			//提交表单
			//alert($("#empAddModal form").serialize())
			$.ajax({
				url:"${APP_PATH}/emp",
				data:$("#empAddModal form").serialize(),
				type:"POST",
				success:function(res){
					//console.log(res);
					if(res.code==100){
						//关闭模态框
						$("#empAddModal").modal('hide');
						//到最后一页
						sendRequest(empTotal);
					}else if(res.code==200){
						//显示失败信息
						if(undefined != res.extend.errorFields.email){
							//显示邮箱错误信息
							show_validate_msg("#email_add","error",res.extend.errorFields.email);
						}
						if(undefined != res.extend.errorFields.empName){
							show_validate_msg("#empName_add","error",res.extend.errorFields.empName);
						}
					}
					
				}
			})
		});
		$("#empName_add").change(function(){
			var name = $("#empName_add").val();
			//发送ajxa
			$.ajax({
				url:"${APP_PATH}/checkUser",
				data:"empName="+name,
				type:"POST",
				success:function(res){
					//console.log(res);
					if(res.code==200){
						show_validate_msg("#empName_add","error",res.extend.va_msg);
						$("#btn_add_save").attr("ajax-va","error");
					}else if(res.code==100){
						show_validate_msg("#empName_add","success","用户名可用");
						$("#btn_add_save").attr("ajax-va","success");
					}
				}
			})
		});
		
		//更新//////////////////////
		$(document).on("click",".edit_btn",function(){
			//alert("123")
			//查出部门信息、显示列表
			//查出单个员工信息并显示
			var id = $(this).attr("edit-id")
			getDepts("#dept_Update_select");
			getEmp(id);
			$("#btn_Update_save").attr("update-id",id);
			$("#empUpdateModal").modal({
				
			});
		});
		function getEmp(id){
			$.ajax({
				url:"${APP_PATH}/emp/"+id,
				type:"GET",
				success:function(res){
					//console.log(res);
					var empData = res.extend.emp;
					//$("#empName_Update").text()
					$("#empName_Update").val(empData.empName);
					$("#email_Update").val(empData.email);
					$("#empUpdateModal input[name=gender]").val([empData.gender]);
					$("#empUpdateModal select").val([empData.dId]);
				}
			});
		}
			//更新按钮事件
		$("#btn_Update_save").click(function(){
			var id = $(this).attr("update-id");
			if(!validate_update_form("#empName_Update","#email_Update")){
				return false;
			}
			$.ajax({
				url:"${APP_PATH}/emp/"+id,
				type:"PUT",
				data:$("#empUpdateModal form").serialize(),
				//直接使用PUT需要在web.xml中加入filter  HttpPutFormContentFilter
				//type:"POST",
				//data:$("#empUpdateModal form").serialize()+"&_method=PUT",
				success:function(res){
					//console.log(res);
					$("#empUpdateModal").modal("hide");
					sendRequest(nowPage);
				}
			})
		});
		function validate_update_form(people1,people2){
			var empName = $(people1).val();
			var rEmpName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if(!rEmpName.test(empName)){
				//alert("用户名必须为2-5个汉字或者6-16个英文和数字组合");
				show_validate_msg(people1,"error","用户名必须为2-5个汉字或者6-16个英文和数字组合");
				return false
			}else{
				show_validate_msg(people1,"success","");
			}
			var email = $(people2).val();
			var rEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!rEmail.test(email)){
				//alert("邮箱不正确");
				show_validate_msg(people2,"error","邮箱格式不正确");
				return false
			}else{
				show_validate_msg(people2,"success","");
			}
			return true
		}
		//更新//////////////////////
		//删除//////////////////////
		$(document).on("click",".delete_btn",function(){
			//alert("删除"+$(this).attr("del-id")+"---"+)
			var id = $(this).attr("del-id");
			var empName = $(this).parents("tr").find("td:eq(2)").text();
			if(confirm("确认删除员工【"+empName+"】吗？")){
				//删除
				delEmp(id);
			}
		});
		function delEmp(ids){
			$.ajax({
				url:"${APP_PATH}/emp/"+ids,
				type:"DELETE",
				success:function(res){
					console.log(res);
					//回到本页
					sendRequest(nowPage);
				}
			})
		}
			//全选 checkAll 按钮
		$("#checkAll").click(function(){
			//alert($(this).prop("checked"));
			var status = $(this).prop("checked");
			$(".check_item_my").prop("checked",status);
		});
			//check_item_my
		$(document).on("click",".check_item_my",function(){
			//判断5个check_item_my是否全部选中
			var checkItems = $(".check_item_my").length;//除checkAll，所有的checkitem个数
			var checkedLength = $(".check_item_my:checked").length;//选中的个数
			//alert(checkedLength);
			if(checkedLength==checkItems){
				$("#checkAll").prop("checked","checked");
			}else{
				$("#checkAll").prop("checked","");
			}
		});
			//删除多个
		$("#btn_delEmps").click(function(){
			var names="";
			var ids ="";
			$.each($(".check_item_my:checked"),function(){
				var empName = $(this).parents("tr").find("td:eq(2)").text();
				names+=empName + ",";
				var id = $(this).parents("tr").find("td:eq(1)").text();
				ids += id+"-";
				//alert(empName);
;			});
			names = names.substring(0,names.length-1);
			ids = ids.substring(0,ids.length-1);
			if(confirm("确认删除以下员工【"+names+"】?"+ids)){
				delEmp(ids);
			}
		});
		//删除//////////////////////
	</script>
</body>
</html>