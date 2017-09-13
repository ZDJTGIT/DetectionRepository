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


    <title>H+ 后台主题UI框架 - 基本图库</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="assets/js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link href="assets/css/animate.min.css" rel="stylesheet">
    <link href="assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Fancybox <small>http://fancybox.net/</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="basic_gallery.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="basic_gallery.html#">选项1</a>
                                </li>
                                <li><a href="basic_gallery.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <a class="fancybox" href="img/p1.jpg" title="图片1">
                            <img alt="image" src="img/p_big1.jpg" />
                        </a>
                        <a class="fancybox" href="img/p2.jpg" title="图片2">
                            <img alt="image" src="img/p_big2.jpg" />
                        </a>
                        <a class="fancybox" href="img/p3.jpg" title="图片3">
                            <img alt="image" src="img/p_big3.jpg" />
                        </a>
                        <a class="fancybox" href="img/p1.jpg" title="图片4">
                            <img alt="image" src="img/p_big1.jpg" />
                        </a>
                        <a class="fancybox" href="img/p2.jpg" title="图片5">
                            <img alt="image" src="img/p_big2.jpg" />
                        </a>
                        <a class="fancybox" href="img/p3.jpg" title="图片6">
                            <img alt="image" src="img/p_big3.jpg" />
                        </a>
                        <a class="fancybox" href="img/p1.jpg" title="图片7">
                            <img alt="image" src="img/p_big1.jpg" />
                        </a>
                        <a class="fancybox" href="img/p2.jpg" title="图片8">
                            <img alt="image" src="img/p_big2.jpg" />
                        </a>
                        <a class="fancybox" href="img/p1.jpg" title="图片9">
                            <img alt="image" src="img/p_big1.jpg" />
                        </a>
                        <a class="fancybox" href="img/p2.jpg" title="图片10">
                            <img alt="image" src="img/p_big2.jpg" />
                        </a>
                        <a class="fancybox" href="img/p3.jpg" title="图片11">
                            <img alt="image" src="img/p_big3.jpg" />
                        </a>
                        <a class="fancybox" href="img/p1.jpg" title="图片12">
                            <img alt="image" src="img/p_big1.jpg" />
                        </a>
                        <a class="fancybox" href="img/p2.jpg" title="图片13">
                            <img alt="image" src="img/p_big2.jpg" />
                        </a>
                        <a class="fancybox" href="img/p3.jpg" title="图片14">
                            <img alt="image" src="img/p_big3.jpg" />
                        </a>
                        <a class="fancybox" href="img/p1.jpg" title="图片15">
                            <img alt="image" src="img/p_big1.jpg" />
                        </a>
                        <a class="fancybox" href="img/p2.jpg" title="图片16">
                            <img alt="image" src="img/p_big2.jpg" />
                        </a>


                    </div>
                </div>
            </div>

        </div>
    </div>
    <script src="assets/js/jquery.min.js?v=2.1.4"></script>
    <script src="assets/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="assets/js/plugins/peity/jquery.peity.min.js"></script>
    <script src="assets/js/content.min.js?v=1.0.0"></script>
    <script src="assets/js/plugins/fancybox/jquery.fancybox.js"></script>
    <script>
        $(document).ready(function(){$(".fancybox").fancybox({openEffect:"none",closeEffect:"none"})});
    </script>

    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>
