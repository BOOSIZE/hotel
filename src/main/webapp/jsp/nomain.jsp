<%--
  Created by IntelliJ IDEA.
  User: 29778
  Date: 2020/6/23
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path=application.getContextPath()+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>主页面</title>
	<link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
	<link rel="stylesheet" href="<%=path+"css/main.css"%>">
	<script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
	<script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body>

<center>
	<br>

	<h1 >欢迎访问蔡卤鹏酒店官网</h1></center>

<a href="<%=path+"go/to/log"%>">我要登录</a>

<div class="banner" >
	<div class="img-wrap">
		<ul>
			<li class="item" style="display: block">
				<img src="<%=path+"image/beijing.jpg" %>" alt="" class="lunbo">
			</li>
			<li class="item">
				<img src="<%=path+"image/1.jpg" %>" alt="" class="lunbo">
			</li>
		</ul>
	</div>
	<div class="lr-tab">
		<div class="left btn"></div>
		<div class="right btn"></div>
	</div>
	<div class="tab-btn">
		<ul>
			<li class="btn"></li>
			<li class="btn"></li>
		</ul>
	</div>
</div>



<br><br>
<center><h1>房间展示</h1></center>


<br>

<form class="layui-form" action="" id="myForm">


	<div class="layui-form-item">


		<label class="layui-form-label">房间名称:</label>
		<div class="layui-input-inline">
		<c:choose>

			<c:when test="${sessionScope.tname!=null && sessionScope.tname!=''}">
				<input type="text" id="tname"  value="${sessionScope.tname}" placeholder="房间名称" autocomplete="off" class="layui-input">
			</c:when>
			<c:otherwise>
				<input type="text" id="tname" placeholder="房间名称" autocomplete="off" class="layui-input">
			</c:otherwise>
		</c:choose>
		</div>



		<label class="layui-form-label">价格:</label>
		<div class="layui-input-inline">
			<select id="amt">
				<c:choose>
					<c:when test="${sessionScope.amt!=null && sessionScope.amt=='1'}">
						<option value="不限">不限</option>
						<option value="1" selected="selected">小于100元</option>
						<option value="2">100-199元</option>
						<option value="3">200-499元</option>
						<option value="4">大于500元</option>
					</c:when>

					<c:when test="${sessionScope.amt!=null && sessionScope.amt=='2'}">
						<option value="不限">不限</option>
						<option value="1" >小于100元</option>
						<option value="2" selected="selected">100-199元</option>
						<option value="3">200-499元</option>
						<option value="4">大于500元</option>
					</c:when>

					<c:when test="${sessionScope.amt!=null && sessionScope.amt=='3'}">
						<option value="不限">不限</option>
						<option value="1" >小于100元</option>
						<option value="2">100-199元</option>
						<option value="3" selected="selected">200-499元</option>
						<option value="4">大于500元</option>
					</c:when>

					<c:when test="${sessionScope.amt!=null && sessionScope.amt=='4'}">
						<option value="不限">不限</option>
						<option value="1" >小于100元</option>
						<option value="2">100-199元</option>
						<option value="3">200-499元</option>
						<option value="4" selected="selected">大于500元</option>
					</c:when>
					<c:otherwise>
						<option value="不限">不限</option>
						<option value="1" >小于100元</option>
						<option value="2">100-199元</option>
						<option value="3">200-499元</option>
						<option value="4" >大于500元</option>
					</c:otherwise>
				</c:choose>
			</select>
		</div>



		<label class="layui-form-label">可住人数:</label>
		<div class="layui-input-inline">
			<select id="people">
				<c:choose>

					<c:when test="${sessionScope.people!=null && sessionScope.people=='1'}">
						<option value="不限">不限</option>
						<option value="1" selected="selected">1人</option>
						<option value="2">2人</option>
						<option value="3">3人</option>
					</c:when>

					<c:when test="${sessionScope.people!=null && sessionScope.people=='2'}">
						<option value="不限">不限</option>
						<option value="1" >1人</option>
						<option value="2" selected="selected">2人</option>
						<option value="3">3人</option>
					</c:when>

					<c:when test="${sessionScope.people!=null && sessionScope.people=='3'}">
						<option value="不限">不限</option>
						<option value="1" >1人</option>
						<option value="2">2人</option>
						<option value="3" selected="selected">3人</option>
					</c:when>

					<c:otherwise>
						<option value="不限">不限</option>
						<option value="1" >1人</option>
						<option value="2">2人</option>
						<option value="3" >3人</option>
					</c:otherwise>
				</c:choose>
			</select>
		</div>


		<div class="layui-input-inline">
			<button class="layui-btn" lay-submit lay-filter="sou">搜索</button>
		</div>


	</div>

</form>




<table>
	<tr>
		<c:forEach items="${sessionScope.roomList}" var="r">
			<td>
				<div class="zhe">
					<dl>
						<dt>
							<img onclick="al()" src="<%=path%> ${r.img}" width="150" height="120" style="cursor: pointer;"/>
						</dt>
						<dd class="dd_name">
							名称：${r.tname}
						</dd>
						<dd class="dd_city">
							床位：${r.tcount}
						</dd>
						<dd class="dd_city">
							价格：${r.amt}
						</dd>
						<dd class="dd_city">
							可住人数：${r.tpeople}
						</dd>
					</dl>

				</div>

			</td>

		</c:forEach>
	</tr>



</table>

<script type="text/javascript">
	var index2 = 0;/*初始化一个变量 指向下彪*/
	//点击点
	$(".tab-btn .btn").click(function () {
		index2 = $(this).index();//获取点击该元素下彪
		$(this).addClass("active").siblings().removeClass("active");
		$(".item").eq(index2).fadeIn().siblings().fadeOut();
	});
	//点击切换效果
	$(".lr-tab .right").click(function () {
		index2 ++;
		if (index2 >2){ index2 = 0;}
		$(".item").eq(index2).fadeIn().siblings().fadeOut();
		$(".tab-btn .btn").eq(index2).addClass("active").siblings().removeClass("active");

	});
	$(".lr-tab .left").click(function () {
		index2 --;
		if(index2 < 0){index2 = 2;}
		$(".item").eq(index2).fadeIn().siblings().fadeOut();
		$(".tab-btn .btn").eq(index2).addClass("active").siblings().removeClass("active");

	});
	var time2 = setInterval(function () {
		index2 ++;
		if (index2 >2){ index2 = 0;}
		$(".item").eq(index2).fadeIn().siblings().fadeOut();
		$(".tab-btn .btn").eq(index2).addClass("active").siblings().removeClass("active");

	},3000); //定时器 重复
</script>



<script>
	function al()
	{
		layer.alert('请先登录',{icon:5});
	};
	layui.use(['form','layer'], function() {
		layer = layui.layer;
		form = layui.form;



		form.on('submit(sou)', function(data)
		{
			var tname=$('#tname').val();
			var amt=$('#amt').val();
			var people=$('#people').val();
			$.ajax({
				type:'POST',
				url:'<%=path+"type/render"%>',
				data:{tname:tname,people:people,amt:amt},
				success:function(msg)
				{
					if(msg==="yes")
					{
						window.location.href = "<%=path+"go/to/nomain"%>"
					}
				},
				error:function ()
				{
					layer.alert("服务器正忙.....", {icon: 5});
				}
			});
			return false;
		});

		$(function ()
		{
			$.ajax({
				type:'POST',
				url:'<%=path+"type/getList"%>',
				success:function(msg)
				{
					if(msg==="yes")
					{
						window.location.href = "<%=path+"go/to/nomain"%>"
					}
				},
				error:function ()
				{
					layer.alert("服务器正忙.....", {icon: 5});
				}
			});
		});



	});

</script>

</body>
</html>
