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

<table id="typeinfo" lay-filter="typeinfo"></table>

<script type="text/html" id="addtype">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">房间图片</label>
            <div class="layui-input-block">
                <button type="button" class="layui-btn" id="upload1">上传图片</button>
                <input type="hidden" id="img_url" name="img" value=""/>
                <div class="layui-upload-list">
                    <img class="layui-upload-img" width="100px" height="80px" id="demo1"/>
                    <p id="demoText"></p>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">房间类型:</label>
            <div class="layui-input-inline">
                <input type="text" name="tname" lay-verify="required" placeholder="请输入房间类型" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">房间价格:</label>
            <div class="layui-input-inline">
                <input name="amt" type="text" lay-verify="required" placeholder="请输入房间价格" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">可入住人数</label>
            <div class="layui-input-inline">
                <select name="tpeople">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">房间床位数</label>
            <div class="layui-input-inline">
                <select name="tcount">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline" style="margin-left: 25%">
                <button class="layui-btn" lay-submit lay-filter="addType">新增</button>
            </div>
        </div>
    </form>
</script>
<%--<script type="text/html" id="updatetype">--%>
<%--    <form class="layui-form" action="">--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">房间图片</label>--%>
<%--            <div class="layui-input-block">--%>
<%--                <button type="button" class="layui-btn" id="upload1">上传图片</button>--%>
<%--                <input type="hidden" id="img_url" name="img" value=""/>--%>
<%--                <div class="layui-upload-list">--%>
<%--                    <img class="layui-upload-img" width="100px" height="80px" id="demo1"/>--%>
<%--                    <p id="demoText"></p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">房间类型:</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="text" name="tname" lay-verify="required" placeholder="请输入房间类型" autocomplete="off"--%>
<%--                       class="layui-input">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">房间价格:</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input name="amt" type="text" lay-verify="required" placeholder="请输入房间价格" autocomplete="off"--%>
<%--                       class="layui-input">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">可入住人数</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <select name="tpeople">--%>
<%--                    <option value="1">1</option>--%>
<%--                    <option value="2">2</option>--%>
<%--                    <option value="3">3</option>--%>
<%--                </select>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">房间床位数</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <select name="tcount">--%>
<%--                    <option value="1">1</option>--%>
<%--                    <option value="2">2</option>--%>
<%--                    <option value="3">3</option>--%>
<%--                </select>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <div class="layui-input-inline" style="margin-left: 25%">--%>
<%--                <button class="layui-btn" lay-submit lay-filter="addType">新增</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</script>--%>
<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-xs" lay-event="update">修改</a>
</script>
<script>
    layui.use(['form'], function () {
        var form = layui.form;

        //ajax
        window.onload = function f() {
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
        }
    })
</script>
<script>
    layui.use(['jquery', 'layer', 'form', 'table', 'upload'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var upload = layui.upload;


        <%--table.render({--%>
        <%--    elem: '#typeinfo'--%>
        <%--    // , id: "testReload"--%>
        <%--    // ,height: 312--%>
        <%--    , url: '<%=path+"type/typeOpe"%>' //数据接口--%>
        <%--    , page: true //开启分页--%>
        <%--    , limit: 5--%>
        <%--    , limits: [5]--%>
        <%--    , cols: [[ //表头--%>
        <%--        {title: '序号', type: 'numbers'}--%>
        <%--        , {field: 'img', title: '房间图片'}--%>
        <%--        , {field: 'tname', title: '房间类型'}--%>
        <%--        , {field: 'tpeople', title: '入住人数上限'}--%>
        <%--        , {field: 'roomnum', title: '房间号'}--%>
        <%--        , {field: 'amt', title: '房间价格'}--%>
        <%--        , {--%>
        <%--            field: 'roomstate', title: '房间状态', templet: function (d) {--%>
        <%--                if (d.roomstate == '0') {--%>
        <%--                    return '未入住';--%>
        <%--                } else if (d.roomstate == '1') {--%>
        <%--                    return '已入住';--%>
        <%--                }--%>
        <%--            }--%>
        <%--        }--%>
        <%--        // , {title: '操作', width: '15%', toolbar: "#bar", align: 'center'}--%>
        <%--    ]]--%>
        <%--});--%>
        table.render({
            elem: '#typeinfo'
            // , id: "testReload"
            // ,height: 312
            , url: '<%=path+"type/typeOpe"%>' //数据接口
            , page: true //开启分页
            , limit: 5
            , limits: [5]
            , cols: [[ //表头
                {title: '序号', type: 'numbers'}
                , {field: 'img', title: '房间图片', width: 90,templet:'<div><img  src="{{ d.img }}"></div>'}
                // , {field: 'img', title: '房间图片'}
                , {field: 'tname', title: '房间类型'}
                , {field: 'tpeople', title: '可入住人数'}
                , {field: 'tcount', title: '房间床位数'}
                , {field: 'amt', title: '房间价格'}
                // , {
                //     field: 'roomstate', title: '房间状态', templet: function (d) {
                //         if (d.roomstate == '0') {
                //             return '未入住';
                //         } else if (d.roomstate == '1') {
                //             return '已入住';
                //         }
                //     }
                // }
                , {title: '操作', width: '15%', toolbar: "#bar", align: 'center'}
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
                , area: ['400px', '500px']
                , title: '新增房间类型'
                , shade: 0.3 //遮罩透明度
                , anim: 4 //0-6的动画形式，-1不开启
                , content: $("#addtype").html()
            });
            form.render();


            var uploadInst = upload.render({
                elem: '#upload1' //绑定元素
                , url: '<%=path+"type/addImg"%>' //上传接口
                , before: function (obj) {
                    //预读本地文件示例，不支持ie8
                    obj.preview(function (index, file, result) {
                        $('#demo1').attr('src', result); //图片链接（base64）
                    });
                }
                , done: function (res) {
                    //如果上传失败
                    if (res == null) {
                        return layer.msg('上传失败');
                    } else {
                        document.getElementById("img_url").value = res.url;
                    }

                }
                , error: function () {
                    //演示失败状态，并实现重传
                    var demoText = $('#demoText');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function () {
                        uploadInst.upload();
                    });
                }
            });


            form.on('submit(addType)', function (data) {

                if (data.field.tname.length < 5 || data.field.tname.length > 10) {
                    layer.msg("类型名称在5~10位");
                } else if (!/^[0-9]*$/.test(data.field.amt)) {
                    layer.msg("价格必须为整数");
                } else if (data.field.amt < 100 || data.field.amt > 1000) {
                    layer.msg("价格范围100~1000之间");
                } else {
                    layer.confirm('确认新增房间类型吗？', function (index) {
                        $.ajax({
                            url: '<%=path+"type/addType"%>',
                            type: "POST",
                            data: data.field,
                            dataType: 'text',
                            success: function (result) {
                                if (result === 'true') {
                                    layer.alert('新增成功');
                                    layer.closeAll('page');
                                    table.reload('typeinfo');
                                } else if (result === 'false') {
                                    layer.alert('新增失败');
                                } else if (result === 'have') {
                                    layer.alert('已有此房间类型，请重新新增');
                                }

                            }
                        });
                    });
                }
                return false;
            });
            return false;
        });
    });


</script>
</body>
</html>
