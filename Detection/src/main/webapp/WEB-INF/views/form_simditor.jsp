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
<!-- BEGIN HEAD -->
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H+ 后台主题UI框架 - 国产simditor富文本编辑器</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="assets/css/animate.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/plugins/simditor/simditor.css" />
    <link href="assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">

        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>国产simditor富文本编辑器</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_editors.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="form_editors.html#">选项1</a>
                                </li>
                                <li><a href="form_editors.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <textarea id="editor" placeholder="这里输入内容" autofocus>
                            <p>Simditor 是团队协作工具 <a href="http://tower.im/" target="_blank">Tower</a> 使用的富文本编辑器。</p>
                            <p>相比传统的编辑器它的特点是：</p>
                            <ul>
                                <li>功能精简，加载快速</li>
                                <li>输出格式化的标准 HTML</li>
                                <li>每一个功能都有非常优秀的使用体验</li>
                            </ul>
                            <p>兼容的浏览器：IE10+、Chrome、Firefox、Safari。</p>
                        </textarea>

                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">

                    <div class="ibox-content">

                        <h2>
                                Simditor简介
                            </h2>
                        <p>
                            Simditor是Tower开源的所见即所得的在线富文本编辑器。它是一款十分优秀的国产富文本编辑器。Simditor的理念是保持简单，避免过度的功能，每一个特性都追求极致的用户体验。同时，Simditor也很容易扩展。
                        </p>

                        <div class="alert alert-warning">
                            官网：<a href="http://simditor.tower.im/" target="_blank">http://simditor.tower.im/</a>
                            <br>GitHub：
                            <a href="https://github.com/mycolorway/simditor" target="_blank">https://github.com/mycolorway/simditor</a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js?v=2.1.4"></script>
    <script src="assets/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="assets/js/content.min.js?v=1.0.0"></script>
    <script type="text/javascript" src="assets/js/plugins/simditor/module.js"></script>
    <script type="text/javascript" src="assets/js/plugins/simditor/uploader.js"></script>
    <script type="text/javascript" src="assets/js/plugins/simditor/hotkeys.js"></script>
    <script type="text/javascript" src="assets/js/plugins/simditor/simditor.js"></script>
    <script>
        $(document).ready(function(){var editor=new Simditor({textarea:$("#editor"),defaultImage:"img/a9.jpg"})});
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
