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
    <title>订单管理（前台）</title>
    <link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
    <script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
    <script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">订单状态</label>
        <div class="layui-input-inline">
            <select name="urole">
                <option value=""></option>
                <option value="预定">预定</option>
                <option value="入住">入住</option>
                <option value="退房">退房</option>
            </select>
        </div>
        <div class="layui-input-inline">
            <button class="layui-btn" lay-submit lay-filter="formDemo">搜索</button>
            <button class="layui-btn" lay-submit lay-filter="back">回到主页</button>
        </div>
    </div>
</form>


<input type="hidden" value="${sessionScope.user.account}" id="user">
<table id="userinfo" lay-filter="userinfo"></table>

<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="back_one">查看详情</a>
</script>
<script>
    layui.use(['jquery', 'layer', 'form', 'table'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var userAccount = $("#user").val();
        table.render({
            elem: '#userinfo'
            // , id: "testReload"
            // ,height: 312
            , url: '/back/order/all/list?account=' + userAccount//数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {title: '序号', type: 'numbers', width: '5%'}
                , {field: 'oid', hide: true, title: 'ID'}
                , {field: 'tname', title: '房间类型'}
                , {field: 'omoney', title: '价格'}
                , {field: 'otype', title: '房间状态'}
                , {field: 'oday', title: '入住天数'}
                , {field: 'opeople', title: '入住人数'}
                , {field: 'otime', title: '预定时间'}
                , {field: 'oend', title: '退房时间'}
                , {title: '操作', width: '15%', toolbar: "#bar", align: 'center'}
            ]]
        });

        form.on('submit(formDemo)', function (data) {
            table.reload('userinfo',
                {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        urole: data.field.urole
                    }
                });
            return false;
        });

        //监听工具条
        table.on('tool(userinfo)', function (obj) {
            var data = obj.data;//获取点击行数据
            if (obj.event === 'back_one') {
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
                        if ("入住" == data.otype||"退房" == data.otype) {
                            $('#num').text(detail.rnum);
                        } else {
                            $('#num').text('未入住');
                        }
                        $('#price').text(data.omoney);
                        $('#preTime').text(data.otime);
                        if (data.oend != null) {
                            $('#loseTime').text(data.oend);
                        }

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
<script>
    layui.use('form', function () {
        var form = layui.form;
        form.on('submit(back)', function (data) {
            window.location.href = "<%=path+"go/to/main2"%>";
            return false;
        });
    });
</script>

<script type="text/html" id="adduser">
    <div>
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
            <label class="layui-form-label">房间号:</label>
            <label class="layui-form-label" id="num"></label>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格:</label>
            <label class="layui-form-label" id="price"></label>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">预定时间:</label>
            <label class="layui-form-label" id="preTime"></label>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">退房时间:</label>
            <label class="layui-form-label" id="loseTime">未退房</label>
        </div>
    </div>
</script>
</body>
</html>
