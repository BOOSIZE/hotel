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
    <title>公告栏管理</title>
    <link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
    <script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
    <script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body>
<input type="hidden" value="${sessionScope.user.account}" id="user">
<form class="layui-form" action="">
    <div class="layui-input-inline">
        <button class="layui-btn" id="add">新增</button>
    </div>
</form>
<table id="userinfo" lay-filter="userinfo"></table>
<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="back_one">删除</a>
</script>
<script>
    layui.use(['jquery', 'layer', 'form', 'table'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;

        table.render({
            elem: '#userinfo'
            , url: '<%=path+"board/back/list"%>' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {title: '序号', type: 'numbers', width: '5%'}
                , {field: 'uname', title: '发布者'}
                , {field: 'content', title: '内容'}
                , {field: 'time', title: '发布时间'}
                , {title: '操作', width: '15%', toolbar: "#bar", align: 'center'}
            ]]
        });

        //监听工具条
        table.on('tool(userinfo)', function (obj) {
            console.log(obj)
            var data = obj.data;//获取点击行数据
            if (obj.event === 'back_one') {
                layer.confirm('您确认要删除该条公告吗?', function (index) {
                    $.ajax({
                        url: '<%=path+"board/back/delete"%>',
                        type: "POST",
                        data: data,
                        dataType: 'text',
                        success: function (result) {
                            if (result === 'true') {
                                layer.alert('删除成功');
                                layer.closeAll('page');
                                table.reload('userinfo');
                            } else if (result === 'false') {
                                layer.alert('删除失败');
                            }
                        }
                    });
                });
            }
        });

        $('#add').click(function () {
            layer.open({
                type: 1 //Page层类型
                , area: ['400px', '350px']
                , title: '新增公告'
                , shade: 0.3 //遮罩透明度
                , anim: 4 //0-6的动画形式，-1不开启
                , content: $("#adduser").html()
            });
            form.render();
            form.on('submit(addUser)', function (data) {
                    if (data.field.content.length < 5 || data.field.content.length > 30) {
                        layer.msg("请将字数控制在5-30个字之间");
                    } else {
                        layer.confirm('确认新增该条公告吗', function (index) {
                            var account = $('#user').val();
                            var content = $('#content').val();
                            $.ajax({
                                url: '<%=path+"board/back/insert"%>',
                                type: "POST",
                                data: {
                                    account: account,
                                    content: content,
                                },
                                dataType: 'text',
                                success: function (result) {
                                    if (result === 'true') {
                                        layer.alert('新增成功');
                                        layer.closeAll('page');
                                        table.reload('userinfo');
                                    } else if (result === 'false') {
                                        layer.alert('新增失败');
                                    }
                                    $('content').val('');
                                }
                            });
                        });
                    }
                    return false;
                }
            );
            return false;
        });
    });
</script>
</body>
<script type="text/html" id="adduser">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <br>
            <label class="layui-form-label">公告内容:</label>
            <div class="layui-input-inline">
                <br>
                <textarea cols="30" rows="10" name="content" lay-verify="required"
                          id="content" placeholder="请将公告内容限制在5-30个字符"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline" style="margin-left: 25%">
                <button class="layui-btn" lay-submit lay-filter="addUser">保存</button>
            </div>
        </div>
    </form>
</script>
</html>
