<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>聊天窗口</title>
    <meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
	<meta name="description" content="中大检测平台">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="assets/css/plugins/jsTree/style.min.css" rel="stylesheet">

</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">

        <div class="row">
            <div class="col-sm-12">

                <div class="ibox chat-view">

                    <div class="ibox-title">
                        <small class="pull-right text-muted">最新消息：2015-02-02 18:39:23</small> 聊天窗口
                    </div>


                    <div class="ibox-content">

                        <div class="row">

                            <div class="col-md-9 ">
                                <div class="chat-discussion">

                                    <div class="chat-message">
                                        <img class="message-avatar" src="img/a1.jpg" alt="">
                                        <div class="message">
                                            <a class="message-author" href="#"> 颜文字君</a>
                                            <span class="message-date"> 2015-02-02 18:39:23 </span>
                                            <span class="message-content">
											H+ 是个好框架
                                            </span>
                                        </div>
                                    </div>
                                    <div class="chat-message">
                                        <img class="message-avatar" src="img/a4.jpg" alt="">
                                        <div class="message">
                                            <a class="message-author" href="#"> 林依晨Ariel </a>
                                            <span class="message-date">  2015-02-02 11:12:36 </span>
                                            <span class="message-content">
											jQuery表单验证插件 - 让表单验证变得更容易
                                            </span>
                                        </div>
                                    </div>
                                    <div class="chat-message">
                                        <img class="message-avatar" src="img/a2.jpg" alt="">
                                        <div class="message">
                                            <a class="message-author" href="#"> 谨斯里 </a>
                                            <span class="message-date">  2015-02-02 11:12:36 </span>
                                            <span class="message-content">
											验证日期格式(类似30/30/2008的格式,不验证日期准确性只验证格式
                                            </span>
                                        </div>
                                    </div>
                                    <div class="chat-message">
                                        <img class="message-avatar" src="img/a5.jpg" alt="">
                                        <div class="message">
                                            <a class="message-author" href="#"> 林依晨Ariel </a>
                                            <span class="message-date">  2015-02-02 - 11:12:36 </span>
                                            <span class="message-content">
											还有约79842492229个Bug需要修复
                                            </span>
                                        </div>
                                    </div>
                                    <div class="chat-message">
                                        <img class="message-avatar" src="img/a6.jpg" alt="">
                                        <div class="message">
                                            <a class="message-author" href="#"> 林依晨Ariel </a>
                                            <span class="message-date">  2015-02-02 11:12:36 </span>
                                            <span class="message-content">
											九部令人拍案叫绝的惊悚悬疑剧情佳作】如果你喜欢《迷雾》《致命ID》《电锯惊魂》《孤儿》《恐怖游轮》这些好片，那么接下来推荐的9部同类题材并同样出色的的电影，绝对不可错过哦~

                                            </span>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <div class="col-md-3">
                                <div class="chat-users">


                                    <div class="users-list">
                                        <div class="chat-user">
                                            <img class="chat-avatar" src="img/a4.jpg" alt="">
                                            <div class="chat-user-name">
                                                <a href="#">伤城Simple</a>
                                            </div>
                                        </div>
                                        <div class="chat-user">
                                            <img class="chat-avatar" src="img/a1.jpg" alt="">
                                            <div class="chat-user-name">
                                                <a href="#">从未出现过的风景__</a>
                                            </div>
                                        </div>
                                        <div class="chat-user">
                                            <span class="pull-right label label-primary">在线</span>
                                            <img class="chat-avatar" src="img/a2.jpg" alt="">
                                            <div class="chat-user-name">
                                                <a href="#">冬伴花暖</a>
                                            </div>
                                        </div>
                                        <div class="chat-user">
                                            <span class="pull-right label label-primary">在线</span>
                                            <img class="chat-avatar" src="img/a3.jpg" alt="">
                                            <div class="chat-user-name">
                                                <a href="#">ZM敏姑娘	</a>
                                            </div>
                                        </div>
                                        <div class="chat-user">
                                            <img class="chat-avatar" src="img/a5.jpg" alt="">
                                            <div class="chat-user-name">
                                                <a href="#">才越越</a>
                                            </div>
                                        </div>
                                        <div class="chat-user">
                                            <img class="chat-avatar" src="img/a6.jpg" alt="">
                                            <div class="chat-user-name">
                                                <a href="#">时光十年TENSHI</a>
                                            </div>
                                        </div>
                                        <div class="chat-user">
                                            <img class="chat-avatar" src="img/a2.jpg" alt="">
                                            <div class="chat-user-name">
                                                <a href="#">刘顰颖</a>
                                            </div>
                                        </div>
                                        <div class="chat-user">
                                            <span class="pull-right label label-primary">在线</span>
                                            <img class="chat-avatar" src="img/a3.jpg" alt="">
                                            <div class="chat-user-name">
                                                <a href="#">陈泳儿SccBaby</a>
                                            </div>
                                        </div>


                                    </div>

                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="chat-message-form">

                                    <div class="form-group">

                                        <textarea class="form-control message-input" name="message" placeholder="输入消息内容，按回车键发送"></textarea>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/content.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>