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
    <title>预住单</title>
    <link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
    <script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
    <script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body>
<table id="userinfo" lay-filter="userinfo"></table>

<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="back_one">入住</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="back_two">查看详情</a>
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
                , {field: 'oid', hide: true, title: 'ID'}
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
                $.ajax({
                    url: '<%=path+"back/order/detail"%>',
                    type: "GET",
                    data: {
                        oid: data.oid
                    },
                    dataType: 'json',
                    success: function (result) {
                        var detail = result["orderDetail"];
                        $('#name').text(detail.pname);
                        $('#idCard').text(detail.pcode);
                        $('#sex').text(detail.psex);
                        $('#type').text(data.tname);
                        $('#price').text(data.omoney);
                        $('#preTime').text(data.otime);
                    }
                });

                layer.open({
                    type: 1 //Page层类型
                    , area: ['450px', '520px']
                    , title: '订单详情'
                    , shade: 0.3 //遮罩透明度
                    , anim: 4 //0-6的动画形式，-1不开启
                    , content: $("#adduser").html()
                });
            }
        });
    });
</script>

<script type="text/html" id="adduser">
    <div>
        <div class="layui-form-item">
            <label class="layui-form-label">预订人账号:</label>
            <label class="layui-form-label" id="account"></label>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名:</label>
            <label class="layui-form-label" id="name"></label>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">身份证:</label>
            <label class="layui-form-label" id="idCard"></label>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别:</label>
            <label class="layui-form-label" id="sex"></label>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">房间类型:</label>
            <label class="layui-form-label" id="type"></label>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格:</label>
            <label class="layui-form-label" id="price"></label>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">预定时间:</label>
            <label class="layui-form-label" id="preTime"></label>
        </div>
    </div>
</script>
</body>
</html>
