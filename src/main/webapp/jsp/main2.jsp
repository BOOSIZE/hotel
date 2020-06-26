<%@ page import="com.example.hotel.entity.Userinfo" %><%--
  Created by IntelliJ IDEA.
  User: 29778
  Date: 2020/6/25
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path=application.getContextPath()+"/";
	Userinfo userinfo=(Userinfo) session.getAttribute("user");
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

	<h1 >欢迎<%  out.write(userinfo.getUname());   %>访问蔡卤鹏酒店官网</h1></center>

<div align="right" style="float:right">


	<a href="">查看用户信息</a>&nbsp;&nbsp;&nbsp;
	<a href="">查看公告</a>&nbsp;&nbsp;&nbsp;
	<a href="#" id="order">查看订单</a>&nbsp;&nbsp;&nbsp;
	<a href="">收银管理</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=path+"go/to/log"%>">退出</a>
</div>

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
<form name="form1" method="post" action="">
	房间类型:<select name="ptype">
	<option value="全部">全部</option>
	<option value="熟食">熟食</option>
	<option value="零食">零食</option>
	<option value="饮品">饮品</option>
	<option value="其他">其他</option>
</select>
	<input type="submit" value="查询" >
</form>
<table>
	<tr>
		<td>
			<div>
				<dl>
					<dt>
						<img src="<%=path+"image/beijing.jpg"%>" width="150" height="120" />
					</dt>
					<dd class="dd_name">
						名称：
					</dd>
					<dd class="dd_city">
						床位：
					</dd>
					<dd class="dd_city">
						价格：
					</dd>
					<dd class="dd_city">
						剩余数：
					</dd>
				</dl>

			</div>

		</td>
	</tr>

</table>

&nbsp;







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
	layui.use(['element','layer'], function(){
		layer=layui.layer;


		$('#order').click(function () {
			layer.open({
				type: 2,
				content:'<%=path+"jsp/o_all_order_info_front.jsp"%>',
				area: ['500px','400px'],
				anim:4,
				title: false,
				success:function ()
				{

				}
			});
		});


	});


</script>

</body>
</html>
