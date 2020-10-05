<%@ page import="com.example.hotel.entity.Typeinfo" %>
<%@ page import="com.example.hotel.entity.Userinfo" %><%--
  Created by IntelliJ IDEA.
  User: 29778
  Date: 2020/7/15
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path=application.getContextPath()+"/";
	Typeinfo typeinfo=(Typeinfo) session.getAttribute("type");
	Userinfo userinfo=(Userinfo) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>房间详情</title>
	<link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
	<link rel="stylesheet" href="<%=path+"css/room.css"%>">
	<script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
	<script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body>


<script type="text/html" id="msg">
	<form class="layui-form" action="" id="myForm">

	<div class="layui-form-item">
		<label class="layui-form-label">姓名:</label>
		<div class="layui-input-inline">
			<input type="text" id="pname" lay-verify="required" placeholder="请输入入住人姓名" autocomplete="off" class="layui-input">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">身份证:</label>
		<div class="layui-input-inline">
			<input type="text" id="pcode" lay-verify="required" placeholder="请输入身份证号" autocomplete="off" class="layui-input">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">性别:</label>
		<div class="layui-input-inline">
			<input type="radio" name="usex" value="男" title="男" checked id="man">
			<input type="radio" name="usex" value="女" title="女" >
		</div>
	</div>

		<div class="layui-form-item">
			<label class="layui-form-label">入住人数:</label>
			<div class="layui-input-inline">
				<select id="people">
					<option value="1">1人</option>
					<option value="2">2人</option>
					<option value="3">3人</option>
				</select>
			</div>
		</div>


		<div class="layui-form-item">
			<label class="layui-form-label">入住时间:</label>
			<div class="layui-input-inline">
				<input type="text" id="start" lay-verify="required" placeholder="yyyy-MM-dd"   autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">入住天数:</label>
			<div class="layui-input-inline">
				<input type="text" id="day" lay-verify="required" placeholder="请输入入住天数" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>

</form>

</script>



<h1>
	<a href="<%=path+"go/to/main2"%>">首页</a>
	 房间详情
</h1>
<hr>

<div id="div">

<img width="350" height="350"
     src="<%=path%> <%=typeinfo.getImg()%>" width="150" height="120" />
<table width="750" height="60">
	<tr>
		<td width="70%" valign="top">
			<table>
				<tr>
					<td><b>名称：<%=typeinfo.getTname()%></b></td>
				</tr>
				<tr>
					<td>价格：<%=typeinfo.getAmt()%></td>
				</tr>

				<tr>
					<td>床位：<%=typeinfo.getTcount()%></td>
				</tr>

				<tr>
					<td>可住人数：<%=typeinfo.getTpeople()%></td>
				</tr>

				<tr>
					<td>剩余数量：<%=typeinfo.getSum()%></td>
				</tr>


				<tr>
					<td>
						<button class="layui-btn" id="bt">预定</button>
					</td>
				</tr>

			</table>
			<br>



		</td>
	</tr>
</table>

</div>

<input type="text" hidden="hidden" value="<%=typeinfo.getSum()%>" id="sum">
<input type="text" hidden="hidden" value="<%=typeinfo.getAmt()%>" id="money">


<script>

	layui.use(['layer','form','laydate'], function()
	{
		var layer = layui.layer;
		var form = layui.form;
		var laydate = layui.laydate;

		//获取当前时间
		var date = new Date();
		var y = date.getFullYear();
		var m = date.getMonth() + 1;
		var d = date.getDate();
		var now = "" + y + "-" + m + "-" + d;


		$('#bt').click(function ()
		{
			var sum=$('#sum').val();
			if(sum==="0")
			{
				layer.alert("该类型暂无空余房间，请选择其他类型",{icon:5});
			}
			else
			{
				layer.open({
					type: 1,
					content: $('#msg').html(),
					area: ['400px','450px'],
					anim:4,
					closeBtn:2,
					title: '房间预订',
					success:function ()
					{
						form.render();
						laydate.render({
							elem: '#start'
							, showBottom: false
							, min: now
						});
					}
				});
				form.on('submit(formDemo)', function(data)
				{
					var pname =$('#pname').val();
					var pcode =$('#pcode').val();
					var day =$('#day').val();
					var start =$('#start').val();
					var people =$('#people').val();
					var sex='女';
					if(document.getElementById("man").checked===true)
					{
						sex='男';
					}

					var idcardReg = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X|x)$/;
					var Reg=/^[1-9]\d*$/;

					if(pname.length<2|| pname.length>6)
					{
						layer.alert("请输入2-6位的名字",{icon:5});
					}
					else if(!(idcardReg.test(pcode)))
					{
						layer.alert("请输入合法的身份证",{icon:5});
					}
					else if(!(Reg.test(day)))
					{
						layer.alert("请输入大于等于1的天数",{icon:5});
					}
					else
					{
						var money=$('#money').val();
						var oMoney=money*day;
						layer.confirm('确定要花费'+oMoney+"元预定酒店吗?",{title:"温馨提示",icon:7} ,function(index)
						{
							$.ajax({
								type:'POST',
								url:'<%=path+"user/getMoney"%>',
								success:function(msg)
								{
									if(msg<oMoney)
									{
										layer.alert("您的余额不足，请先充值", {icon: 5});
									}
									else
									{

										layer.alert("ok", {icon: 6});
									}
								},
								error:function ()
								{
									layer.alert("服务器正忙.....", {icon: 5});
								}
							});
						});
					}



					return false;
				});
			}
		});
	});


</script>

</body>
</html>
