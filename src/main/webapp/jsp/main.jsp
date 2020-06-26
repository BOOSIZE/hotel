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
	});
</script>
</body>
</html>
