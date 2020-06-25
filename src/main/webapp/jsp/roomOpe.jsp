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
    <title>房间管理</title>
    <link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
    <script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
    <script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">房间类型</label>
        <div class="layui-input-inline">
            <select name="tname">
                <option value="">请选择房间类型</option>

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

<table id="typeinfo" lay-filter="typeinfo"></table>

<script type="text/html" id="addroom">
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
                <button class="layui-btn" lay-submit lay-filter="addRoom">新增</button>
            </div>
        </div>
    </form>
</script>
<script type="text/html" id="xuhao">
    {{d.LAY_TABLE_INDEX+1}}
</script>
<%--<script type="text/html" id="bar">--%>
<%--    {{#  if(d.urole==='2' ){ }}--%>
<%--    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>--%>
<%--    {{#  } }}--%>

<%--</script>--%>
<script>
    layui.use(['jquery', 'layer', 'form', 'table'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;

        table.render({
            elem: '#typeinfo'
            // , id: "testReload"
            // ,height: 312
            , url: '<%=path+"room/roomOpe"%>' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {title: '序号', templet: '#xuhao'}
                , {field: 'img', title: '房间图片'}
                , {field: 'tname', title: '房间类型'}
                , {field: 'tpeople', title: '入住人数上限'}
                , {field: 'roomNum', title: '房间号'}
                , {field: 'amt', title: '价格'}
                , {
                    field: 'roomState', title: '房间状态', templet: function (d) {
                        if (d.roomState == '0') {
                            return '未入住';
                        } else if (d.roomState == '1') {
                            return '已入住';
                        }
                    }
                }
                // , {title: '操作', width: '15%', toolbar: "#bar", align: 'center'}
            ]]
        });


        // //监听工具条
        // table.on('tool(typeinfo)', function (obj) {
        //     console.log(obj)
        //     var data = obj.data;//获取点击行数据
        //     if (obj.event === 'delete') {
        //         layer.confirm('确认删除该员工吗?', function (index) {
        //
        //             $.ajax({
        //                 url: "/user/delUser",
        //                 type: "POST",
        //                 data: data,
        //                 dataType: 'text',
        //                 success: function (result) {
        //                     if (result === 'true') {
        //                         layer.alert("删除成功");
        //                         table.reload('userinfo');
        //                     } else {
        //                         layer.alert('删除失败');
        //                     }
        //                 }
        //             });
        //         });
        //     }
        // });

        form.on('submit(formDemo)', function (data) {
            table.reload('typeinfo',
                {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        tname: data.field.tname
                    }
                });
            return false;
        });

        $('#add').click(function () {
            layer.open({
                type: 1 //Page层类型
                , area: ['400px', '350px']
                , title: '新增房间'
                , shade: 0.3 //遮罩透明度
                , anim: 4 //0-6的动画形式，-1不开启
                , content: $("#adduser").html()
            });
            form.render();

            form.on('submit(addRoom)', function (data) {
                    console.log(data.field)
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
                                url: '<%=path+"room/addRoom"%>',
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
