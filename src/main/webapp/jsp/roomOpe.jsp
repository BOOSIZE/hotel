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
    <title>房间类型管理</title>
    <link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
    <script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
    <script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">房间类型</label>
        <div class="layui-input-inline">
            <select id="tname" name="tname">
                <option value="">请选择房间类型</option>
            </select>
        </div>
        <div class="layui-input-inline" style="width: 80px">
            <button class="layui-btn" lay-submit lay-filter="formDemo">搜索</button>
        </div>
        <div class="layui-input-inline">
            <button class="layui-btn" id="add">新增</button>
        </div>
    </div>

</form>

<table id="roominfo" lay-filter="roominfo"></table>

<script type="text/html" id="addroom">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">房间类型</label>
            <div class="layui-input-inline">
                <select id="tname1" name="tname" lay-verify="required">
                    <option value="">请选择房间类型</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">房间号:</label>
            <div class="layui-input-inline" style="width: 50px;">
                <input name="floor" type="text" lay-verify="required" placeholder="楼层" autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-input-inline" style="width: 60px">
                <input name="num" type="text" lay-verify="required" placeholder="房间号" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-inline" style="margin-left: 25%">
                <button class="layui-btn" lay-submit lay-filter="addRoom">新增</button>
            </div>
        </div>
    </form>
</script>


<script type="text/html" id="updateroom">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">房间类型</label>
            <div class="layui-input-inline">
                <select id="tname2" name="tname" lay-verify="required">
                    <option value="">请选择房间类型</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">房间号:</label>
            <div class="layui-input-inline" style="width: 50px;">
                <input id="floor" name="floor" type="text" lay-verify="required" placeholder="楼层" autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-input-inline" style="width: 60px">
                <input id="num" name="num" type="text" lay-verify="required" placeholder="房间号" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-inline" style="margin-left: 25%">
                <button class="layui-btn" lay-submit lay-filter="updateRoom">修改</button>
            </div>
        </div>
    </form>
</script>

<script type="text/html" id="bar">
    {{#  if(d.rtype==='未入住' ){ }}
    <a class="layui-btn layui-btn-xs" lay-event="update">修改</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="update">删除</a>
    {{#  } }}
</script>
<script>
    layui.use(['form'], function () {
        var form = layui.form;

        //ajax
        // window.onload = function f() {
        $(function () {
            $('#tname').empty();
            $('#tname').append('<option value="">请选择房间类型</option>');

            $.ajax({
                type: "POST",
                url: '<%=path+"type/tname"%>',
                dataType: "text",
                sync: true,
                data: {},
                success: function (msg) {
                    var list = JSON.parse(msg);
                    for (var i = 0; i < list.length; i++) {
                        $('#tname').append('<option value="' + list[i] + '">' + list[i] + '</option>');
                    }
                    form.render();
                },
                error: function () {
                    layer.msg('服务器繁忙');
                }
            });
        });
    })
</script>
<script>
    layui.use(['jquery', 'layer', 'form', 'table', 'upload'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;


        table.render({
            elem: '#roominfo'
            // , id: "testReload"
            // ,height: 312
            , url: '<%=path+"room/roomOpe"%>' //数据接口
            , page: true //开启分页
            , limit: 5
            , limits: [5]
            , cols: [[ //表头
                {title: '序号', type: 'numbers'}
                , {field: 'tname', title: '房间类型'}
                , {field: 'rnum', title: '房间号码'}
                , {field: 'rtype', title: '房间状态'}

                , {title: '操作', width: '15%', toolbar: "#bar", align: 'center'}
            ]]
        });

        //监听工具条
        table.on('tool(roominfo)', function (obj) {

            var data = obj.data;//获取点击行数据
            if (obj.event === 'update') {
                $('#tname2').empty();
                var num;
                var floor;
                var tname = data.tname;
                var rid = data.rid;
                $.ajax({
                    type: "POST",
                    url: '<%=path+"type/tname"%>',
                    dataType: "text",
                    sync: true,
                    data: {},
                    success: function (msg) {
                        var list = JSON.parse(msg);
                        for (var i = 0; i < list.length; i++) {
                            $('#tname2').append('<option value="' + list[i] + '">' + list[i] + '</option>');
                        }
                        $("#tname2").each(function () {
                            // this代表的是<option></option>，对option再进行遍历
                            $(this).children("option").each(function () {
                                // 判断需要对那个选项进行回显
                                if (this.value == data.tname) {

                                    // 进行回显
                                    $(this).attr("selected", "selected");
                                }
                            });
                        })
                        var list = data.rnum.split('-');
                        $('#floor').val(list[0]);
                        $('#num').val(list[1]);
                        num = list[1];
                        floor = list[0];
                        form.render();
                    },
                    error: function () {
                        layer.msg('服务器繁忙');
                    }
                });

                layer.open({
                    type: 1 //Page层类型
                    , area: ['400px', '240px']
                    , title: '修改房间'
                    , shade: 0.3 //遮罩透明度
                    , anim: 4 //0-6的动画形式，-1不开启
                    , content: $("#updateroom").html()
                });
                form.render();


                // var
                form.on('submit(updateRoom)', function (data) {
                    data.field.rid = rid;
                    data.field.state = 1;
                    if (data.field.num == num && data.field.floor == floor && data.field.tname == tname) {
                        layer.msg("未作出修改");
                    } else {
                        if (data.field.tname != tname) {
                            data.field.state = 2;
                        }
                        if (!/^[0-9]*$/.test(data.field.floor)) {
                            layer.msg("楼层必须为整数");
                        } else if (data.field.floor < 1 || data.field.floor > 9) {
                            layer.msg("楼层范围1~9之间");
                        } else if (!/^[0-9]*$/.test(data.field.num)) {
                            layer.msg("房号必须为整数");
                        } else if (data.field.num < 101 || data.field.num > 999) {
                            layer.msg("房号范围101~999之间");
                        } else if (data.field.num.substring(0, 1) != data.field.floor) {
                            layer.msg("房号首位需要对应相应楼层");
                        } else {
                            layer.confirm('确认修改房间吗？', function (index) {
                                data.field.rnum = data.field.floor + "-" + data.field.num;

                                $.ajax({
                                    url: '<%=path+"room/updateRoom"%>',
                                    type: "POST",
                                    data: data.field,
                                    dataType: 'text',
                                    success: function (result) {
                                        if (result === 'true') {
                                            layer.alert('修改成功');
                                            layer.closeAll('page');
                                            table.reload('roominfo');
                                        } else if (result === 'false') {
                                            layer.alert('修改失败');
                                        } else if (result === 'have') {
                                            layer.alert('已有此房间号，请重新修改');
                                        }

                                    }
                                });
                            });
                        }
                        return false;
                    }
                    return false;
                });


            }
            if (obj.event === 'delete') {
                layer.confirm('确认删除房间吗？', function (index) {
                    $.ajax({
                        url: '<%=path+"room/deleteRoom"%>',
                        type: "POST",
                        data: data.field,
                        dataType: 'text',
                        success: function (result) {
                            if (result === 'true') {
                                layer.alert('删除成功');
                                layer.closeAll('page');
                                table.reload('roominfo');
                            } else if (result === 'have') {
                                layer.alert('已入住的房间不可删除');
                            } else {
                                layer.alert('删除失败');
                            }

                        }
                    });
                });
            }
        });

        form.on('submit(formDemo)', function (data) {
            table.reload('roominfo',
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
            $('#tname1').empty();
            $('#tname1').append('<option value="">请选择房间类型</option>');

            $.ajax({
                type: "POST",
                url: '<%=path+"type/tname"%>',
                dataType: "text",
                sync: true,
                data: {},
                success: function (msg) {
                    var list = JSON.parse(msg);
                    for (var i = 0; i < list.length; i++) {
                        $('#tname1').append('<option value="' + list[i] + '">' + list[i] + '</option>');
                    }
                    form.render();
                },
                error: function () {
                    layer.msg('服务器繁忙');
                }
            });
            layer.open({
                type: 1 //Page层类型
                , area: ['400px', '240px']
                , title: '新增房间'
                , shade: 0.3 //遮罩透明度
                , anim: 4 //0-6的动画形式，-1不开启
                , content: $("#addroom").html()
            });
            form.render();


            form.on('submit(addRoom)', function (data) {

                if (!/^[0-9]*$/.test(data.field.floor)) {
                    layer.msg("楼层必须为整数");
                } else if (data.field.floor < 1 || data.field.floor > 9) {
                    layer.msg("楼层范围1~9之间");
                } else if (!/^[0-9]*$/.test(data.field.num)) {
                    layer.msg("房号必须为整数");
                } else if (data.field.num < 101 || data.field.num > 999) {
                    layer.msg("房号范围101~999之间");
                } else if (data.field.num.substring(0, 1) != data.field.floor) {
                    layer.msg("房号首位需要对应相应楼层");
                } else {
                    layer.confirm('确认新增房间吗？', function (index) {
                        data.field.rnum = data.field.floor + "-" + data.field.num;

                        $.ajax({
                            url: '<%=path+"room/addRoom"%>',
                            type: "POST",
                            data: data.field,
                            dataType: 'text',
                            success: function (result) {
                                if (result === 'true') {
                                    layer.alert('新增成功');
                                    layer.closeAll('page');
                                    table.reload('roominfo');
                                } else if (result === 'false') {
                                    layer.alert('新增失败');
                                } else if (result === 'have') {
                                    layer.alert('已有此房间号，请重新新增');
                                }

                            }
                        });
                    });
                }
                return false;
            });
            return false;
        });
    })
    ;


</script>
</body>
</html>
