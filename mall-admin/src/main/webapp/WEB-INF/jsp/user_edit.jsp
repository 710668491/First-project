<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<style type="text/css">
.main_div {
	margin: 15px;
}
</style>
<title>- 用户修改</title>
</head>
<body>
		<form  id="form_add" class="layui-form layui-form-pane" action="" method="post" enctype="multipart/form-data">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input type="text" name="username" value="${user.username}"required lay-verify="required"
						placeholder="请输入用户名" autocomplete="off" class="layui-input">
				</div>
			</div>
				<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
					<input type="text" name="password" value="${user.password}" lay-verify="required"
						placeholder="请输入用户密码" autocomplete="off" class="layui-input">
				</div>
			</div>
	
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱</label>
				<div class="layui-input-block">
					<input type="text" name="email" value="${user.email}" required lay-verify="required"
						placeholder="请输入用户email" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">电话号码</label>
				<div class="layui-input-block">
					<input type="text" name="phone" value="${user.phone}" placeholder="请输入电话号码"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">问题</label>
				<div class="layui-input-block">
					<input type="text" name="question" value="${user.question}" placeholder="请输入问题"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">答案</label>
				<div class="layui-input-block">
					<input type="text" name="answer" value="${user.answer}"  placeholder="请输入答案"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" pane="">
				<label class="layui-form-label">用户类型</label>
				<div class="layui-input-block">
					<input type="radio" name="role" value="1" title="管理员" checked="">
					<input type="radio" name="role" value="0" title="普通用户">
					<input type="radio" name="role" value="" title="BOSS" disabled>
				</div>
			</div>


			<div class="layui-form-item">
				<button type="button" class="layui-btn" onclick="submitForm()">修改</button>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/kindeditor/kindeditor-all.js"></script>
	<script>


		
	function submitForm(){
		$.ajax({
			url:'${ctx}/manager/user/update.action',
			data:$('#form_add').serialize(),
			type:'POST',
			dataType:'json',
			success : function(jsonObj) {
				console.log(jsonObj.code)
				if(jsonObj.code == util.SUCCESS) {
					
					mylayer.confirm("修改成功，是够跳转到用户列表界面？", "${ctx}/manager/user/getUserpage.action");
				} else {
					mylayer.errorMsg(jsonObj.msg);
				}
			}
			});
		}
		
		

            

	</script>
</body>
</html>