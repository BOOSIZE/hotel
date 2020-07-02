<%@ page import="com.example.hotel.entity.Userinfo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.hotel.entity.Typeinfo" %><%--
  Created by IntelliJ IDEA.
  User: 29778
  Date: 2020/6/25
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<span hidden="hidden" id="oldPass"><%out.write(userinfo.getPassword());%></span>

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
				<input type="password" id="new"  placeholder="请输入6-15位的新密码" autocomplete="off" class="layui-input">
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

<script type="text/html" id="msg">
	<form class="layui-form" >


		<div class="layui-form-item">
			<label class="layui-form-label">账号：</label>
			<div class="layui-input-inline">
				<div class="layui-form-mid layui-wotrd-aux">
					<%out.write(userinfo.getAccount());%>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">姓名：</label>
			<div class="layui-input-inline">
				<div class="layui-form-mid layui-wotrd-aux">
				<%out.write(userinfo.getUname());%>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">性别：</label>
			<div class="layui-input-inline">
				<div class="layui-form-mid layui-wotrd-aux">
					<%out.write(userinfo.getUsex());%>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">余额：</label>
			<div class="layui-input-inline">
				<div class="layui-form-mid layui-wotrd-aux">
					<span id="sp"></span>
				</div>
			</div>
		</div>


		<div class="layui-form-item">
			<div class="layui-input-inline">
				<button class="layui-btn" lay-submit lay-filter="updatePassword">修改密码</button>
			</div>
			<div class="layui-input-inline">
				<button class="layui-btn" lay-submit lay-filter="addMoney">账户充值</button>
			</div>

		</div>
	</form>

</script>

<center>
	<br>

	<h1 >欢迎<%  out.write(userinfo.getUname());   %>访问蔡卤鹏酒店官网</h1></center>

<div align="right" style="float:right">


	<a href="#" id="look">查看用户信息</a>&nbsp;&nbsp;&nbsp;
	<a href='<%=path+"go/to/b_bulletin_board_info_front"%>'>查看公告</a>&nbsp;&nbsp;&nbsp;
	<a href='<%=path+"go/to/o_all_order_info_front"%>' id="order">查看订单</a>&nbsp;&nbsp;&nbsp;
	<a href="">收银管理</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=path+"go/to/log"%>">退出</a>
</div>

<div class="banner" id="w">
	<div class="img-wrap" id="nn">
		<ul>
			<li class="item" style="display: block">
				<img src="<%=path+"image/beijing.jpg" %>" alt="" class="lunbo">
			</li>
			<li class="item">
				<img src="<%=path+"image/1.jpg" %>" alt="" class="lunbo">
			</li>
		</ul>
	</div>
	<div class="lr-tab" id="zhe">
		<div class="left btn"></div>
		<div class="right btn"></div>
	</div>
	<div class="tab-btn" id="emm">
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
							<img src="<%=path%> ${r.img}" width="150" height="120" />
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
						window.location.href = "<%=path+"go/to/main2"%>"
					}
				},
				error:function ()
				{
					layer.alert("服务器正忙.....", {icon: 5});
				}
			});
		});


		$('#look').click(function ()
		{
			$.ajax({
				type:'POST',
				url:'<%=path+"user/getMoney"%>',
				success:function(msg)
				{
					document.getElementById("sp").innerText=msg;
				},
				error:function ()
				{
					layer.alert("服务器正忙.....", {icon: 5});
				}
			});
			var dialog=layer.open({
				type: 1,
				content: $('#msg').html(),
				area: ['400px','400px'],
				anim:4,
				title: '个人信息',
				success:function ()
				{
				}
			});

			form.on('submit(updatePassword)', function(data)
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
					else if(newPass.length<6 || newPass.length>15)
					{
						layer.alert('请输入6-15位的新密码',{icon:5});
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
				return false;
			});


			form.on('submit(addMoney)', function(data)
			{
				layer.prompt({title:'请输入1-1000元的整数金额'},function(value, index, elem)
				{

					var reg = new RegExp("^([1-9][0-9]{0,2}|1000)$");
					if(!reg.test(value))
					{
						layer.alert('请输入1-1000的整数',{icon:5});
					}
					else
					{

						$.ajax({
							type:'POST',
							url:'<%=path+"user/addMoney"%>',
							data:{money:value},
							success:function(msg)
							{
								if(msg ==="yes")
								{
									layer.alert('恭喜你，充值成功',{icon:1});
									layer.close(dialog);
									layer.close(index);
								}
								else
								{
									layer.alert("删除失败，请重试", {icon: 5});
								}
							},
							error:function ()
							{
								layer.alert("服务器正忙.....", {icon: 5});
							}
						});
					}
				});

				return false;
			});
		});

	});

</script>

</body>
</html>
