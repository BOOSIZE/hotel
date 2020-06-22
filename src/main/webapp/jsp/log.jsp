<%--
  Created by IntelliJ IDEA.
  User: 29778
  Date: 2020/6/21
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path=application.getContextPath()+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>用户登录</title>
	<link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
	<link rel="stylesheet" href="<%=path+"css/log.css"%>">
	<script src="<%=path+"js/layui/layui.js"%>"></script>
	<script src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body style="background-image: url(<%=path+"image/beijing.jpg"%>);background-size: 100%">

<div  id="div">
	<div class="layui-form-item">
		<label class="layui-form-label">账号:</label>
		<div class="layui-input-inline">
			<input type="text" name="name" id="account" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">密码:</label>
		<div class="layui-input-inline">
			<input type="password" name="password" id="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-block">
			<button class="layui-btn" lay-submit lay-filter="formDemo" id="log" style="margin-left: 10%;">登录</button>
			<span><a href="<%=path+"go/to/reg"%>">注册</a></span>
			<a href="<%=path%>/UserServlet?method=login2">游客访问</a>
		</div>
	</div>
</div>
<script>
	layui.use('layer', function() {
		var layer=layui.layer;

		$('#log').click(function ()
		{
			var account=$('#account').val();
			var password=$('#password').val();

			if(account.length=== 0 || password.length===0)
			{
				layer.alert("请填写完整内容",{icon:5});
			}
			else
			{
				$.ajax({
					type:'POST',
					url:'<%=path+"user/log"%>',
					data:{account:account,password:password},
					success:function(msg)
					{
						if(msg==="nobody")
						{
							layer.alert("账号不存在", {icon: 5});
						}
						else if(msg==="no")
						{
							layer.alert("密码错误", {icon: 5});
						}
						else if(msg==="yes")
						{
							layer.open({
								title: ['温馨提示'],
								content: '登录成功',
								btn: ['确定'],
								closeBtn :0,
								icon:1,
								yes: function(){
									window.location.href="<%=path+"go/to/main"%>";
								}
							});
						}
						else
						{
							layer.open({
								title: ['温馨提示'],
								content: '登录成功',
								btn: ['确定'],
								closeBtn :0,
								icon:1,
								yes: function(){
									window.location.href="<%=path+"go/to/main2"%>";
								}
							});
						}
					},
					error:function ()
					{
						layer.alert("服务器正忙.....", {icon: 5});
					}
				});
			}
		});
	});
</script>

</body>
</html>