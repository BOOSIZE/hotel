<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/22
  Time: 23:57
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
    <title>员工管理</title>
    <link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
    <script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
    <script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-inline">
            <select name="urole" >
                <option value=""></option>
                <option value="3">经理</option>
                <option value="2">员工</option>
            </select>
        </div>
        <div class="layui-input-inline">
            <button class="layui-btn" lay-submit lay-filter="formDemo">搜索</button>
        </div>
    </div>

</form>
<button class="layui-btn" id="add">新增</button>
<table id="userinfo" ></table>

<script type="text/html" id="adduser">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">账号:</label>
            <div class="layui-input-inline">
                <input type="text" name="account" lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别:</label>
            <div class="layui-input-inline">
                <input type="radio" name="usex" value="男" title="男" checked>
                <input type="radio" name="usex" value="女" title="女" >
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">姓名:</label>
            <div class="layui-input-inline">
                <input type="text"  lay-verify="required" placeholder="请输入你的姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色</label>
            <div class="layui-input-inline">
                <select name="urole" >
                    <option value="3">经理</option>
                    <option value="2">员工</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <button class="layui-btn" lay-submit lay-filter="addUser">新增</button>
            </div>
        </div>
    </form>
</script>
<script type="text/html" id="xuhao">
    {{d.LAY_TABLE_INDEX+1}}
</script>
<script type="text/html" id="bar">
    {{#  if(d.urole==='2' ){ }}
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
    {{#  } }}

</script>
<script>
    layui.use(['jquery','layer','form','table'], function(){
        var $ = layui.jquery;
        var layer=layui.layer;
        var form=layui.form;
        var table=layui.table;

        table.render({
            elem: '#userinfo'
            ,id: "testReload"
            // ,height: 312
            ,url: '<%=path+"user/userOpe"%>' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {title: '序号',templet: '#xuhao'}
                ,{field: 'account', title: '账号'}
                ,{field: 'uname', title: '姓名'}
                ,{field: 'usex', title: '性别'}
                ,{field: 'udate', title: '注册时间'}
                ,{field: 'urole', title: '角色'}
                , {title: '操作', width: '15%', toolbar: "#bar", align: 'center'}
            ]]
        });

        form.on('submit(formDemo)', function (data) {
            table.reload('testReload',
                {
                    page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    ,where: {
                            urole: data.field.urole
                        }
                });
            return false;
        });


        $('#add').click(function () {
            layer.open({
                type: 2,
                title:'添加管理员',
                skin: 'layui-layer-rim', //加上边框
                maxmin: true, //开启最大化最小化按钮
                area: ['600px', '400px'],
                content:$('#adduser')
            });
        });
    });


</script>
</body>
</html>
