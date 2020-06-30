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
    <title>公告栏</title>
    <link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
    <script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
    <script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body style="background-image: url(<%=path+"images/beijing.jpg"%>);background-size: 100%">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>酒店公告板</legend>
</fieldset>

<div class="layui-carousel" id="test1" lay-filter="test1">
    <div carousel-item="">
        <div style="background: blueviolet"><span id="one">暂无公告</span></div>
        <div style="background: blueviolet" id="two">暂无公告</div>
        <div style="background: blueviolet" id="three">暂无公告</div>
        <div style="background: blueviolet" id="four">暂无公告</div>
        <div style="background: blueviolet" id="five">暂无公告</div>
    </div>
</div>
<script>
    layui.use(['carousel', 'form'], function () {
        var carousel = layui.carousel;

        //常规轮播
        carousel.render({
            elem: '#test1'
            , arrow: 'always'
            , width: '100%' //设置容器宽度
            //,anim: 'updown' //切换动画方式
        });

        window.onload = function () {
            $.ajax({
                url: '<%=path+"board/front/list"%>',
                type: "GET",
                dataType: 'text',
                success: function (result) {
                    var arr = jQuery.parseJSON(result).boardinfos;
                    if (arr != null) {
                        for (let i = 0; i <= arr.length; i++) {
                            if (i === 1) {
                                $('#one').html(arr.content);
                            } else if (i === 2) {
                                $('#two').val(arr.content);
                            } else if (i === 3) {
                                $('#three').val(arr.content);
                            } else if (i === 4) {
                                $('#four').val(arr.content);
                            } else if (i === 5) {
                                $('#five').val(arr.content);
                            }
                        }
                    }
                }
            });
        }
    });
</script>
</body>
</html>
