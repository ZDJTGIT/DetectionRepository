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


    <title>H+ 后台主题UI框架 - 文本对比</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <link href="assets/css/animate.min.css" rel="stylesheet">
    <link href="assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox ">
                        <div class="ibox-title">
                            <h5>文本对比插件</h5>
                        </div>

                        <div class="ibox-content">

                            <strong>jQuery.PrettyTextDiff</strong>
                            <p>
                                包含在Google的diff_match_patch库中
                                <br/>
                                您可以通过为要比对的文本添加<code>.original</code>和<code>.changed</code>来比对两段文字的差别。
                            </p>

                            <div class="well">
                                <h3 class="m-t-lg">标准示例</h3>

                                <div class="row diff-wrapper">
                                    <div class="col-md-4">
                                        <h4>原文本</h4>

                                        <div class="original">要对文本文件的进行比较的时候，可以考虑使用google-diff-match-patch，它可以进行比较、匹配和生成补丁的操作，这里将展示一个简单文本比较的例子。</div>
                                    </div>
                                    <div class="col-md-4">
                                        <h4>修改过的文本</h4>

                                        <div class="changed">要对文本进行比较的时候，可以考虑使用 google-diff-match-patch，它可以进行比较、匹配和生成补丁的操作，我们在这里展示一个简单的例子。首先我们必须接定好文本比较后的输出。假设我们有两段文本“123456789”和“012356889”，然后我们希望输出他们的“差异”，可是这个“差异”怎么表示呢？</div>
                                    </div>
                                    <div class="col-md-4">
                                        <h4>对比结果：</h4>

                                        <div class="diff1"></div>
                                    </div>
                                </div>
                            </div>

                            <h3 class="m-t-lg">作为函数参数</h3>
                            <p>
                                当文本域的文本发生变化时，自动实时输出结果。
                            </p>
                            <div class="row diff-wrapper2">
                                <div class="col-md-4">
                                    <h4>原文本</h4>
                                    <textarea class="form-control diff-textarea" id="original" rows="6">
百度新闻是包含海量资讯的新闻服务平台,真实反映每时每刻的新闻热点。您可以搜索新闻事件、人物动态、产品资讯等,快速了解它们的最新进展。
                                    </textarea>
                                </div>
                                <div class="col-md-4">
                                    <h4>对比结果：</h4>
                                    <div class="diff2"></div>
                                </div>
                                <div class="col-md-4">
                                    <h4>新文本</h4>
                                    <textarea class="form-control diff-textarea" id="changed" rows="6">
“百度新闻”是包含海量资讯的新闻服务性质的新闻平台，真实反映新闻热点。您可以搜索新闻事件、热点话题、人物动态、资讯等，快速了解它们的最新进展。
                                    </textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <script src="assets/js/jquery.min.js?v=2.1.4"></script>
    <script src="assets/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="assets/js/content.min.js?v=1.0.0"></script>
    <script src="assets/js/plugins/diff_match_patch/diff_match_patch.js"></script>
    <script src="assets/js/plugins/preetyTextDiff/jquery.pretty-text-diff.min.js"></script>
    <script>
        $(document).ready(function(){$(".diff-wrapper").prettyTextDiff({diffContainer:".diff1"});$(".diff-wrapper2").prettyTextDiff({originalContent:$("#original").val(),changedContent:$("#changed").val(),diffContainer:".diff2"});$(".diff-textarea").on("change keyup",function(){$(".diff-wrapper2").prettyTextDiff({originalContent:$("#original").val(),changedContent:$("#changed").val(),diffContainer:".diff2"})})});
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
