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
    String path = application.getContextPath() + "/";
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
<table id="userinfo" lay-filter="userinfo"></table>

<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="back_one">预留按钮1</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="back_two">预留按钮2</a>
</script>
<script>
    layui.use(['jquery', 'layer', 'form', 'table'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;

        table.render({
            elem: '#userinfo'
            // , id: "testReload"
            // ,height: 312
            , url: '<%=path+"back/order/pre/list"%>' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {title: '序号', type: 'numbers', width: '5%'}
                , {field: 'tname', title: '房间类型'}
                , {field: 'omoney', title: '价格'}
                , {field: 'oday', title: '入住天数'}
                , {field: 'opeople', title: '入住人数'}
                , {field: 'otime', title: '预定时间'}
                , {field: 'oend', title: '退房时间'}
                , {title: '操作', width: '15%', toolbar: "#bar", align: 'center'}
            ]]
        });


        //监听工具条
        table.on('tool(userinfo)', function (obj) {
            console.log(obj)
            var data = obj.data;//获取点击行数据
            if (obj.event === 'back_one') {
                layer.confirm('确认将订单进行入住吗', function (index) {
                    $.ajax({
                        url: "/back/order/checkIn",
                        type: "POST",
                        data: data,
                        dataType: 'text',
                        success: function (result) {
                            if (result === 'true') {
                                layer.alert("入住成功");
                                table.reload('userinfo');
                            } else {
                                layer.alert('入住失败');
                            }
                        }
                    });
                });
            }
            if (obj.event === 'back_two') {
                layer.confirm('预留按钮2?', function (index) {
                    alert("你的操作，唐狗");
                });
            }
        });
    });
</script>
</body>
</html>
