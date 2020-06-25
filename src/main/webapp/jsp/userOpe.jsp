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
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-inline">
            <select name="urole">
                <option value=""></option>
                <option value="3">经理</option>
                <option value="2">员工</option>
            </select>
        </div>
        <div class="layui-input-inline">
            <button class="layui-btn" lay-submit lay-filter="formDemo">搜索</button>
        </div>
        <div class="layui-input-inline">
            <button class="layui-btn" id="add">新增</button>
        </div>
    </div>

</form>

<table id="userinfo" lay-filter="userinfo"></table>

<script type="text/html" id="adduser">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">账号:</label>
            <div class="layui-input-inline">
                <input type="text" name="account" lay-verify="required" placeholder="请输入账号" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别:</label>
            <div class="layui-input-inline">
                <input type="radio" name="usex" value="男" title="男" checked>
                <input type="radio" name="usex" value="女" title="女">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">姓名:</label>
            <div class="layui-input-inline">
                <input name="uname" type="text" lay-verify="required" placeholder="请输入你的姓名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色</label>
            <div class="layui-input-inline">
                <select name="urole">
                    <option value="3">经理</option>
                    <option value="2">员工</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline" style="margin-left: 25%">
                <button class="layui-btn" lay-submit lay-filter="addUser">新增</button>
            </div>
        </div>
    </form>
</script>

<script type="text/html" id="bar">
    {{#  if(d.urole==='2' ){ }}
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
    {{#  } }}

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
            , url: '<%=path+"user/userOpe"%>' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {title: '序号', type: 'numbers'}
                , {field: 'account', title: '账号'}
                , {field: 'uname', title: '姓名'}
                , {field: 'usex', title: '性别'}
                , {field: 'udate', title: '注册时间'}
                , {
                    field: 'urole', title: '角色', templet: function (d) {
                        if (d.urole === '3') {
                            return '经理';
                        } else if (d.urole === '2') {
                            return '员工';
                        }
                    }
                }
                , {title: '操作', width: '15%', toolbar: "#bar", align: 'center'}
            ]]
        });


        //监听工具条
        table.on('tool(userinfo)', function (obj) {
            console.log(obj)
            var data = obj.data;//获取点击行数据
            if (obj.event === 'delete') {
                layer.confirm('确认删除该员工吗?', function (index) {

                    $.ajax({
                        url: "/user/delUser",
                        type: "POST",
                        data: data,
                        dataType: 'text',
                        success: function (result) {
                            if (result === 'true') {
                                layer.alert("删除成功");
                                table.reload('userinfo');
                            } else {
                                layer.alert('删除失败');
                            }
                        }
                    });
                });
            }
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

        $('#add').click(function () {
            layer.open({
                type: 1 //Page层类型
                , area: ['400px', '350px']
                , title: '新增员工'
                , shade: 0.3 //遮罩透明度
                , anim: 4 //0-6的动画形式，-1不开启
                , content: $("#adduser").html()
            });
            form.render();

            form.on('submit(addUser)', function (data) {

                    if (data.field.account.length != 6) {
                        layer.msg("账号必须为6位");
                    } else if (!/^[0-9]*$/.test(data.field.account)) {
                        layer.msg("账号必须为纯数字");
                    } else if (data.field.uname.length < 2 || data.field.uname.length > 6) {
                        layer.msg("姓名必须2~6位");
                    } else {
                        data.field.account = 'yg' + data.field.account;
                        var urole = "经理";
                        if (data.field.urole == '2') {
                            urole = "员工";
                        }
                        layer.confirm('确认新增 角色:' + urole + ',账号:' + data.field.account + ',初始密码:000000的员工吗?', function (index) {
                            $.ajax({
                                url: '<%=path+"user/addUser"%>',
                                type: "POST",
                                data: data.field,
                                dataType: 'text',
                                success: function (result) {
                                    if (result === 'true') {
                                        layer.alert('新增成功');
                                        layer.closeAll('page');
                                        table.reload('userinfo');
                                    } else if (result === 'false') {
                                        layer.alert('新增失败');
                                    } else if (result === 'have') {
                                        layer.alert('已有此账号，请重新新增');
                                    }

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
</html>
