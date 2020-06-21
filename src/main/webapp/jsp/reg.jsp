<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-05-05
  Time: 下午 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
   String path=application.getContextPath()+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>注册页面</title>
	<link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
	<link rel="stylesheet" href="<%=path+"css/reg.css"%>">
	<script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
	<script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body style="background-image: url(<%=path+"image/beijing.jpg"%>)">

<div id="div">
<form class="layui-form" action="" id="myForm">


	<div class="layui-form-item">
		<label class="layui-form-label">手机号:</label>
		<div class="layui-input-inline">
			<input type="text" name="account" onblur="checkAccount(this)" lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
		</div>
		<div class="layui-form-mid layui-word-aux"><span id="sp1" style="color: RED;"></span></div>
	</div>



	<div class="layui-form-item">
		<label class="layui-form-label">密码:</label>
		<div class="layui-input-inline">
			<input onblur="checkPass(this)" id="password" type="password" name="upassword"  lay-verify="required" placeholder="请输入6-15位的密码" autocomplete="off" class="layui-input">
		</div>
		<div class="layui-form-mid layui-wotrd-aux"> <span id="sp2" style="color: RED;"></span></div>
	</div>


	<div class="layui-form-item">
		<label class="layui-form-label">再次输入:</label>
		<div class="layui-input-inline">
			<input type="password" id="password2"  onblur="checkPass2(this)" name="password"  lay-verify="required" placeholder="请再次输入密码" autocomplete="off" class="layui-input">
		</div>
		<div class="layui-form-mid layui-word-aux"><span id="sp3" style="color: RED;"></span></div>
	</div>


	<div class="layui-form-item">
		<label class="layui-form-label">姓名:</label>
		<div class="layui-input-inline">
			<input type="text" onblur="checkName(this)" name="uname"  lay-verify="required" placeholder="请输入你的姓名" autocomplete="off" class="layui-input">
		</div>
		<div class="layui-form-mid layui-word-aux"><span id="sp4" style="color: RED;"></span></div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">性别:</label>
		<div class="layui-input-inline">
			<input type="radio" name="usex" value="男" title="男" checked>
			<input type="radio" name="usex" value="女" title="女" >
		</div>
	</div>







	<div class="layui-form-item">
		<div class="layui-input-block">
			<button class="layui-btn" lay-submit lay-filter="formDemo">注册</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			<span>已有账号?点击<a href="<%=path+"go/to/log"%>">登录</a></span>
		</div>
	</div>


</form>
</div>

<script>


	function checkAccount(node)
	{
		var account=node.value;
		if(!(account.length ===11 && account>=13000000000 && account<=19000000000))
		{
			document.getElementById("sp1").innerText="请输入合法手机号！！！";
		}
		else
		{
			$.ajax({
				type:'POST',
				url:'<%=path+"user/checkAccount"%>',
				data:{account:account},
				success:function(msg)
				{
					if(msg==="no")
					{
						document.getElementById("sp1").innerText="该手机号已被注册！！！";
					}
					else
					{
						document.getElementById("sp1").innerText="";
					}
				},
				error:function ()
				{
					layer.alert("服务器正忙.....", {icon: 5});
				}
			});
		}
	}

	function checkName(node)
	{
		var name=node.value;
		if(name.length<2 || name.length>6)
		{
			document.getElementById("sp4").innerText="姓名长度应该是2-6位！！！";
		}
		else
		{
			document.getElementById("sp4").innerText="";
		}
	}

	function checkPass(node)
	{

		var password=node.value;

		if(password.length<6 || password.length>15)
		{
			document.getElementById("sp2").innerText="密码长度应该是6-15位！！！";
		}
		else
		{
			document.getElementById("sp2").innerText="";
		}
	}

	function checkPass2(node)
	{
		var password2=node.value;
		var password=document.getElementById("password").value;

		if(password === password2)
		{
			document.getElementById("sp3").innerText="";
		}
		else
		{
			document.getElementById("sp3").innerText="两次密码不一致！！！";
		}

	}


</script>

<script>
	layui.use('form', function(){
		var form = layui.form;
		form.on('submit(formDemo)', function(data)
		{
			var sp1=document.getElementById("sp1").innerText;
			var sp2=document.getElementById("sp2").innerText;
			var sp3=document.getElementById("sp3").innerText;
			var sp4=document.getElementById("sp4").innerText;

			var password=document.getElementById("password").value;
			var password2=document.getElementById("password2").value;




			if(sp1.length + sp2.length + sp3.length + sp4.length>0)
			{
				layer.alert("请填写正确信息",{icon:5});
			}
			else if(!(password === password2))
			{
				layer.alert("两次密码不一致",{icon:5});
			}
			else
			{
				$.ajax({
					type:'POST',
					url:'<%=path+"user/reg"%>',
					data:$('#myForm').serialize(),
					success:function(msg)
					{
						if(msg==="yes")
						{
							layer.open({
								title: ['温馨提示'],
								content: '注册成功',
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
							layer.alert("注册失败，请重试", {icon: 5});
						}
					},
					error:function ()
					{
						layer.alert("服务器正忙.....", {icon: 5});
					}
				});

			}

			return false;
		});

	});
</script>

</body>
</html>
