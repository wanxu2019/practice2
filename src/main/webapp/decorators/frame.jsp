<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%
    String basePath = "http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/";
    String appPath = "http://innovation.xjtu.edu.cn:80/InnovationToolsPlatform/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--<base href="<%=basePath%>"/>--%>
    <meta charset="UTF-8"/>
    <title><decorator:title/></title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
    <link href="<%=basePath%>assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/ace-modify.css"/>

    <script src="<%=basePath%>assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>assets/js/ace-extra.min.js"></script>


    <!--[if lte IE 8]>
    <script src="<%=basePath%>assets/js/excanvas.min.js"></script>
    <![endif]-->

    <script type="text/javascript">
        if ("ontouchend" in document) document.write("<script src='<%=basePath%>assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>
    <script src="<%=basePath%>assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>assets/js/typeahead-bs2.min.js"></script>

    <script src="<%=basePath%>assets/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="<%=basePath%>assets/js/jquery.ui.touch-punch.min.js"></script>
    <script src="<%=basePath%>assets/js/chosen.jquery.min.js"></script>
    <script src="<%=basePath%>assets/js/fuelux/fuelux.spinner.min.js"></script>
    <script src="<%=basePath%>assets/js/date-time/bootstrap-datepicker.min.js"></script>
    <script src="<%=basePath%>assets/js/date-time/bootstrap-timepicker.min.js"></script>
    <script src="<%=basePath%>assets/js/date-time/moment.min.js"></script>
    <script src="<%=basePath%>assets/js/date-time/daterangepicker.min.js"></script>
    <script src="<%=basePath%>assets/js/bootstrap-colorpicker.min.js"></script>
    <script src="<%=basePath%>assets/js/jquery.knob.min.js"></script>
    <script src="<%=basePath%>assets/js/jquery.autosize.min.js"></script>
    <script src="<%=basePath%>assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
    <script src="<%=basePath%>assets/js/jquery.maskedinput.min.js"></script>
    <script src="<%=basePath%>assets/js/bootstrap-tag.min.js"></script>

    <!-- ace scripts -->

    <script src="<%=basePath%>assets/js/ace-elements.min.js"></script>
    <script src="<%=basePath%>assets/js/ace.min.js"></script>


    <!-- custom js -->
    <%--<script type="text/javascript" src="../static/js/cookie.js"></script>--%>

    <decorator:head/>
</head>
<%
    String userName = (String) request.getAttribute("username");
%>
<body>


<!-- 页面顶部导航栏 -->
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a id="href0" href="<%=appPath%>appList" class="navbar-brand">
                <small><i
                        class="icon-leaf"></i> 小微企业多创新方法融合与集成应用平台
                </small>
            </a>
            <a id="href1" href="#" class="navbar-brand">
                <small>创新管理工具集
                </small>
            </a>
            <!-- /.brand -->
        </div>
        <!-- /.navbar-header -->
        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="grey">
                    <a id="href2" data-toggle="dropdown" href="<%=appPath%>appList" onclick="gotoHref(this)"
                       class="dropdown-toggle"> <img class="nav-user-photo"
                                                     src="<%=basePath%>assets/avatars/platform.png"
                                                     alt="Jason's Photo"/>
                        平台主页
                    </a>
                </li>
                <%
                    if (userName==null||userName.equals("anon")) {}
                    else{
                %>

                <li class="purple">
                    <a data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                       class="dropdown-toggle"> <img class="nav-user-photo"
                                                     src="<%=basePath%>assets/avatars/process.png" alt="Jason's Photo"/>
                        模板层
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul id="templateList"
                        class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/manage.png"
                                                             alt="Jason's Photo"/>
                                DMAIC模板
                            </a>
                        </li>
                        <li>
                            <a data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/manage.png"
                                                             alt="Jason's Photo"/>
                                知识工程模板
                            </a>
                        </li>
                        <li>
                            <a data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/manage.png"
                                                             alt="Jason's Photo"/>
                                价值流模板
                            </a>
                        </li>
                        <li>
                            <a data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/manage.png"
                                                             alt="Jason's Photo"/>
                                5S模板
                            </a>
                        </li>
                        <li>
                            <a data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/manage.png"
                                                             alt="Jason's Photo"/>
                                TRIZ模板
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="green">
                    <a data-toggle="dropdown" href="#"
                       class="dropdown-toggle"> <img class="nav-user-photo"
                                                     src="<%=basePath%>assets/avatars/tool.png" alt="Jason's Photo"/>
                        工具集
                        <i class="icon-caret-down"></i>
                    </a>

                    <ul
                            class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">

                        <li>
                            <a id="href3" data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/manage.png"
                                                             alt="Jason's Photo"/>
                                创新管理工具
                            </a>
                        </li>
                        <li>
                            <a id="href4" data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/knowledge.png"
                                                             alt="Jason's Photo"/>
                                创新知识服务
                            </a>
                        </li>
                        <li>
                            <a id="href5" data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/monitor.png"
                                                             alt="Jason's Photo"/>
                                创新方法导入与过程监控
                            </a>
                        </li>
                        <li>
                            <a id="href6" data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/assess.png"
                                                             alt="Jason's Photo"/>
                                创新方法评估
                            </a>
                        </li>
                        <li>
                            <a id="href7" data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/support.png"
                                                             alt="Jason's Photo"/>
                                产业链协同创新支持
                            </a>
                        </li>
                    </ul>
                </li>

                <%
                }
                %>
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#"
                       class="dropdown-toggle"> <img id="userAvatar" class="nav-user-photo"
                                                     src="<%=basePath%>assets/avatars/avatar2.png" alt="Jason's Photo"/> <span
                            class="user-info"> <small>欢迎光临,</small>
                        <%
                            if (userName==null||userName.equals("anon")) {
                        %>
                        匿名游客
                        <%
                        } else {
                        %>
                        ${username}
                        <%
                            }
                        %>
						</span> <i class="icon-caret-down"></i>
                    </a>
                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <%
                            if (userName==null||userName.equals("anon")) {
                        %>
                        <li><a href="#" onclick="gotoLogin()"> <i class="icon-key"></i>登录</a></li>
                        <li><a href="#" onclick="gotoRegister()"> <i class="icon-plus"></i>注册</a></li>
                        <%
                        } else {
                        %>
                        <li><a href="#" onclick="gotoUserInfo()"> <i class="icon-user"></i> 个人资料</a></li>
                        <li class="divider"></li>
                        <li><a onclick="logout()" style="cursor:pointer;"> <i class="icon-off"></i> 退出</a></li>
                        <%
                            }
                        %>
                    </ul>
                </li>
            </ul>
            <!-- /.ace-nav -->
        </div>
        <!-- /.navbar-header -->
    </div>
    <!-- /.container -->
</div>
<!-- END页面顶部导航栏 -->

<!-- 内容区域 -->
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'collapsed')
        } catch (e) {
        }
    </script>

    <!-- 主内容区域 -->
    <div class="main-container-inner">
        <!-- 导航栏 -->
        <!-- END导航栏 -->

        <!-- 主页面内容 -->
        <div class="main-content">
            <decorator:body/>
        </div>
        <!-- /.main-content -->
        <!-- END主页面内容 -->
    </div>
    <!-- /.main-container-inner -->
    <!-- END主内容区域 -->
    <div class="row-content col-lg-12 col-sm-4 col-xs-6">
        <div class="footer">
            <div class="footer-inner">
                <div class=" container  ">
                    <div class="row">
                        <div class="row-content col-lg-3 col-sm-2 col-xs-0">
                        </div>
                        <div class="row-content col-lg-6 col-sm-9 col-xs-12">
                            <ul>
										<span class="bigger-120">
										<span class="blue bolder" ><a href="http://innovation.xjtu.edu.cn/InnovationToolsPlatform/index">创新方法工具平台</a></span>
										</span>
										<span>
											Copyright&copy; 2017
										<span class="bigger-120 blue bolder">
											<a  href="http://cadcam.xjtu.edu.cn/">西安交通大学CAD/CAM研究室 </a>
										</span>
										</span>
                                &nbsp; &nbsp;
                                <div>
                                    备案号：闽ICP备15012807号-1
                                </div>
                            </ul>
                        </div>
                        <div class="row-content col-lg-3 col-sm-1 col-xs-0">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /.main-container -->

</div>
<!-- /.main-container -->
<!-- END内容区域 -->
<!-- inline scripts related to this page -->
</body>
<script>
    //var origin=document.location.origin;
    var origin="http://innovation.xjtu.edu.cn";
    function gotoHref(node) {
        document.location = node.href;
    }
    //初始化Hrefs
    function initTemplatesAndHrefs() {
        $.ajax({
            cache: true,
            type: "GET",
            url: origin+"/InnovationToolsPlatform/API/titleBarHrefs",
            data: {"username":"${username}"},// 你的formid
            async: false,
            error: function (request) {
                //alert("Connection error");
                console.log("远程获取模板信息与Hrefs失败！");
            },
            success: function (rawData) {
                data = JSON.parse(rawData);
                switch (data.status) {
                    case 0:
                        //console.log("data="+data.data);
                        data = JSON.parse(data.data);
                        //加载模板信息
                        if (data.templates.length > 0) {
                            //console.log("loading templates...");
                            $("#templateList li").remove();
                            var templates = $("#templateList");
                            for (var i = 0; i < data.templates.length; i++) {
                                templates.append("<li> <a data-toggle=\"dropdown\" href=\"" + data.templates[i].href + "\" onclick=\"gotoHref(this)\" class=\"dropdown-toggle\"> <img class=\"nav-user-photo\" src=\"" + data.templates[i].src + "\"/>"+data.templates[i].name+"</a></li>");
                            }
                        }
                        //加载Hrefs
                        //console.log("loading hrefs...");
                        for (var i = 0; i < data.hrefs.length&&i<data.hrefs_num; i++) {
                            $("#href" + i).attr("href", data.hrefs[i]);
                        }
                        //加载用户头像
                        //console.log("loading user avatar...");
                        $("#userAvatar").attr("src",data.user.avatar);
                        break;
                    case 1:
                        alert(data.message);
                        break;
                    default:

                        break;
                }
            }
        });
    }
    //用户登录
    function gotoLogin() {
        //注销匿名用户
        //刷新当前页
        var url= origin + "/InnovationToolsPlatform/logout?service=" + document.location.href;
        console.log("goto:"+url);
        document.location =url;
    }
    //用户注册
    function gotoRegister() {
        //注销匿名用户
        //前往注册页面
        var url= origin + "/InnovationToolsPlatform/logout?service=" + origin + "/InnovationToolsPlatform/user/register";
        console.log("goto:"+url);
        document.location =url;
    }
    //前往用户信息页面
    function gotoUserInfo() {
        var url= origin + "/InnovationToolsPlatform/user/userInfo";
        console.log("goto:"+url);
        document.location =url;
    }
    //用户退出
    function logout() {
        var url= origin + "/InnovationToolsPlatform/logout?service=" + origin + "/InnovationToolsPlatform/";
        console.log("goto:"+url);
        document.location =url;
    }
    initTemplatesAndHrefs();

</script>
</html>

