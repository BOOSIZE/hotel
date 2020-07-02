<%@ page import="com.example.hotel.entity.Userinfo" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-05-11
  Time: 下午 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path=application.getContextPath()+"/";
	Userinfo user=(Userinfo) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>主页面</title>
	<link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
	<script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
	<script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body class="layui-layout-body">

<span hidden="hidden" id="oldPass"><%out.write(user.getPassword());%></span>

<script type="text/html" id="pass">
	<div class="layui-form-item">
		<label class="layui-form-label">原密码:</label>
		<div class="layui-input-inline">
			<input type="password" id="old"  placeholder="请输入原密码" autocomplete="off" class="layui-input">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">新密码:</label>
		<div class="layui-input-inline">
			<input type="password" id="new"  placeholder="请输入5-15位的新密码" autocomplete="off" class="layui-input">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">再次输入:</label>
		<div class="layui-input-inline">
			<input type="password"  id="new2" placeholder="请再次输入新密码" autocomplete="off" class="layui-input">
		</div>
	</div>



	<div class="layui-form-item">
		<div class="layui-input-block">
			<button class="layui-btn" id="yes">确认修改</button>
		</div>

	</div>

</script>

<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo">
			酒店管理系统

		</div>


		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="javascript:;">
					<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
					欢迎你,<%  out.write(user.getUname());   %>
				</a>
				<dl class="layui-nav-child">
					<dd><a href="#" id="updatePass">修改密码</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item"><a id="exit">注销</a></li>
		</ul>
	</div>

	<div class="layui-side layui-bg-black">
		<div class="layui-side-scroll">
			<ul class="layui-nav layui-nav-tree"  lay-filter="test">


				<c:forEach items="${sessionScope.menu}" var="m">


				<li class="layui-nav-item layui-nav-itemed">
					<a class="" href="javascript:;">${m.key}</a>
					<c:forEach items="${m.value}" var="a">
					<dl class="layui-nav-child">
						<dd><a href="<%=path%>${a.murl}" target="myFrame">${a.mname}</a></dd>
					</dl>
					</c:forEach>
				</li>


				</c:forEach>
			</ul>
		</div>
	</div>

	<div class="layui-body">

		<iframe src="" name="myFrame" style="height: 100%;width: 100%;"></iframe>
	</div>


</div>


<script>
	layui.use(['element','layer'], function(){
		var element = layui.element;
		var layer=layui.layer;

		$('#exit').click(function ()
		{
			layer.confirm('确定要注销吗?', function(index)
			{
				window.location.href="<%=path+"go/to/log"%>";
			});
		});



		$('#updatePass').click(function ()
		{
			layer.open({
				type: 1,
				content: $('#pass').html(),
				area: ['350px','350px'],
				anim:4,
				title: '修改密码',
				success:function ()
				{
				}
			});
			$('#yes').click(function ()
			{
				var oldPass=document.getElementById("oldPass").innerText;
				var old=$('#old').val();
				var newPass=$('#new').val();
				var newPass2=$('#new2').val();
				if(!(old===oldPass))
				{
					layer.alert('原密码有误',{icon:5});
				}
				else if(newPass.length<5 || newPass.length>15)
				{
					layer.alert('请输入5-15位的新密码',{icon:5});
				}
				else if(!(newPass === newPass2))
				{
					layer.alert('两次新密码不一致',{icon:5});
				}
				else if(oldPass===newPass)
				{
					layer.alert('原密码和新密码不得一致',{icon:5});
				}
				else
				{
					$.ajax({
						type:'POST',
						url:'<%=path+"user/updatePass"%>',
						data:{pass:newPass},
						success:function(msg)
						{
							if(msg ==="yes")
							{
								layer.open({
									title: ['温馨提示'],
									content: '修改成功，请重新登录',
									btn: ['确定'],
									closeBtn :0,
									icon:1,
									yes: function(){
										window.location.href="<%=path+"go/to/log"%>";
									}
								});
							}
							else
							{
								layer.alert("修改失败，请重试", {icon: 5});
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
	});
</script>
</body>
</html>
