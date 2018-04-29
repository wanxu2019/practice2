<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>SIPOC</title>

    <!--前台css和js-->
    <link rel="stylesheet" href="/webresources/ace-master/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/webresources/ace-master/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="/webresources/ace-master/assets/font-awesome/4.5.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/webresources/ace-master/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="/webresources/ace-master/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="/webresources/ace-master/assets/css/fonts.googleapis.com.css"/>
    <link rel="stylesheet" href="../css/Extra.css"/>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/ace-extra.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/ace.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/jquery.dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/jquery-ui.custom.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/jquery.ui.touch-punch.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/ace-elements.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/jquery.mobile.custom.min.js"></script>
    <script type="text/javascript" src="/webresources/common/js/userLogin.js"></script>
    <!--获取服务器页面样式-->
    <link rel="import" id="frame" href="/webresources/common/html/appFrame.html">
    <link rel="import" id="local" href="../html/localHtml.html">


    <script src="../static/dependencies/excel/cpexcel.js"></script>
    <script src="../static/dependencies/excel/shim.js"></script>
    <script src="../static/dependencies/excel/jszip.js"></script>
    <script src="../static/dependencies/excel/xlsx.js"></script>
    <script src="http://cdn.static.runoob.com/libs/angular.js/1.4.6/angular.min.js"></script>
    <!-- FileSaver.js is the library of choice for Chrome -->
    <script type="text/javascript" src="../static/dependencies/excel/Blob.js"></script>
    <script type="text/javascript" src="../static/dependencies/excel/FileSaver.js"></script>
    <script type="text/javascript" src="../static/dependencies/dom-to-image.js"></script>

    <%--<script src="../static/js/detail.js"></script>--%>
    <style>
        .file {
            position: relative;
            display: inline-block;
            overflow: hidden;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
        }

        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }

        .file:hover {
            text-decoration: none;
        }

        table input {
            width: 75%;
            height:30px;
            margin-bottom:5px;
        }

        .main-content {
            margin-left: 0px;
        }

        div {
            margin-left: auto;
            margin-right: auto;
        }
        .modal-dialog{
            width:50%;
        }

    </style>
</head>

<body class="no-skin">
<!--嵌入导航栏-->
<div id="navbarDiv" class="navbar navbar-default"></div>
<div class="main-container ace-save-state" id="main-container">
    <!--嵌入侧边栏-->
    <div id="sidebarDiv" class="sidebar responsive ace-save-state"></div>
    <div class="main-content">
        <!--嵌入面包屑-->
        <div class="breadcrumbs ace-save-state" id="breadcrumbs"></div>
        <!--侧边栏对应内容-->
        <div class="tab-content">
            <!--项目管理-->
            <div class="tab-pane active" id="projectManagementDiv"></div>
            <!--主功能区-->
            <div class="tab-pane" id="mainFunctionDiv">
                <div id="mainBtnGroup" class="btn-group btn-group-sm">
                    <a type="button" class="btn btn-default btn-success" id="downloadModelFile" href="../template/sipoc_template.xls">
                        <span class="menu-icon fa fa-download"></span>下载模板
                    </a>

                    <a type="button" class="btn btn-default btn-success file" id="readFromFile">
                        <span class="glyphicon glyphicon-upload"></span>文件导入<input
                            id="xlf" type="file" name="xlfile"/>
                    </a>

                    <a type="button" class="btn btn-default btn-success" id="btnSaveToFile">
                        <span class="glyphicon glyphicon-download"></span>保存文件
                    </a>

                    <a type="button" class="btn btn-default btn-success"  id="btnDetailShow" >
                        <span class="glyphicon glyphicon-ok"></span>预览图片
                    </a>


                    <button type="button" class="btn btn-default btn-success" id="btnSaveToDb">
                        <span class="glyphicon glyphicon-cloud"></span>保存至云
                    </button>

                </div>
                <div style="display:none;">

                    <input id="check" value=<s:property default="空" value="#request.username"/>></input>
                </div>

                <div class="tabble">
                        <div class="row" style="margin-top:2.5em">

                            <div id="home" class="tab-pane active">


                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div id="dataTableWrapper" class="table-responsive">


                                        <input id="name" style="text-align:center;width:100%" value="${record.name}"/>


                                        <table id="dataTable"
                                               class="table table-striped table-bordered table-hover">
                                            <input id="recordId" value="${record.id}" style="display:none"/>
                                            <thead>
                                            <tr>
                                                <th>供应者
                                                    <button class="btn-sui  pull-right " id="btnAddS">添加</button>
                                                </th>
                                                <th>输入
                                                    <button class="btn-sui  pull-right " id="btnAddI">添加</button>
                                                </th>
                                                <th>流程
                                                    <button class="btn-sui  pull-right " id="btnAddP">添加</button>
                                                </th>
                                                <th>输出
                                                    <button class="btn-sui  pull-right " id="btnAddO">添加</button>
                                                </th>
                                                <th>用户
                                                    <button class="btn-sui  pull-right " id="btnAddC">添加</button>
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody id="sipoc_table">
                                            <tr>
                                                <!-- S -->
                                                <td width="20%">
                                                    <ul type="none">
                                                        <s:iterator value="sMessageList" id="msg" status="st">
                                                            <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                            <li>

                                                                <input id="input_s_<s:property value="#st.count-1"/>"
                                                                       value="<s:property value="msg"/>" />
                                                                &nbsp;
                                                                <button class="btn btn-danger btn-xs pull-right"
                                                                        onclick="javascript:delElement(this);">
                                                                    <i class="ace-icon fa fa-reply icon-only"> <i
                                                                            class="icon-trash icon-white"></i></i>
                                                                </button>

                                                            </li>
                                                        </s:iterator>
                                                    </ul>

                                                </td>
                                                <!-- I -->
                                                <td width="20%">
                                                    <ul type="none">
                                                        <s:iterator value="iMessageList" id="msg" status="st">
                                                            <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                            <li><input id="input_i_<s:property value="#st.count-1"/>"
                                                                       value="<s:property value="msg"/>"/>
                                                                &nbsp;
                                                                <button class="btn btn-danger btn-xs pull-right"
                                                                        onclick="javascript:delElement(this);">
                                                                    <i class="ace-icon fa fa-reply icon-only"><i
                                                                            class="icon-trash icon-white"></i></i>
                                                                </button>
                                                            </li>
                                                        </s:iterator>
                                                    </ul>

                                                </td>
                                                <!-- P -->
                                                <td width="20%">
                                                    <ul type="none">
                                                        <s:iterator value="pMessageList" id="msg" status="st">
                                                            <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                            <li><input id="input_p_<s:property value="#st.count-1"/>"
                                                                       value="<s:property value="msg"/>"/>
                                                                &nbsp;
                                                                <button class="btn btn-danger btn-xs pull-right"
                                                                        onclick="javascript:delElement(this);">
                                                                    <i class="ace-icon fa fa-reply icon-only"> <i
                                                                            class="icon-trash icon-white"></i></i>
                                                                </button>
                                                            </li>
                                                        </s:iterator>
                                                    </ul>

                                                </td>
                                                <!-- O -->
                                                <td width="20%">
                                                    <ul type="none">
                                                        <s:iterator value="oMessageList" id="msg" status="st">
                                                            <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                            <li><input id="input_o_<s:property value="#st.count-1"/>"
                                                                       value="<s:property value="msg"/>"/>
                                                                &nbsp;
                                                                <button class="btn btn-danger btn-xs pull-right"
                                                                        onclick="javascript:delElement(this);">
                                                                    <i class="ace-icon fa fa-reply icon-only"> <i
                                                                            class="icon-trash icon-white"></i></i>
                                                                </button>
                                                            </li>
                                                        </s:iterator>
                                                    </ul>

                                                </td>
                                                <!-- C -->
                                                <td width="20%">
                                                    <ul type="none">
                                                        <s:iterator value="cMessageList" id="msg" status="st">
                                                            <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                            <li><input id="sipoc_input_c<s:property value="#st.count-1"/>"
                                                                       value="<s:property value="msg"/>"/>
                                                                &nbsp;
                                                                <button class="btn btn-danger btn-xs pull-right"
                                                                        onclick="javascript:delElement(this);">
                                                                    <i class="ace-icon fa fa-reply icon-only"> <i
                                                                            class="icon-trash icon-white"></i></i>
                                                                </button>
                                                            </li>
                                                        </s:iterator>
                                                    </ul>

                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>


                                        <!-- /.table-responsive -->
                                    </div>


                                </div>
                            </div>


                            <%--************************************************************************************************************************************************************************ --%>
                        </div>
                    </div>


                <table id="exportTable" style="display:none">
                        <thead>
                        <tr>
                            <th>S</th>
                            <th>I</th>
                            <th>P</th>
                            <th>O</th>
                            <th>C</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td ng-model="a">aaaaaa</td>
                            <td>aaaaaa</td>
                            <td>aaaaaa</td>
                            <td>aaaaaa</td>
                            <td>aaaaaa</td>
                        </tr>
                        <tr>
                            <td>bbbbb</td>
                            <td>bbbbb</td>
                            <td>bbbbb</td>
                            <td>bbbbb</td>

                            <td>bbbbb</td>
                        </tr>
                        <tr>
                            <td>cccccccc</td>
                            <td>cccccccc</td>
                            <td>cccccccc</td>
                            <td>cccccccc</td>
                            <td>cccccccc</td>
                        </tr>
                        </tbody>
                    </table>


                    <%--测试用--%>
                    <%--<pre id="out"></pre>--%>
                    <%--<div id="htmlout"></div>--%>
                    <!-- 这是之后要放进detailShow.js里的代码 -->
                    <scripe>


                    </scripe>


                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close"
                                            data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        SIPOC预览
                                        <small>
                                            <button class="btn-sui pull-right" id="btnSaveAsPicture"><i
                                                class="icon-print icon-white"></i>&nbsp保存图片</button></small>
                                    </h4>


                                </div>

                                <div id="print">
                                    <div class="row">
                                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                        </div>
                                        <div id="detailShowName" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                        </div>
                                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                        </div>
                                    </div>

                                    <div class="row">


                                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                        </div>

                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                            <div id="showS" class="list-group">
                                                <a href="#" class="list-group-item active">
                                                    <h4 class="list-group-item-heading">供应者</h4>
                                                </a>
                                            </div>
                                        </div>


                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                            <div id="showI" class="list-group">
                                                <a href="#" class="list-group-item active">
                                                    <h4 class="list-group-item-heading">输入</h4>
                                                </a>

                                            </div>
                                        </div>


                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                            <div id="showP" class="list-group">
                                                <a href="#" class="list-group-item active">
                                                    <h4 class="list-group-item-heading">过程</h4>
                                                </a>

                                            </div>
                                        </div>


                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                            <div id="showO" class="list-group">
                                                <a href="#" class="list-group-item active">
                                                    <h4 class="list-group-item-heading">输出</h4>
                                                </a>
                                            </div>
                                        </div>


                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                            <div id="showC" class="list-group">
                                                <a href="#" class="list-group-item active">
                                                    <h4 class="list-group-item-heading">用户</h4>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                        </div>
                                    </div>

                                </div>


                            </div>
                        </div>
                    </div>


                </div>

            <!--word编辑区-->
            <div class="tab-pane" id="wordEditDiv"></div>
            <!--帮助页面-->
            <div class="tab-pane" id="helpDiv"></div>
        </div>
    </div>
    </div>
    <div style="display: none">
        <image id="picture"></image>
    </div>
    <!--footer-->
    <div class="footer" id="copyRightDiv"></div>
</div>
<!--模态框-->
<div id="modalFrameDiv"></div>
<script type="text/javascript" src="../js/buttonAction.js"></script>
<script type="text/javascript" src="../js/resultReport.js"></script>
<script src="../static/js/detail.js"></script>
</body>

</html>
